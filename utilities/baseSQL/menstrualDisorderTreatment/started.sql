SELECT DISTINCT i.uuid              as uuid,
                i.gender            as gender_name,
                i.addresslevel_type as address_type,
                i.addresslevel_name as address_name
FROM non_exited_enrolment_completed_encounters_agg_view lpe
       JOIN individual_gender_address_view i ON i.id = lpe.individual_id
       JOIN non_exited_program_enrolment_view e ON e.individual_id = i.id
WHERE lpe.program_name = 'Adolescent'
  AND lpe.agg_obs @> '{"9cb4c266-0511-48f6-a058-d4f1fa3eb17c":"04bb1773-c353-44a1-a68c-9b448e07ff70"}'
