
SELECT i.uuid as uuid,
       i.gender as gender_name,
       i.addresslevel_type as address_type,
       i.addresslevel_name as address_name
FROM non_exited_enrolment_completed_encounters_agg_view lpe
      JOIN individual_gender_address_view i ON i.id = lpe.individual_id
WHERE lpe.program_name = 'Adolescent'
      AND lpe.agg_obs @> '{"524c431a-3cfd-410d-af6c-e5b39ddd85d3":"04bb1773-c353-44a1-a68c-9b448e07ff70"}'