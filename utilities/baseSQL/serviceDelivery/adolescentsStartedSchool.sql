SELECT DISTINCT
  i.uuid,
  i.gender,
  i.addresslevel_type,
  i.addresslevel_name
FROM completed_program_encounter_view pe
       INNER JOIN non_exited_program_enrolment_view e ON pe.program_enrolment_id = e.id
       INNER JOIN individual_gender_address_view i ON e.individual_id = i.id
WHERE e.program_name = 'Adolescent'
  AND (pe.observations @> '{"dcfc771a-0785-43be-bcb1-0d2755793e0e":"28e76608-dddd-4914-bd44-3689eccfa5ca"}'
  OR pe.observations @> '{"dcfc771a-0785-43be-bcb1-0d2755793e0e":"9715936e-03f2-44da-900f-33588fe95250"}')
  [[ and e.enrolment_date_time >=(q1 || q4 || quote_literal({{ start_date }}) || q4 || q1  ::DATE)]]
  [[and e.enrolment_date_time <=q1 || q4 || quote_literal({{end_date}}) || q4 || q1 ::DATE]]
