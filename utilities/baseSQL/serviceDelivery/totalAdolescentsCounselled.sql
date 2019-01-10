SELECT i.uuid as uuid,
       i.gender as gender_name,
       i.addresslevel_type as address_type,
       i.addresslevel_name as address_name
FROM non_exited_enrolment_completed_encounters_agg_view lpe
      JOIN individual_gender_address_view i ON i.id = lpe.individual_id
WHERE lpe.program_name = 'Adolescent'
      AND (lpe.agg_obs @> '{"e45d8168-c4a2-427b-85aa-d0f0e8467a8f":"04bb1773-c353-44a1-a68c-9b448e07ff70"}'
      OR lpe.agg_obs @> '{"e31481f1-c719-46dc-b1de-a0f282b33d12":"04bb1773-c353-44a1-a68c-9b448e07ff70"}'
      OR lpe.agg_obs @> '{"6c0ed446-b555-4bb7-90f8-6da6f9827ab9":"04bb1773-c353-44a1-a68c-9b448e07ff70"}'
      OR lpe.agg_obs @> '{"ed9ea061-2e35-41b8-a50f-aa2b30b7fc3c":"04bb1773-c353-44a1-a68c-9b448e07ff70"}'
      OR lpe.agg_obs @> '{"a32eeb3a-a36d-4f82-a02d-d8066c41a5b1":"04bb1773-c353-44a1-a68c-9b448e07ff70"}'
      OR lpe.agg_obs @> '{"c3aceea7-e0f0-46f1-855a-a664ecc4d063":"04bb1773-c353-44a1-a68c-9b448e07ff70"}'
      OR lpe.agg_obs @> '{"5a300ad8-13f3-4d1c-aa2d-6bc36dcb5ff6":"04bb1773-c353-44a1-a68c-9b448e07ff70"}'
      OR lpe.agg_obs @> '{"a53a6c13-8a84-4be5-958b-e07611426fe0":"04bb1773-c353-44a1-a68c-9b448e07ff70"}')

