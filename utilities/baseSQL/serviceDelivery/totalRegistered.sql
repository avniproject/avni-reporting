SELECT
  i.uuid  uuid,
  i.gender as gender_name,
  i.addresslevel_type as address_type,
  i.addresslevel_name as address_name
FROM non_exited_program_enrolment_view pe
      JOIN individual_gender_address_view i ON i.id = pe.individual_id
WHERE pe.program_name = 'Adolescent'