drop view if exists program_enrolment_view CASCADE;
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

drop view if exists non_exited_program_enrolment_view CASCADE;
create view non_exited_program_enrolment_view as
  select *
  from program_enrolment_view
  where program_exit_date_time isnull;

drop view if exists program_encounter_view CASCADE;
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

drop view if exists scheduled_program_encounter_view CASCADE;
create view scheduled_program_encounter_view as
  select *
  from program_encounter_view
  where earliest_visit_date_time is not null;

drop view if exists non_cancelled_scheduled_program_encounter_view CASCADE;
create view non_cancelled_scheduled_program_encounter_view as
  select *
  from program_encounter_view
  where cancel_date_time is null
    and earliest_visit_date_time is not null;

drop view if exists cancelled_scheduled_program_encounter_view CASCADE;
create view cancelled_scheduled_program_encounter_view as
  select *
  from program_encounter_view
  where cancel_date_time is not null
    and earliest_visit_date_time is not null;
