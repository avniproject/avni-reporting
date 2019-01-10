SELECT i.uuid as uuid,
       i.gender as gender_name,
       i.addresslevel_type as address_type,
       i.addresslevel_name as address_name
FROM non_exited_enrolment_completed_encounters_agg_view lpe
      JOIN individual_gender_address_view i ON i.id = lpe.individual_id
WHERE lpe.program_name = 'Adolescent' AND
      lpe.agg_obs -> 'bd3d1ba3-0a85-4aa7-a62c-78254d8e0762' IS NOT NULL AND
      lpe.agg_obs -> 'bd3d1ba3-0a85-4aa7-a62c-78254d8e0762' ?| ARRAY ['19394a8e-bd38-46a2-a5e4-23f063125477']