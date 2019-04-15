-- Generated Report
-- Name: Standard_8_9_10

SELECT * FROM crosstab('SELECT
''8''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''SELECT i.uuid as uuid,
       i.gender as gender_name,
       i.addresslevel_type as address_type,
       i.addresslevel_name as address_name
FROM non_exited_enrolment_completed_encounters_agg_view lpe
      JOIN individual_gender_address_view i ON i.id = lpe.individual_id
WHERE lpe.program_name = ''''Adolescent''''
      AND lpe.agg_obs @> ''''{"fda18675-59dc-4a69-82f7-4e137c274073":"d7443a73-80b7-4320-9c45-6558595be70a"}''''
'', ''SELECT i.uuid as uuid,
       i.gender as gender_name,
       i.addresslevel_type as address_type,
       i.addresslevel_name as address_name
FROM non_exited_enrolment_completed_encounters_agg_view lpe
      JOIN individual_gender_address_view i ON i.id = lpe.individual_id
      INNER JOIN concept c ON lpe.agg_obs ->> ''''fda18675-59dc-4a69-82f7-4e137c274073'''' = c.uuid
WHERE lpe.program_name = ''''Adolescent''''
      AND lpe.agg_obs ->> ''''fda18675-59dc-4a69-82f7-4e137c274073'''' IS NOT NULL
'')
UNION ALL
SELECT
''9''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''SELECT i.uuid as uuid,
       i.gender as gender_name,
       i.addresslevel_type as address_type,
       i.addresslevel_name as address_name
FROM non_exited_enrolment_completed_encounters_agg_view lpe
      JOIN individual_gender_address_view i ON i.id = lpe.individual_id
WHERE lpe.program_name = ''''Adolescent''''
      AND lpe.agg_obs @> ''''{"fda18675-59dc-4a69-82f7-4e137c274073":"29d29318-6b0c-4a2b-85e3-5392bd5a668f"}''''
'', ''SELECT i.uuid as uuid,
       i.gender as gender_name,
       i.addresslevel_type as address_type,
       i.addresslevel_name as address_name
FROM non_exited_enrolment_completed_encounters_agg_view lpe
      JOIN individual_gender_address_view i ON i.id = lpe.individual_id
      INNER JOIN concept c ON lpe.agg_obs ->> ''''fda18675-59dc-4a69-82f7-4e137c274073'''' = c.uuid
WHERE lpe.program_name = ''''Adolescent''''
      AND lpe.agg_obs ->> ''''fda18675-59dc-4a69-82f7-4e137c274073'''' IS NOT NULL
'')
UNION ALL
SELECT
''10''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''SELECT i.uuid as uuid,
       i.gender as gender_name,
       i.addresslevel_type as address_type,
       i.addresslevel_name as address_name
FROM non_exited_enrolment_completed_encounters_agg_view lpe
      JOIN individual_gender_address_view i ON i.id = lpe.individual_id
WHERE lpe.program_name = ''''Adolescent''''
      AND lpe.agg_obs @> ''''{"fda18675-59dc-4a69-82f7-4e137c274073":"7f0e1fbd-a1b9-4121-b630-dfec36a2dfd0"}''''
'', ''SELECT i.uuid as uuid,
       i.gender as gender_name,
       i.addresslevel_type as address_type,
       i.addresslevel_name as address_name
FROM non_exited_enrolment_completed_encounters_agg_view lpe
      JOIN individual_gender_address_view i ON i.id = lpe.individual_id
      INNER JOIN concept c ON lpe.agg_obs ->> ''''fda18675-59dc-4a69-82f7-4e137c274073'''' = c.uuid
WHERE lpe.program_name = ''''Adolescent''''
      AND lpe.agg_obs ->> ''''fda18675-59dc-4a69-82f7-4e137c274073'''' IS NOT NULL
'')') AS (
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