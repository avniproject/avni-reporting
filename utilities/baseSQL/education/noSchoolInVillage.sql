
SELECT i.uuid as uuid,
       i.gender as gender_name,
       i.addresslevel_type as address_type,
       i.addresslevel_name as address_name
FROM non_exited_enrolment_completed_encounters_agg_view lpe
      JOIN individual_gender_address_view i ON i.id = lpe.individual_id
WHERE lpe.program_name = 'Adolescent'
      AND lpe.agg_obs -> 'c9aceef5-fb03-49ed-a455-bfa603dddb28' IS NOT NULL AND
      lpe.agg_obs -> 'c9aceef5-fb03-49ed-a455-bfa603dddb28' ?| ARRAY ['af10b937-e9f2-4b9b-8cfe-1d59bc0b21f6']
