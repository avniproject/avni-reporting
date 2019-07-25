SELECT DISTINCT
  i.uuid,
  i.gender,
  i.addresslevel_type,
  i.addresslevel_name
FROM completed_program_encounter_view pe
       INNER JOIN non_exited_program_enrolment_view e ON pe.program_enrolment_id = e.id
       INNER JOIN individual_gender_address_view i ON e.individual_id = i.id
WHERE e.program_name = 'Adolescent' AND pe.observations @> '{"575a29c3-a070-4c7d-ac96-fe58b6bddca3":"58f789aa-6570-4aea-87a7-1f7651729c5a"}'
   [[and pe.encounter_date_time >=(q1 || q4 || quote_literal({{ start_date }}) || q4 || q1  ::DATE)]]
    [[and pe.encounter_date_time <=q1 || q4 || quote_literal({{end_date}}) || q4 || q1 ::DATE]]
