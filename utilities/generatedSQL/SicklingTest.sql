SELECT * FROM crosstab('SELECT
''Test Done''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''SELECT i.uuid as uuid,
       i.gender as gender_name,
       i.addresslevel_type as address_type,
       i.addresslevel_name as address_name
FROM non_exited_enrolment_completed_encounters_agg_view lpe
      JOIN individual_gender_address_view i ON i.id = lpe.individual_id
WHERE lpe.program_name = ''''Adolescent''''
      AND lpe.agg_obs ->> ''''b5daf90d-5b71-4b53-827f-edd4f6539d15'''' IS NOT NULL'', ''SELECT
  DISTINCT
  i.uuid  uuid,
  i.gender  gender_name,
  i.addresslevel_type  address_type,
  i.addresslevel_name address_name
FROM
  completed_program_encounter_view pe
  JOIN non_exited_program_enrolment_view enrolment ON pe.program_enrolment_id = enrolment.id
  JOIN individual_gender_address_view i ON enrolment.individual_id = i.id
WHERE enrolment.program_name = ''''Adolescent'''' AND pe.encounter_type_name = ''''Annual Visit'''''')
UNION ALL
SELECT
''Negative''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''SELECT i.uuid as uuid,
       i.gender as gender_name,
       i.addresslevel_type as address_type,
       i.addresslevel_name as address_name
FROM non_exited_enrolment_completed_encounters_agg_view lpe
      JOIN individual_gender_address_view i ON i.id = lpe.individual_id
WHERE lpe.program_name = ''''Adolescent''''
      AND lpe.agg_obs ->> ''''b5daf90d-5b71-4b53-827f-edd4f6539d15''''=''''ad1f0481-a8ed-411a-ac00-d0435a670269'''''', ''SELECT i.uuid as uuid,
       i.gender as gender_name,
       i.addresslevel_type as address_type,
       i.addresslevel_name as address_name
FROM non_exited_enrolment_completed_encounters_agg_view lpe
      JOIN individual_gender_address_view i ON i.id = lpe.individual_id
WHERE lpe.program_name = ''''Adolescent''''
      AND lpe.agg_obs ->> ''''b5daf90d-5b71-4b53-827f-edd4f6539d15'''' IS NOT NULL'')
UNION ALL
SELECT
''Trait''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''SELECT i.uuid as uuid,
       i.gender as gender_name,
       i.addresslevel_type as address_type,
       i.addresslevel_name as address_name
FROM non_exited_enrolment_completed_encounters_agg_view lpe
      JOIN individual_gender_address_view i ON i.id = lpe.individual_id
WHERE lpe.program_name = ''''Adolescent''''
      AND lpe.agg_obs ->> ''''b5daf90d-5b71-4b53-827f-edd4f6539d15''''=''''d53a31d6-3c5e-496f-8b92-bc0f703d3b33'''''', ''SELECT i.uuid as uuid,
       i.gender as gender_name,
       i.addresslevel_type as address_type,
       i.addresslevel_name as address_name
FROM non_exited_enrolment_completed_encounters_agg_view lpe
      JOIN individual_gender_address_view i ON i.id = lpe.individual_id
WHERE lpe.program_name = ''''Adolescent''''
      AND lpe.agg_obs ->> ''''b5daf90d-5b71-4b53-827f-edd4f6539d15'''' IS NOT NULL'')
UNION ALL
SELECT
''Disease''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''SELECT i.uuid as uuid,
       i.gender as gender_name,
       i.addresslevel_type as address_type,
       i.addresslevel_name as address_name
FROM non_exited_enrolment_completed_encounters_agg_view lpe
      JOIN individual_gender_address_view i ON i.id = lpe.individual_id
WHERE lpe.program_name = ''''Adolescent''''
      AND lpe.agg_obs ->> ''''b5daf90d-5b71-4b53-827f-edd4f6539d15''''=''''2c343c7a-db14-4531-902a-d7b169300073'''''', ''SELECT i.uuid as uuid,
       i.gender as gender_name,
       i.addresslevel_type as address_type,
       i.addresslevel_name as address_name
FROM non_exited_enrolment_completed_encounters_agg_view lpe
      JOIN individual_gender_address_view i ON i.id = lpe.individual_id
WHERE lpe.program_name = ''''Adolescent''''
      AND lpe.agg_obs ->> ''''b5daf90d-5b71-4b53-827f-edd4f6539d15'''' IS NOT NULL'')
UNION ALL
SELECT
''Counselling Done''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''SELECT i.uuid as uuid,
       i.gender as gender_name,
       i.addresslevel_type as address_type,
       i.addresslevel_name as address_name
FROM non_exited_enrolment_completed_encounters_agg_view lpe
      JOIN individual_gender_address_view i ON i.id = lpe.individual_id
WHERE lpe.program_name = ''''Adolescent''''
      AND lpe.agg_obs ->> ''''a32eeb3a-a36d-4f82-a02d-d8066c41a5b1'''' = ''''04bb1773-c353-44a1-a68c-9b448e07ff70'''''', ''SELECT i.uuid as uuid,
       i.gender as gender_name,
       i.addresslevel_type as address_type,
       i.addresslevel_name as address_name
FROM non_exited_enrolment_completed_encounters_agg_view lpe
      JOIN individual_gender_address_view i ON i.id = lpe.individual_id
WHERE lpe.program_name = ''''Adolescent''''
      AND lpe.agg_obs ->> ''''b5daf90d-5b71-4b53-827f-edd4f6539d15'''' = ''''2c343c7a-db14-4531-902a-d7b169300073''''
      OR lpe.agg_obs ->> ''''b5daf90d-5b71-4b53-827f-edd4f6539d15'''' = ''''d53a31d6-3c5e-496f-8b92-bc0f703d3b33'''''')
UNION ALL
SELECT
''Referred''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''SELECT i.uuid as uuid,
       i.gender as gender_name,
       i.addresslevel_type as address_type,
       i.addresslevel_name as address_name
FROM non_exited_enrolment_completed_encounters_agg_view lpe
      JOIN individual_gender_address_view i ON i.id = lpe.individual_id
WHERE lpe.program_name = ''''Adolescent''''
      AND lpe.agg_obs -> ''''0e620ea5-1a80-499f-9d07-b972a9130d60'''' IS NOT NULL
      AND lpe.agg_obs -> ''''0e620ea5-1a80-499f-9d07-b972a9130d60'''' ?| ARRAY [''''2f5c7540-ef48-4f89-9fac-46e6a088e32f'''']'', ''SELECT i.uuid as uuid,
       i.gender as gender_name,
       i.addresslevel_type as address_type,
       i.addresslevel_name as address_name
FROM non_exited_enrolment_completed_encounters_agg_view lpe
      JOIN individual_gender_address_view i ON i.id = lpe.individual_id
WHERE lpe.program_name = ''''Adolescent''''
      AND lpe.agg_obs ->> ''''b5daf90d-5b71-4b53-827f-edd4f6539d15'''' = ''''2c343c7a-db14-4531-902a-d7b169300073''''
      OR lpe.agg_obs ->> ''''b5daf90d-5b71-4b53-827f-edd4f6539d15'''' = ''''d53a31d6-3c5e-496f-8b92-bc0f703d3b33'''''')') AS (
rowid TEXT,
"All Female" TEXT,
"All Male" TEXT,
"All Other" TEXT,
"All Total" TEXT,
"Boarding Female" TEXT,
"Boarding Male" TEXT,
"Boarding Other" TEXT,
"Boarding Total" TEXT,
"School Female" TEXT,
"School Male" TEXT,
"School Other" TEXT,
"School Total" TEXT,
"Village Female" TEXT,
"Village Male" TEXT,
"Village Other" TEXT,
"Village Total" TEXT);