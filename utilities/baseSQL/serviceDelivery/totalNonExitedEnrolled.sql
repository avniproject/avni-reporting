SELECT
  DISTINCT
  i.uuid  uuid,
  i.gender  gender_name,
  i.addresslevel_type  address_type,
  i.addresslevel_name address_name
FROM
  completed_program_encounter_view pe
  LEFT OUTER JOIN non_exited_program_enrolment_view enrolment ON pe.program_enrolment_id = enrolment.id
  LEFT OUTER JOIN individual_gender_address_view i ON enrolment.individual_id = i.id
WHERE enrolment.program_name = 'Adolescent' AND pe.encounter_type_name = 'Annual Visit' [[and pe.encounter_date_time >=(q1 || q4 || quote_literal({{ start_date }}) || q4 || q1  ::DATE)]]
    [[and pe.encounter_date_time <=q1 || q4 || quote_literal({{end_date}}) || q4 || q1 ::DATE]]