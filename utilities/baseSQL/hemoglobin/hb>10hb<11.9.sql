SELECT i.uuid as uuid,
       i.gender as gender_name,
       i.addresslevel_type as address_type,
       i.addresslevel_name as address_name
FROM all_enrolment_encountered_encounters_agg_view lpe
      JOIN individual_gender_address_view i ON i.id = lpe.individual_id
WHERE lpe.program_name = 'Adolescent'
      AND cast(lpe.agg_obs ->> 'f9ecabbc-2df2-4bfc-a6fa-aa417c50e11b' AS FLOAT) > 10
      AND cast(lpe.agg_obs ->> 'f9ecabbc-2df2-4bfc-a6fa-aa417c50e11b' AS FLOAT) < 12