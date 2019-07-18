-- Functions to be created
-- new individual - provide a uuid
-- new enrolment - observations, dates etc
-- new encounter
-- new program encounter
-- clear data


-- Utility method to create observations.
-- Use typical names to create a json and send it over to create the obs that works for OpenCHS.
-- Example usage:
-- select create_obs('{
--   "Number of household members (eating together)": 10, // Numeric
--   "Relation to head of the family": [
--     "Self",
--     "Wife"
--   ], // Multi coded
--   "Caste (Free Text)": "Hindu" // Text field
-- }');
CREATE or replace FUNCTION create_obs(obs jsonb)
  returns jsonb AS $$
DECLARE
  merged_jsonb         JSONB;
  jsonb_to_be_inserted jsonb;
  key                  varchar;
  selected_concept     concept%ROWTYPE;
BEGIN
  merged_jsonb := '{}' :: JSONB;

  for key in (select *
              from jsonb_each(obs))
  loop
    select *
    into selected_concept
    from concept
    where name = key;

    case
      when selected_concept.data_type = 'Numeric'
      then
        jsonb_to_be_inserted := '{"' || selected_concept.uuid || '": ' || (obs ->> key) :: varchar || '}';
        merged_jsonb := merged_jsonb || jsonb_to_be_inserted;
      when selected_concept.data_type = 'Text'
      then
        jsonb_to_be_inserted := '{"' || selected_concept.uuid || '": "' || (obs ->> key) :: varchar || '"}';
        merged_jsonb := merged_jsonb || jsonb_to_be_inserted;
      when selected_concept.data_type = 'Coded'
      then
        if jsonb_typeof(obs -> key) = 'string'
        then
          select '{"' || selected_concept.uuid || '": "' || c.uuid || '"}'
          into jsonb_to_be_inserted
          from concept c
          where c.name = (obs ->> key) :: varchar;
        end if;
        if jsonb_typeof(obs -> key) = 'array'
        then
          select '{"' || selected_concept.uuid || '": ' || array_to_json(array_agg(c.uuid)) || '}'
          into jsonb_to_be_inserted
          from concept c
          where c.name in (select jsonb_array_elements_text(obs -> key));
        end if;
        merged_jsonb := merged_jsonb || jsonb_to_be_inserted;
    else merged_jsonb := merged_jsonb;
    end case;
  END LOOP;
  RETURN merged_jsonb;
END
$$
LANGUAGE plpgsql;

-- select create_individual('1ed28008-ace5-4e1e-819f-da10d57e163d', 'Wadigodri' , 'F',
--                          'L', 'ihmp-dev', null, current_date,
--                          '{
--                            "Number of household members (eating together)": 10,
--                            "Relation to head of the family": [
--                              "Self",
--                              "Wife"
--                            ],
--                            "Caste (Free Text)": "Hindu"
--                          }'::jsonb, false, true, 'Individual' , 'Female', current_date );
--
-- select create_individual('0ed28008-ace5-4d1e-819f-da10d57e163d', 'Wadigodri' , 'F',
--                           'L', 'ihmp-dev', null, current_date::date);
CREATE or replace FUNCTION create_individual(
  p_uuid                   varchar,
  p_address_uuid          varchar,
  p_first_name             varchar,
  p_last_name              varchar,
  p_username               varchar,
  p_facility_name          varchar,
  p_date_of_birth          date,
  p_obs                    jsonb default '{}' :: jsonb,
  p_is_voided              boolean default false,
  p_date_of_birth_verified boolean default true,
  p_subject_type_name      varchar default 'Individual',
  p_gender                 varchar default 'Female',
  p_registration_date      date default current_date
)
  RETURNS VOID AS $$
declare
  v_address_id      numeric;
  v_facility_id     numeric;
  v_gender_id       numeric;
  v_audit_id        numeric;
  v_organisation_id numeric;
  v_user_id         numeric;
  v_subject_type_id numeric;
  v_observations    jsonb;
BEGIN
  select id
  into v_address_id
  from address_level
  where uuid = p_address_uuid;

  select id
  into v_facility_id
  from facility
  where name = p_facility_name;

  select id
  into v_gender_id
  from gender
  where name = p_gender;

  select create_obs(p_obs)
  into v_observations;

  select id
  into v_organisation_id
  from organisation
  where db_user = current_user;

  select id
  into v_user_id
  from users
  where username = p_username;

  select id
  into v_subject_type_id
  from subject_type
  where name = coalesce(p_subject_type_name, 'Individual');

  insert into audit (created_by_id, last_modified_by_id, created_date_time, last_modified_date_time)
  values (v_user_id, v_user_id, now(), now())
  returning id
    into v_audit_id;

  insert into individual (uuid, address_id, observations, version, date_of_birth,
                          date_of_birth_verified, gender_id, registration_date, organisation_id,
                          first_name, last_name, is_voided, audit_id, facility_id, registration_location,
                          subject_type_id)
  values
    (p_uuid, v_address_id, v_observations, 1, p_date_of_birth,
             p_date_of_birth_verified, v_gender_id, p_registration_date, v_organisation_id,
             p_first_name, p_last_name, p_is_voided, v_audit_id, v_facility_id, null,
     v_subject_type_id);
END
$$
LANGUAGE plpgsql;

