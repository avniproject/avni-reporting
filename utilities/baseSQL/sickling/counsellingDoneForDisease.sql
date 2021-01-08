SELECT i.uuid as uuid,
       i.gender as gender_name,
       i.addresslevel_type as address_type,
       i.addresslevel_name as address_name
FROM non_exited_enrolment_completed_encounters_agg_view lpe
      JOIN individual_gender_address_view i ON i.id = lpe.individual_id
      JOIN non_exited_program_enrolment_view e ON e.individual_id = i.id
WHERE lpe.program_name = 'Adolescent'
      AND lpe.agg_obs ->> 'b5daf90d-5b71-4b53-827f-edd4f6539d15'='2c343c7a-db14-4531-902a-d7b169300073'
      AND lpe.agg_obs ->> 'f44951a6-adc2-4983-947f-f8327ce05419' = '04bb1773-c353-44a1-a68c-9b448e07ff70'
      [[and e.enrolment_date_time >=(q1 || q4 || quote_literal({{ start_date }}) || q4 || q1  ::DATE)]]
      [[and e.enrolment_date_time <=q1 || q4 || quote_literal({{end_date}}) || q4 || q1 ::DATE]]
      [[and i.addresslevel_name = q1 || q4 || quote_literal({{title}}) || q4 || q1]]

