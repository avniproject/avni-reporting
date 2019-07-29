with latest_visit as (
  select max(encounter_date_time) encounter_date_time, individual_id
  from completed_program_encounter_view pe
         INNER JOIN non_exited_program_enrolment_view e ON pe.program_enrolment_id = e.id
  WHERE e.program_name = 'Adolescent'
    and (pe.encounter_type_name = 'Annual Visit' or pe.encounter_type_name = 'Quarterly Visit')
  group by e.individual_id
),
     all_dropout_visits_after_latest_visit as (
       select i.uuid                                                                  uuid,
              i.gender                                                                gender_name,
              i.addresslevel_type                                                     address_type,
              i.addresslevel_name                                                     address_name,
              row_number()
                  OVER (PARTITION BY i.uuid ORDER BY pe.encounter_date_time ASC)      visit_number,
              single_select_coded(
                    pe.observations ->> 'dcfc771a-0785-43be-bcb1-0d2755793e0e') :: TEXT joined_school,
              pe.encounter_date_time
       from completed_program_encounter_view pe
              INNER JOIN non_exited_program_enrolment_view e ON pe.program_enrolment_id = e.id
              INNER JOIN latest_visit v ON v.individual_id = e.individual_id
              LEFT OUTER JOIN individual_gender_address_view i ON i.id = e.individual_id
       WHERE e.program_name = 'Adolescent'
         and pe.encounter_type_name = 'Dropout Followup Visit'
         and pe.encounter_date_time >= v.encounter_date_time
     )
select uuid,
       gender_name,
       address_type,
       address_name
from all_dropout_visits_after_latest_visit
where joined_school = 'Yes, started'
  and visit_number = 4;
