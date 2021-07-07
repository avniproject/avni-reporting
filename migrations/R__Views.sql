DROP VIEW IF EXISTS mother_program_enrolments;
DROP VIEW IF EXISTS mother_program_encounters;
DROP VIEW IF EXISTS adolescents;
DROP VIEW IF EXISTS adolescent_visit;
DROP VIEW IF EXISTS boolean;

-- <RCH>
CREATE OR REPLACE VIEW mother_program_enrolments AS
  SELECT
    individual.id                                                                     individual,
    min(catchment.id)                                                                 catchment,
    program_enrolment.id                                                              enrolment,
    program_enrolment.enrolment_date_time                                             internal_enrolment_date,
    to_char(program_enrolment.enrolment_date_time, 'DD-Mon-YYYY')                     enrolment_date,
    program_enrolment.program_exit_date_time                                          internal_exit_date,
    to_char(program_enrolment.program_exit_date_time, 'DD-Mon-YYYY')                  exit_date,
    individual.date_of_birth                                                          internal_date_of_birth,
    to_char(individual.date_of_birth, 'DD-Mon-YYYY')                                  date_of_birth,
    min(address_level.id)                                                             address,
    to_char(date_obs(program_enrolment, 'Last Menstrual Period'), 'DD-Mon-YYYY')      LMP,
    date_obs(program_enrolment, 'Estimated Date of Delivery')                         internal_edd,
    to_char(date_obs(program_enrolment, 'Estimated Date of Delivery'), 'DD-Mon-YYYY') EDD,
    coded_obs_exists(program_enrolment, 'High Risk Conditions')                       is_high_risk,
    coded_obs(program_enrolment, 'High Risk Conditions')                              high_risk_conditions,
    count(program_encounter)                                                          number_of_visits,
    sum(is_overdue_visit(program_encounter))                                          number_of_overdue_visits
  FROM program_enrolment
    INNER JOIN program p ON program_enrolment.program_id = p.id AND p.name = 'Mother'
    INNER JOIN individual ON program_enrolment.individual_id = individual.id
    INNER JOIN address_level ON address_level.id = individual.address_id
    INNER JOIN catchment_address_mapping ON catchment_address_mapping.addresslevel_id = address_level.id
    INNER JOIN catchment ON catchment_address_mapping.catchment_id = catchment.id
    LEFT OUTER JOIN program_encounter ON program_enrolment.id = program_encounter.program_enrolment_id
  GROUP BY individual.id, program_enrolment.id;

CREATE OR REPLACE VIEW mother_program_encounters AS
  SELECT
    individual.id                                                                     individual,
    to_char(individual.date_of_birth, 'DD-Mon-YYYY')                                  date_of_birth,
    individual.date_of_birth                                                          internal_date_of_birth,
    address_level.id                                                                  address,
    program_enrolment.id                                                              enrolment_id,
    program_enrolment.enrolment_date_time                                             internal_enrolment_date,
    to_char(program_enrolment.enrolment_date_time, 'DD-Mon-YYYY')                     enrolment_date,
    to_char(date_obs(program_enrolment, 'Last Menstrual Period'), 'DD-Mon-YYYY')      LMP,
    to_char(date_obs(program_enrolment, 'Estimated Date of Delivery'), 'DD-Mon-YYYY') EDD,
    program_encounter.id                                                              visit,
    program_encounter.earliest_visit_date_time                                        internal_earliest_visit_date,
    to_char(program_encounter.earliest_visit_date_time, 'DD-Mon-YYYY')                earliest_visit_date,
    program_encounter.max_visit_date_time                                             internal_max_visit_date,
    to_char(program_encounter.max_visit_date_time, 'DD-Mon-YYYY')                     max_visit_date,
    encounter_type.id                                                                 visit_type,
    program_encounter.name                                                            visit_name,
    program_encounter.encounter_date_time                                             internal_visit_date,
    to_char(program_encounter.encounter_date_time, 'DD-Mon-YYYY')                     visit_date,
    coded_obs_exists(program_enrolment, 'High Risk Conditions')                       is_high_risk,
    coded_obs(program_enrolment, 'High Risk Conditions')                              high_risk_conditions,
    catchment.id                                                                      catchment
  FROM program_encounter
    INNER JOIN program_enrolment ON program_encounter.program_enrolment_id = program_enrolment.id
    INNER JOIN program p ON program_enrolment.program_id = p.id AND p.name = 'Mother'
    INNER JOIN encounter_type ON program_encounter.encounter_type_id = encounter_type.id
    INNER JOIN individual ON program_enrolment.individual_id = individual.id
    INNER JOIN address_level ON address_level.id = individual.address_id
    INNER JOIN catchment_address_mapping ON catchment_address_mapping.addresslevel_id = address_level.id
    INNER JOIN catchment ON catchment_address_mapping.catchment_id = catchment.id;
