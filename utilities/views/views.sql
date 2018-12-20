set role demo;

drop view if exists program_enrolment_view cascade;
create view program_enrolment_view as
  select pe.*,
         op.uuid      as operational_program_uuid,
         op.name      as operational_program_name,
         op.is_voided as operational_program_is_voided,
         p.uuid       as program_uuid,
         p.name       as program_name,
         p.is_voided  as program_is_voided
  from program_enrolment pe
         join operational_program op on op.program_id = pe.program_id
         join program p on op.program_id = p.id
  where pe.is_voided is not true; -- it is not same as '= false'

drop view if exists non_exited_program_enrolment_view cascade;
create view non_exited_program_enrolment_view as
  select *
  from program_enrolment_view
  where program_exit_date_time isnull;

drop view if exists program_encounter_view cascade;
create view program_encounter_view as
  select pe.*,
         oet.uuid      as operational_encounter_type_uuid,
         oet.name      as operational_encounter_type_name,
         oet.is_voided as operational_encounter_type_is_voided,
         et.uuid       as encounter_type_uuid,
         et.name       as encounter_type_name,
         et.is_voided  as encounter_type_is_voided
  from program_encounter pe
         join operational_encounter_type oet on oet.encounter_type_id = pe.encounter_type_id
         join encounter_type et on oet.encounter_type_id = et.id
  where pe.is_voided is not true;

drop view if exists unplanned_program_encounter_view cascade;
create view unplanned_program_encounter_view as
  select *
  from program_encounter_view
  where encounter_date_time is not null;

drop view if exists scheduled_program_encounter_view cascade;
create view scheduled_program_encounter_view as
  select *
  from program_encounter_view
  where earliest_visit_date_time is not null;

drop view if exists non_cancelled_scheduled_program_encounter_view cascade;
create view non_cancelled_scheduled_program_encounter_view as
  select *
  from program_encounter_view
  where cancel_date_time is null
    and earliest_visit_date_time is not null;

drop view if exists cancelled_scheduled_program_encounter_view cascade;
create view cancelled_scheduled_program_encounter_view as
  select *
  from program_encounter_view
  where cancel_date_time is not null
    and earliest_visit_date_time is not null;

drop view if exists individual_view cascade;
create view individual_view as
  select *, first_name || ' ' || last_name                                    as full_name,
            to_char(date_of_birth, 'DD-MON-YYYY')                             AS d_o_b_formatted,
            format('%s years, %s months',
                   to_char(extract(year from age(date_of_birth)), 'FM9999'),
                   to_char(extract(month from age(date_of_birth)), 'FM9999')) as age_years_months,
            to_char(registration_date, 'DD-MON-YYYY')                         AS registration_date_formatted
  from individual
  where is_voided is not true;

drop view if exists individual_gender_view cascade;
create view individual_gender_view as
  select i.*, g.name as gender
  from individual_view i
         join gender g on g.id = i.gender_id;

drop view if exists individual_gender_address_view cascade;
create view individual_gender_address_view as
  select i.*,
         l.title      as addresslevel_name,
         l.level      as addresslevel_level,
         l.uuid       as addresslevel_uuid,
         l.is_voided  as addresslevel_is_voided,
         lt.name      as addresslevel_type,
         lt.uuid      as addresslevel_type_uuid,
         lt.is_voided as addresslevel_type_is_voided
  from individual_gender_view i
         join address_level l on i.address_id = l.id
         join address_level_type lt on l.type_id = lt.id;

drop view if exists individual_gender_catchment_view cascade;
create view individual_gender_catchment_view as
  select i.*,
         c.id        as catchment_id,
         c.name      as catchment_name,
         c.uuid      as catchment_uuid,
         c.is_voided as catchment_is_voided
  from individual_gender_address_view i
         join virtual_catchment_address_mapping_table vt on vt.addresslevel_id = i.address_id
         join catchment c on c.id = vt.catchment_id;

drop view if exists all_enrolment_unplanned_encounters_agg_view cascade;
create view all_enrolment_unplanned_encounters_agg_view AS
  WITH agg as (
      SELECT e.individual_id,
             e.program_id,
             jsonb_merge(jsonb_agg(e.observations || jsonb_strip_nulls(pe.observations))) obs
      FROM program_encounter pe
             JOIN program_enrolment e ON pe.program_enrolment_id = e.id
      where e.is_voided is not true
        and pe.is_voided is not true
        and pe.encounter_date_time is not null
      GROUP BY e.individual_id, e.program_id
  )
  select agg.individual_id,
         agg.program_id,
         agg.obs      as agg_obs,
         op.uuid      as operational_program_uuid,
         op.name      as operational_program_name,
         op.is_voided as operational_program_is_voided,
         p.uuid       as program_uuid,
         p.name       as program_name,
         p.is_voided  as program_is_voided
  from agg
         join operational_program op on op.program_id = agg.program_id
         join program p on op.program_id = p.id;

SELECT grant_all_on_all(a.rolname) FROM pg_roles a WHERE pg_has_role('openchs', a.oid, 'member')
                                                     and a.rolsuper is false
                                                     and a.rolname not like 'pg%'
                                                     and a.rolname not like 'rds%'
order by a.rolname;
