SELECT i.uuid as uuid,
       i.gender as gender_name,
       i.addresslevel_type as address_type,
       i.addresslevel_name as address_name
FROM non_exited_enrolment_completed_encounters_agg_view lpe
      JOIN individual_gender_address_view i ON i.id = lpe.individual_id
WHERE lpe.program_name = 'Adolescent'
      AND lpe.obs @> '{"cd637ed2-5a97-4f36-970a-3af1f27dfe78":"04bb1773-c353-44a1-a68c-9b448e07ff70"}'