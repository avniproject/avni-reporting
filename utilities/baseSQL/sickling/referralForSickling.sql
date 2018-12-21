SELECT i.uuid as uuid,
       i.gender as gender_name,
       i.addresslevel_type as address_type,
       i.addresslevel_name as address_name
FROM all_enrolment_encountered_encounters_agg_view lpe
      JOIN individual_gender_address_view i ON i.id = lpe.individual_id
WHERE lpe.program_name = 'Adolescent'
      AND lpe.agg_obs -> '0e620ea5-1a80-499f-9d07-b972a9130d60' IS NOT NULL
      AND lpe.agg_obs -> '0e620ea5-1a80-499f-9d07-b972a9130d60' ?| ARRAY ['2f5c7540-ef48-4f89-9fac-46e6a088e32f']