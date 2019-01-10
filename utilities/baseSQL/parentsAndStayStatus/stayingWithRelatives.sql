SELECT i.uuid as uuid,
       i.gender as gender_name,
       i.addresslevel_type as address_type,
       i.addresslevel_name as address_name
FROM non_exited_enrolment_completed_encounters_agg_view lpe
      JOIN individual_gender_address_view i ON i.id = lpe.individual_id
WHERE lpe.program_name = 'Adolescent'
      AND lpe.agg_obs @> '{"eb47f6b7-1f64-4008-87f3-a781c7c342cd":"bf99bcf7-5046-4835-9eb3-6fc5d558d60b"}'