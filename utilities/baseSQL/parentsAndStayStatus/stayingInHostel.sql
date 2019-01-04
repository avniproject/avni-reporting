SELECT i.uuid as uuid,
       i.gender as gender_name,
       i.addresslevel_type as address_type,
       i.addresslevel_name as address_name
FROM non_exited_enrolment_completed_encounters_agg_view lpe
      JOIN individual_gender_address_view i ON i.id = lpe.individual_id
WHERE lpe.program_name = 'Adolescent'
      AND lpe.obs @> '{"eb47f6b7-1f64-4008-87f3-a781c7c342cd":"b14dc6d9-c724-4005-b407-77b365e8241d"}'