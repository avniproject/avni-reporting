SELECT i.uuid as uuid,
       i.gender as gender_name,
       i.addresslevel_type as address_type,
       i.addresslevel_name as address_name
FROM all_enrolment_encountered_encounters_agg_view lpe
      JOIN individual_gender_address_view i ON i.id = lpe.individual_id
WHERE lpe.program_name = 'Adolescent' AND
      lpe.agg_obs -> '0f87eac1-cf6a-4632-8af2-29a935451fe4' IS NOT NULL AND
      lpe.agg_obs -> '0f87eac1-cf6a-4632-8af2-29a935451fe4' ?| ARRAY ['92ad8878-b476-4291-aa76-3377fa7cf19c',
      '33385edf-93bc-4513-aa03-480ce3bc7b5c', '1c478c50-4761-460c-b33c-a18d0c1500f7',
      '761b7f7a-5db7-4115-aa84-32fcfce5ddfc', '4085f165-ccb8-409b-9d6e-ea7755cf123e',
      'aa30fb91-4b64-438b-b09e-4c7ff2701d71', 'e27f4a35-c2ae-4d05-8930-e19e432221d1',
      'ce47ae12-e61c-49cc-8ccd-715f9d5cb76d']