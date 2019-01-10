SELECT i.uuid as uuid,
       i.gender as gender_name,
       i.addresslevel_type as address_type,
       i.addresslevel_name as address_name
FROM non_exited_enrolment_completed_encounters_agg_view lpe
      JOIN individual_gender_address_view i ON i.id = lpe.individual_id
      INNER JOIN concept c ON lpe.agg_obs ->> 'fda18675-59dc-4a69-82f7-4e137c274073' = c.uuid
WHERE lpe.program_name = 'Adolescent'
      AND lpe.agg_obs ->> 'fda18675-59dc-4a69-82f7-4e137c274073' IS NOT NULL
