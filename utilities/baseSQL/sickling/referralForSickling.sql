SELECT i.uuid as uuid,
       i.gender as gender_name,
       i.addresslevel_type as address_type,
       i.addresslevel_name as address_name
FROM non_exited_enrolment_completed_encounters_agg_view lpe
      JOIN individual_gender_address_view i ON i.id = lpe.individual_id
      JOIN non_exited_program_enrolment_view e ON e.individual_id = i.id
WHERE lpe.program_name = 'Adolescent'
      AND lpe.agg_obs -> '0e620ea5-1a80-499f-9d07-b972a9130d60' IS NOT NULL
      AND lpe.agg_obs -> '0e620ea5-1a80-499f-9d07-b972a9130d60' ?| ARRAY ['2f5c7540-ef48-4f89-9fac-46e6a088e32f']
      [[and e.enrolment_date_time >=(q1 || q4 || quote_literal({{ start_date }}) || q4 || q1  ::DATE)]]
      [[and e.enrolment_date_time <=q1 || q4 || quote_literal({{end_date}}) || q4 || q1 ::DATE]]
      [[and i.addresslevel_name = q1 || q4 || quote_literal({{title}}) || q4 || q1]]