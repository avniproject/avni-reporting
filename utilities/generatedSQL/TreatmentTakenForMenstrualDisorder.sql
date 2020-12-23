-- Generated Report
-- Name: TreatmentTakenForMenstrualDisorder

with filters as (
    select coalesce( [[ {{start_date}} , ]] '1900-01-01'::timestamptz) start_date,
           coalesce( [[ {{end_date}} , ]] current_timestamp) end_date
)

SELECT * FROM crosstab('SELECT
''Disorder''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''SELECT i.uuid as uuid,
       i.gender as gender_name,
       i.addresslevel_type as address_type,
       i.addresslevel_name as address_name
FROM non_exited_enrolment_completed_encounters_agg_view lpe
      JOIN individual_gender_address_view i ON i.id = lpe.individual_id
WHERE lpe.program_name = ''''Adolescent'''' AND
      lpe.agg_obs -> ''''0f87eac1-cf6a-4632-8af2-29a935451fe4'''' IS NOT NULL AND
      lpe.agg_obs -> ''''0f87eac1-cf6a-4632-8af2-29a935451fe4'''' ?| ARRAY [''''92ad8878-b476-4291-aa76-3377fa7cf19c'''',
      ''''33385edf-93bc-4513-aa03-480ce3bc7b5c'''', ''''1c478c50-4761-460c-b33c-a18d0c1500f7'''',
      ''''761b7f7a-5db7-4115-aa84-32fcfce5ddfc'''', ''''4085f165-ccb8-409b-9d6e-ea7755cf123e'''',
      ''''aa30fb91-4b64-438b-b09e-4c7ff2701d71'''', ''''e27f4a35-c2ae-4d05-8930-e19e432221d1'''',
      ''''ce47ae12-e61c-49cc-8ccd-715f9d5cb76d'''']'', ''SELECT DISTINCT i.uuid              as uuid,
                i.gender            as gender_name,
                i.addresslevel_type as address_type,
                i.addresslevel_name as address_name
FROM non_exited_enrolment_completed_encounters_agg_view lpe
       JOIN individual_gender_address_view i ON i.id = lpe.individual_id
WHERE lpe.program_name = ''''Adolescent''''
  AND lpe.agg_obs @> ''''{"9cb4c266-0511-48f6-a058-d4f1fa3eb17c":"04bb1773-c353-44a1-a68c-9b448e07ff70"}''''
'')
UNION ALL
SELECT
''Treament Taken''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''SELECT i.uuid as uuid,
       i.gender as gender_name,
       i.addresslevel_type as address_type,
       i.addresslevel_name as address_name
FROM non_exited_enrolment_completed_encounters_agg_view lpe
      JOIN individual_gender_address_view i ON i.id = lpe.individual_id
WHERE lpe.program_name = ''''Adolescent'''' AND
      lpe.agg_obs -> ''''bd3d1ba3-0a85-4aa7-a62c-78254d8e0762'''' IS NOT NULL AND
      lpe.agg_obs -> ''''bd3d1ba3-0a85-4aa7-a62c-78254d8e0762'''' ?| ARRAY [''''c215bcd4-6057-4544-b0bd-1339c8e75d5d'''',
      ''''905d4a48-7fe6-43ac-a64f-61b906596b34'''', ''''19394a8e-bd38-46a2-a5e4-23f063125477'''', ''''750c91e9-f768-4888-9103-423c3736d203'''']'', ''SELECT DISTINCT i.uuid              as uuid,
                i.gender            as gender_name,
                i.addresslevel_type as address_type,
                i.addresslevel_name as address_name
FROM non_exited_enrolment_completed_encounters_agg_view lpe
       JOIN individual_gender_address_view i ON i.id = lpe.individual_id
WHERE lpe.program_name = ''''Adolescent''''
  AND lpe.agg_obs @> ''''{"9cb4c266-0511-48f6-a058-d4f1fa3eb17c":"04bb1773-c353-44a1-a68c-9b448e07ff70"}''''
'')
UNION ALL
SELECT
''Home Remedy''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''SELECT i.uuid as uuid,
       i.gender as gender_name,
       i.addresslevel_type as address_type,
       i.addresslevel_name as address_name
FROM non_exited_enrolment_completed_encounters_agg_view lpe
      JOIN individual_gender_address_view i ON i.id = lpe.individual_id
WHERE lpe.program_name = ''''Adolescent'''' AND
      lpe.agg_obs -> ''''bd3d1ba3-0a85-4aa7-a62c-78254d8e0762'''' IS NOT NULL AND
      lpe.agg_obs -> ''''bd3d1ba3-0a85-4aa7-a62c-78254d8e0762'''' ?| ARRAY [''''c215bcd4-6057-4544-b0bd-1339c8e75d5d'''']'', ''SELECT DISTINCT i.uuid              as uuid,
                i.gender            as gender_name,
                i.addresslevel_type as address_type,
                i.addresslevel_name as address_name
