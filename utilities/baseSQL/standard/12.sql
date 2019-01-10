SELECT i.uuid as uuid,
       i.gender as gender_name,
       i.addresslevel_type as address_type,
       i.addresslevel_name as address_name
FROM non_exited_enrolment_completed_encounters_agg_view lpe
      JOIN individual_gender_address_view i ON i.id = lpe.individual_id
WHERE lpe.program_name = 'Adolescent'
      AND lpe.agg_obs @> '{"32005c85-c1de-4fc3-9314-6d6a10f34b57":"9b141130-a1c7-4e3b-bc95-5b9b157f7160"}'