-- </RCH>

-- <Adolescent>
CREATE OR REPLACE VIEW adolescents AS
  SELECT
    individual.id                                                 individual,
    gender.name                                                   gender,
    catchment.type                                                catchment_type,
    address_level.id                                              address_level,
    address_level.type_id                                          address_level_type,
    program_enrolment.id                                          enrolment_id,
    program_enrolment.enrolment_date_time                         internal_enrolment_date,
    to_char(program_enrolment.enrolment_date_time, 'DD-Mon-YYYY') enrolment_date
  FROM individual
    INNER JOIN gender ON individual.gender_id = gender.id
    INNER JOIN address_level ON individual.address_id = address_level.id
    INNER JOIN catchment_address_mapping ON address_level.id = catchment_address_mapping.addresslevel_id
    INNER JOIN catchment ON catchment.id = catchment_address_mapping.catchment_id
    LEFT OUTER JOIN program_enrolment ON individual.id = program_enrolment.individual_id
    LEFT OUTER JOIN program ON program_enrolment.program_id = program.id
  WHERE program.name = 'Adolescent';


CREATE OR REPLACE VIEW adolescent_visit AS
  SELECT
    individual.id                                                 individual,
    gender.name                                                   gender,
    catchment.type                                                catchment_type,
    program_enrolment.id                                          enrolment_id,
    program_enrolment.enrolment_date_time                         internal_enrolment_date,
    to_char(program_enrolment.enrolment_date_time, 'DD-Mon-YYYY') enrolment_date,
    program_encounter.id                                          program_encounter,
    program_encounter.encounter_date_time                         visit_date
  FROM individual
    INNER JOIN gender ON individual.gender_id = gender.id
    INNER JOIN address_level ON individual.address_id = address_level.id
    INNER JOIN catchment_address_mapping ON address_level.id = catchment_address_mapping.addresslevel_id
    INNER JOIN catchment ON catchment.id = catchment_address_mapping.catchment_id
    LEFT OUTER JOIN program_enrolment ON individual.id = program_enrolment.individual_id
    LEFT OUTER JOIN program_encounter ON program_enrolment.id = program_encounter.program_enrolment_id
    LEFT OUTER JOIN program ON program_enrolment.program_id = program.id
  WHERE program.name = 'Adolescent';


CREATE OR REPLACE VIEW coded_concept AS
select c2.id as id, c2.name as name, string_agg(c1.name, ', ') as answers
from concept_answer ca
       inner join concept c1 on ca.answer_concept_id = c1.id
       inner join concept c2 on ca.concept_id = c2.id
GROUP BY c2.id;

CREATE OR REPLACE VIEW boolean AS
  (select 'Yes' as status, true as bool
   union
   select 'No' as status, false as bool);

CREATE OR REPLACE VIEW boolean_na(status) AS (values ('Yes'), ('No'), ('Not Available'));

CREATE OR REPLACE VIEW year(year) As (values (2016), (2017), (2018), (2019), (2020), (2021),
                                             (2022), (2023), (2024), (2025), (2026), (2027),
                                             (2028), (2029), (2030));

CREATE OR REPLACE VIEW month(name, month) As (values ('January', 1),
                                                     ('February', 2),
                                                     ('March', 3),
                                                     ('April', 4),
                                                     ('May', 5),
                                                     ('June', 6),
                                                     ('July', 7),
                                                     ('August', 8),
                                                     ('September', 9),
                                                     ('October', 10),
                                                     ('November', 11),
                                                     ('December', 12));