FROM non_exited_enrolment_completed_encounters_agg_view lpe
       JOIN individual_gender_address_view i ON i.id = lpe.individual_id
WHERE lpe.program_name = ''''Adolescent''''
  AND lpe.agg_obs @> ''''{"9cb4c266-0511-48f6-a058-d4f1fa3eb17c":"04bb1773-c353-44a1-a68c-9b448e07ff70"}''''
'')
UNION ALL
SELECT
''Consulted Doctor''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''SELECT i.uuid              as uuid,
       i.gender            as gender_name,
       i.addresslevel_type as address_type,
       i.addresslevel_name as address_name
FROM non_exited_enrolment_completed_encounters_agg_view lpe
       JOIN individual_gender_address_view i ON i.id = lpe.individual_id
WHERE lpe.program_name = ''''Adolescent''''
  AND lpe.agg_obs -> ''''bd3d1ba3-0a85-4aa7-a62c-78254d8e0762'''' IS NOT NULL
  AND lpe.agg_obs -> ''''bd3d1ba3-0a85-4aa7-a62c-78254d8e0762'''' ?|
      ARRAY [''''905d4a48-7fe6-43ac-a64f-61b906596b34'''']'', ''SELECT DISTINCT i.uuid              as uuid,
                i.gender            as gender_name,
                i.addresslevel_type as address_type,
                i.addresslevel_name as address_name
FROM non_exited_enrolment_completed_encounters_agg_view lpe
       JOIN individual_gender_address_view i ON i.id = lpe.individual_id
WHERE lpe.program_name = ''''Adolescent''''
  AND lpe.agg_obs @> ''''{"9cb4c266-0511-48f6-a058-d4f1fa3eb17c":"04bb1773-c353-44a1-a68c-9b448e07ff70"}''''
'')
UNION ALL
SELECT
''Tablet From Shop''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''SELECT i.uuid as uuid,
       i.gender as gender_name,
       i.addresslevel_type as address_type,
       i.addresslevel_name as address_name
FROM non_exited_enrolment_completed_encounters_agg_view lpe
      JOIN individual_gender_address_view i ON i.id = lpe.individual_id
WHERE lpe.program_name = ''''Adolescent'''' AND
      lpe.agg_obs -> ''''bd3d1ba3-0a85-4aa7-a62c-78254d8e0762'''' IS NOT NULL AND
      lpe.agg_obs -> ''''bd3d1ba3-0a85-4aa7-a62c-78254d8e0762'''' ?| ARRAY [''''19394a8e-bd38-46a2-a5e4-23f063125477'''']'', ''SELECT DISTINCT i.uuid              as uuid,
                i.gender            as gender_name,
                i.addresslevel_type as address_type,
                i.addresslevel_name as address_name
FROM non_exited_enrolment_completed_encounters_agg_view lpe
       JOIN individual_gender_address_view i ON i.id = lpe.individual_id
WHERE lpe.program_name = ''''Adolescent''''
  AND lpe.agg_obs @> ''''{"9cb4c266-0511-48f6-a058-d4f1fa3eb17c":"04bb1773-c353-44a1-a68c-9b448e07ff70"}''''
'')
UNION ALL
SELECT
''Tablet From Kit''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''SELECT i.uuid as uuid,
       i.gender as gender_name,
       i.addresslevel_type as address_type,
       i.addresslevel_name as address_name
FROM non_exited_enrolment_completed_encounters_agg_view lpe
      JOIN individual_gender_address_view i ON i.id = lpe.individual_id
WHERE lpe.program_name = ''''Adolescent'''' AND
      lpe.agg_obs -> ''''bd3d1ba3-0a85-4aa7-a62c-78254d8e0762'''' IS NOT NULL AND
      lpe.agg_obs -> ''''bd3d1ba3-0a85-4aa7-a62c-78254d8e0762'''' ?| ARRAY [''''750c91e9-f768-4888-9103-423c3736d203'''']'', ''SELECT DISTINCT i.uuid              as uuid,
                i.gender            as gender_name,
                i.addresslevel_type as address_type,
                i.addresslevel_name as address_name
FROM non_exited_enrolment_completed_encounters_agg_view lpe
       JOIN individual_gender_address_view i ON i.id = lpe.individual_id
WHERE lpe.program_name = ''''Adolescent''''
  AND lpe.agg_obs @> ''''{"9cb4c266-0511-48f6-a058-d4f1fa3eb17c":"04bb1773-c353-44a1-a68c-9b448e07ff70"}''''
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