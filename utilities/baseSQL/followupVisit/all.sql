SELECT
  i.uuid     uuid,
  i.gender    gender_name,
  i.addresslevel_type   address_type,
  i.addresslevel_name   address_name
FROM program_encounter_view pe
  LEFT OUTER JOIN non_exited_program_enrolment_view e ON pe.program_enrolment_id = e.id
  LEFT OUTER JOIN individual_gender_address_view i ON e.individual_id = i.id
WHERE pe.encounter_type_name = 'Dropout Followup Visit' AND pe.encounter_type_id IS NOT NULL AND e.program_name = 'Adolescent'
GROUP BY i.uuid, i.gender, i.addresslevel_type, i.addresslevel_name
HAVING count(*) > 0;