-- Create a new program enrolment
-- select
--   create_program_enrolment('9a6b3e2c-91b0-417d-8195-4bbe7ac18ac9', 'Mother', '0ed28008-ace5-4d1e-819f-da10d57e163d', 'ihmp-dev');
CREATE or replace FUNCTION create_program_enrolment(
  p_uuid                      varchar,
  p_program_name              varchar,
  p_individual_uuid           varchar,
  p_username                  varchar,
  p_observations              jsonb default '{}' :: jsonb,
  p_program_exit_observations jsonb default '{}' :: jsonb,
  p_enrolment_date_time       timestamp default current_timestamp,
  p_program_exit_date_time    timestamp default null,
  p_is_voided                 boolean default false
)
  RETURNS VOID AS $$
declare
  v_individual_id             numeric;
  v_program_id                numeric;
  v_audit_id                  numeric;
  v_organisation_id           numeric;
  v_user_id                   numeric;
  v_observations              jsonb;
  v_program_exit_observations jsonb;
BEGIN

  select id
  into v_individual_id
  from individual
  where uuid = p_individual_uuid;

  select id
  into v_program_id
  from program
  where name = p_program_name;

  select create_obs(p_observations)
  into v_observations;

  select create_obs(p_program_exit_observations)
  into v_program_exit_observations;

  select id
  into v_organisation_id
  from organisation
  where db_user = current_user;

  select id
  into v_user_id
  from users
  where username = p_username;

  insert into audit (created_by_id, last_modified_by_id, created_date_time, last_modified_date_time)
  values (v_user_id, v_user_id, now(), now())
  returning id
    into v_audit_id;

  insert into program_enrolment (program_id, individual_id, observations, program_exit_observations,
                                 enrolment_date_time, program_exit_date_time, uuid, version,
                                 organisation_id, audit_id, is_voided)
  values (v_program_id, v_individual_id, v_observations, v_program_exit_observations,
    p_enrolment_date_time, p_program_exit_date_time, p_uuid, 1,
    v_organisation_id, v_audit_id, p_is_voided);

END
$$
LANGUAGE plpgsql;

-- Create a new program encounter
-- select create_program_encounter('7c427e2a-0113-4dcc-9874-2d0a88887f51', '4c8fcc96-6c2e-4465-8745-2341689049f5',
-- 'ihmp-dev', 'Neonatal');
CREATE or replace FUNCTION create_program_encounter(
  p_uuid                     varchar,
  p_program_enrolment_uuid   varchar,
  p_username                 varchar,
  p_encounter_type_name      varchar,
  p_observations             jsonb default '{}' :: jsonb,
  p_encounter_date_time      timestamp default current_timestamp,
  p_name                     varchar default null,
  p_cancel_observations      jsonb default '{}' :: jsonb,
  p_earliest_visit_date_time timestamp default null,
  p_max_visit_date_time      timestamp default null,
  p_cancel_date_time         timestamp default null,
  p_is_voided                boolean default false
)
  RETURNS VOID AS $$
declare
  v_program_enrolment_id numeric;
  v_encounter_type_id    numeric;
  v_audit_id             numeric;
  v_organisation_id      numeric;
  v_user_id              numeric;
  v_observations         jsonb;
  v_cancel_observations  jsonb;
BEGIN

  select id
  into v_program_enrolment_id
  from program_enrolment
  where uuid = p_program_enrolment_uuid;

  select id
  into v_encounter_type_id
  from encounter_type
  where name = p_encounter_type_name;

  select create_obs(p_observations)
  into v_observations;

  select create_obs(p_cancel_observations)
  into v_cancel_observations;

  select id
  into v_organisation_id
  from organisation
  where db_user = current_user;

  select id
  into v_user_id
  from users
  where username = p_username;

  insert into audit (created_by_id, last_modified_by_id, created_date_time, last_modified_date_time)
  values (v_user_id, v_user_id, now(), now())
  returning id
    into v_audit_id;

  insert into program_encounter (observations, earliest_visit_date_time, encounter_date_time,
                                 program_enrolment_id, uuid, version, encounter_type_id, name,
                                 max_visit_date_time, organisation_id, cancel_date_time, cancel_observations,
                                 audit_id, is_voided)
  values
    (
      v_observations, p_earliest_visit_date_time, p_encounter_date_time,
                      v_program_enrolment_id, p_uuid, 1, v_encounter_type_id, p_name,
                      p_max_visit_date_time, v_organisation_id, p_cancel_date_time, v_cancel_observations,
      v_audit_id, p_is_voided
    );
END
$$
LANGUAGE plpgsql;

-- Clear data
-- select clear_data('ihmp-dev');
CREATE or replace FUNCTION clear_data(
  p_username varchar default null
)
  returns void
as $$ declare
  v_user_id numeric;
BEGIN
  if p_username is null
  then
    select id
    into v_user_id
    from users
    where username = p_username;

    delete from program_encounter
    using audit
    where program_encounter.audit_id = audit.id
          and audit.created_by_id = v_user_id or
          audit.last_modified_by_id = v_user_id;

    delete from program_enrolment
    using audit
    where program_enrolment.audit_id = audit.id
          and audit.created_by_id = v_user_id or
          audit.last_modified_by_id = v_user_id;

    delete from individual
    using audit
    where individual.audit_id = audit.id
          and audit.created_by_id = v_user_id or
          audit.last_modified_by_id = v_user_id;
  else
    delete from program_encounter;
    delete from program_enrolment;
    delete from individual;
  end if;
END
$$
LANGUAGE plpgsql;