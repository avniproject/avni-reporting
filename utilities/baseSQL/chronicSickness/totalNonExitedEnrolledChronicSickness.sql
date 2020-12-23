SELECT
  DISTINCT
  i.uuid  uuid,
  i.gender  gender_name,
  i.addresslevel_type  address_type,
  i.addresslevel_name address_name
FROM  completed_program_encounter_view pe
         INNER JOIN non_exited_program_enrolment_view enrolment ON pe.program_enrolment_id = enrolment.id
         LEFT OUTER JOIN individual_gender_address_view i ON enrolment.individual_id = i.id
WHERE enrolment.program_name = 'Adolescent'
AND pe.encounter_type_name = 'Chronic Sickness Followup'