SELECT i.uuid as uuid,
       i.gender as gender_name,
       i.addresslevel_type as address_type,
       i.addresslevel_name as address_name
FROM all_enrolment_encountered_encounters_agg_view lpe
      JOIN individual_gender_address_view i ON i.id = lpe.individual_id
WHERE lpe.program_name = 'Adolescent' AND
      lpe.agg_obs ->> '2973890d-0142-41a6-a6f5-988e7eb36d79' = '04bb1773-c353-44a1-a68c-9b448e07ff70'