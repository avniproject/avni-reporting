
SELECT i.uuid as uuid,
       i.gender as gender_name,
       i.addresslevel_type as address_type,
       i.addresslevel_name as address_name
FROM all_enrolment_encountered_encounters_agg_view lpe
      JOIN individual_gender_address_view i ON i.id = lpe.individual_id
WHERE lpe.program_name = 'Adolescent'
      AND lpe.agg_obs -> 'c9aceef5-fb03-49ed-a455-bfa603dddb28' IS NOT NULL AND
      lpe.agg_obs -> 'c9aceef5-fb03-49ed-a455-bfa603dddb28' ?| ARRAY ['104c7ffb-fb43-45a0-876b-77fba9ee7759']
