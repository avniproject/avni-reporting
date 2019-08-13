-- Generated Report
-- Name: Menstruation

SELECT * FROM crosstab('SELECT
''Menstruation Started''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''SELECT DISTINCT i.uuid              as uuid,
                i.gender            as gender_name,
                i.addresslevel_type as address_type,
                i.addresslevel_name as address_name
FROM non_exited_enrolment_completed_encounters_agg_view lpe
       JOIN individual_gender_address_view i ON i.id = lpe.individual_id
WHERE lpe.program_name = ''''Adolescent''''
  AND lpe.agg_obs @> ''''{"9cb4c266-0511-48f6-a058-d4f1fa3eb17c":"04bb1773-c353-44a1-a68c-9b448e07ff70"}''''
'', ''SELECT
  DISTINCT
  i.uuid  uuid,
  i.gender  gender_name,
  i.addresslevel_type  address_type,
  i.addresslevel_name address_name
FROM
  non_exited_program_enrolment_view enrolment
    LEFT OUTER JOIN individual_gender_address_view i ON enrolment.individual_id = i.id
WHERE enrolment.program_name = ''''Adolescent''''
'')
UNION ALL
SELECT
''Menstrual Disorder''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''WITH individual_program_partitions AS (
  SELECT i.uuid          AS                                                                                   iuuid,
         row_number() OVER (PARTITION BY i.uuid ORDER BY pe.encounter_date_time desc) erank,
         pe.uuid         AS                                                                                   euuid,
         pe.observations AS                                                                                   observations,
         pe.encounter_date_time
  FROM completed_program_encounter_view pe
         INNER JOIN non_exited_program_enrolment_view e ON pe.program_enrolment_id = e.id
         INNER JOIN individual_view i ON e.individual_id = i.id
  WHERE e.program_name = ''''Adolescent''''
    and (pe.encounter_type_name = ''''Annual Visit'''' or pe.encounter_type_name = ''''Quarterly Visit'''')
)
SELECT i.uuid  uuid,
       i.gender  gender_name,
       i.addresslevel_type  address_type,
       i.addresslevel_name address_name
FROM individual_program_partitions ip
       LEFT OUTER JOIN individual_gender_address_view i ON i.uuid = ip.iuuid
WHERE ip.observations -> ''''0f87eac1-cf6a-4632-8af2-29a935451fe4'''' IS NOT NULL
  AND ip.observations -> ''''0f87eac1-cf6a-4632-8af2-29a935451fe4'''' ?| ARRAY [''''92ad8878-b476-4291-aa76-3377fa7cf19c'''',
  ''''33385edf-93bc-4513-aa03-480ce3bc7b5c'''', ''''1c478c50-4761-460c-b33c-a18d0c1500f7'''',
  ''''761b7f7a-5db7-4115-aa84-32fcfce5ddfc'''', ''''4085f165-ccb8-409b-9d6e-ea7755cf123e'''',
  ''''aa30fb91-4b64-438b-b09e-4c7ff2701d71'''', ''''e27f4a35-c2ae-4d05-8930-e19e432221d1'''',
  ''''ce47ae12-e61c-49cc-8ccd-715f9d5cb76d'''']
  AND erank = 1
'', ''SELECT DISTINCT i.uuid              as uuid,
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
''Headache''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''WITH individual_program_partitions AS (
  SELECT i.uuid          AS                                                                                   iuuid,
         row_number() OVER (PARTITION BY i.uuid ORDER BY pe.encounter_date_time desc) erank,
         pe.uuid         AS                                                                                   euuid,
         pe.observations AS                                                                                   observations,
         pe.encounter_date_time
  FROM completed_program_encounter_view pe
         INNER JOIN non_exited_program_enrolment_view e ON pe.program_enrolment_id = e.id
         INNER JOIN individual_view i ON e.individual_id = i.id
  WHERE e.program_name = ''''Adolescent''''
    and (pe.encounter_type_name = ''''Annual Visit'''' or pe.encounter_type_name = ''''Quarterly Visit'''')
)
SELECT i.uuid  uuid,
       i.gender  gender_name,
       i.addresslevel_type  address_type,
       i.addresslevel_name address_name
FROM individual_program_partitions ip
       LEFT OUTER JOIN individual_gender_address_view i ON i.uuid = ip.iuuid
WHERE ip.observations -> ''''0f87eac1-cf6a-4632-8af2-29a935451fe4'''' IS NOT NULL
  AND ip.observations -> ''''0f87eac1-cf6a-4632-8af2-29a935451fe4'''' ?| ARRAY [''''4085f165-ccb8-409b-9d6e-ea7755cf123e'''']
  AND erank = 1
'', ''WITH individual_program_partitions AS (
  SELECT i.uuid          AS                                                                                   iuuid,
         row_number() OVER (PARTITION BY i.uuid ORDER BY pe.encounter_date_time desc) erank,
         pe.uuid         AS                                                                                   euuid,
         pe.observations AS                                                                                   observations,
         pe.encounter_date_time
  FROM completed_program_encounter_view pe
         INNER JOIN non_exited_program_enrolment_view e ON pe.program_enrolment_id = e.id
         INNER JOIN individual_view i ON e.individual_id = i.id
  WHERE e.program_name = ''''Adolescent''''
    and (pe.encounter_type_name = ''''Annual Visit'''' or pe.encounter_type_name = ''''Quarterly Visit'''')
)
SELECT i.uuid  uuid,
       i.gender  gender_name,
       i.addresslevel_type  address_type,
       i.addresslevel_name address_name
FROM individual_program_partitions ip
       LEFT OUTER JOIN individual_gender_address_view i ON i.uuid = ip.iuuid
WHERE ip.observations -> ''''0f87eac1-cf6a-4632-8af2-29a935451fe4'''' IS NOT NULL
  AND ip.observations -> ''''0f87eac1-cf6a-4632-8af2-29a935451fe4'''' ?| ARRAY [''''92ad8878-b476-4291-aa76-3377fa7cf19c'''',
  ''''33385edf-93bc-4513-aa03-480ce3bc7b5c'''', ''''1c478c50-4761-460c-b33c-a18d0c1500f7'''',
  ''''761b7f7a-5db7-4115-aa84-32fcfce5ddfc'''', ''''4085f165-ccb8-409b-9d6e-ea7755cf123e'''',
  ''''aa30fb91-4b64-438b-b09e-4c7ff2701d71'''', ''''e27f4a35-c2ae-4d05-8930-e19e432221d1'''',
  ''''ce47ae12-e61c-49cc-8ccd-715f9d5cb76d'''']
  AND erank = 1
'')
UNION ALL
SELECT
''Heavy Bleeding''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''WITH individual_program_partitions AS (
  SELECT i.uuid          AS                                                                                   iuuid,
         row_number() OVER (PARTITION BY i.uuid ORDER BY pe.encounter_date_time desc) erank,
         pe.uuid         AS                                                                                   euuid,
         pe.observations AS                                                                                   observations,
         pe.encounter_date_time
  FROM completed_program_encounter_view pe
         INNER JOIN non_exited_program_enrolment_view e ON pe.program_enrolment_id = e.id
         INNER JOIN individual_view i ON e.individual_id = i.id
  WHERE e.program_name = ''''Adolescent''''
    and (pe.encounter_type_name = ''''Annual Visit'''' or pe.encounter_type_name = ''''Quarterly Visit'''')
)
SELECT i.uuid  uuid,
       i.gender  gender_name,
       i.addresslevel_type  address_type,
       i.addresslevel_name address_name
FROM individual_program_partitions ip
       LEFT OUTER JOIN individual_gender_address_view i ON i.uuid = ip.iuuid
WHERE ip.observations -> ''''0f87eac1-cf6a-4632-8af2-29a935451fe4'''' IS NOT NULL
  AND ip.observations -> ''''0f87eac1-cf6a-4632-8af2-29a935451fe4'''' ?| ARRAY [''''e27f4a35-c2ae-4d05-8930-e19e432221d1'''']
  AND erank = 1

'', ''WITH individual_program_partitions AS (
  SELECT i.uuid          AS                                                                                   iuuid,
         row_number() OVER (PARTITION BY i.uuid ORDER BY pe.encounter_date_time desc) erank,
         pe.uuid         AS                                                                                   euuid,
         pe.observations AS                                                                                   observations,
         pe.encounter_date_time
  FROM completed_program_encounter_view pe
         INNER JOIN non_exited_program_enrolment_view e ON pe.program_enrolment_id = e.id
         INNER JOIN individual_view i ON e.individual_id = i.id
  WHERE e.program_name = ''''Adolescent''''
    and (pe.encounter_type_name = ''''Annual Visit'''' or pe.encounter_type_name = ''''Quarterly Visit'''')
)
SELECT i.uuid  uuid,
       i.gender  gender_name,
       i.addresslevel_type  address_type,
       i.addresslevel_name address_name
FROM individual_program_partitions ip
       LEFT OUTER JOIN individual_gender_address_view i ON i.uuid = ip.iuuid
WHERE ip.observations -> ''''0f87eac1-cf6a-4632-8af2-29a935451fe4'''' IS NOT NULL
  AND ip.observations -> ''''0f87eac1-cf6a-4632-8af2-29a935451fe4'''' ?| ARRAY [''''92ad8878-b476-4291-aa76-3377fa7cf19c'''',
  ''''33385edf-93bc-4513-aa03-480ce3bc7b5c'''', ''''1c478c50-4761-460c-b33c-a18d0c1500f7'''',
  ''''761b7f7a-5db7-4115-aa84-32fcfce5ddfc'''', ''''4085f165-ccb8-409b-9d6e-ea7755cf123e'''',
  ''''aa30fb91-4b64-438b-b09e-4c7ff2701d71'''', ''''e27f4a35-c2ae-4d05-8930-e19e432221d1'''',
  ''''ce47ae12-e61c-49cc-8ccd-715f9d5cb76d'''']
  AND erank = 1
'')
UNION ALL
SELECT
''Lower Abdominal Pain''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''WITH individual_program_partitions AS (
  SELECT i.uuid          AS                                                                                   iuuid,
         row_number() OVER (PARTITION BY i.uuid ORDER BY pe.encounter_date_time desc) erank,
         pe.uuid         AS                                                                                   euuid,
         pe.observations AS                                                                                   observations,
         pe.encounter_date_time
  FROM completed_program_encounter_view pe
         INNER JOIN non_exited_program_enrolment_view e ON pe.program_enrolment_id = e.id
         INNER JOIN individual_view i ON e.individual_id = i.id
  WHERE e.program_name = ''''Adolescent''''
    and (pe.encounter_type_name = ''''Annual Visit'''' or pe.encounter_type_name = ''''Quarterly Visit'''')
)
SELECT i.uuid  uuid,
       i.gender  gender_name,
       i.addresslevel_type  address_type,
       i.addresslevel_name address_name
FROM individual_program_partitions ip
       LEFT OUTER JOIN individual_gender_address_view i ON i.uuid = ip.iuuid
WHERE ip.observations -> ''''0f87eac1-cf6a-4632-8af2-29a935451fe4'''' IS NOT NULL
  AND ip.observations -> ''''0f87eac1-cf6a-4632-8af2-29a935451fe4'''' ?| ARRAY [''''92ad8878-b476-4291-aa76-3377fa7cf19c'''']
  AND erank = 1
'', ''WITH individual_program_partitions AS (
  SELECT i.uuid          AS                                                                                   iuuid,
         row_number() OVER (PARTITION BY i.uuid ORDER BY pe.encounter_date_time desc) erank,
         pe.uuid         AS                                                                                   euuid,
         pe.observations AS                                                                                   observations,
         pe.encounter_date_time
  FROM completed_program_encounter_view pe
         INNER JOIN non_exited_program_enrolment_view e ON pe.program_enrolment_id = e.id
         INNER JOIN individual_view i ON e.individual_id = i.id
  WHERE e.program_name = ''''Adolescent''''
    and (pe.encounter_type_name = ''''Annual Visit'''' or pe.encounter_type_name = ''''Quarterly Visit'''')
)
SELECT i.uuid  uuid,
       i.gender  gender_name,
       i.addresslevel_type  address_type,
       i.addresslevel_name address_name
FROM individual_program_partitions ip
       LEFT OUTER JOIN individual_gender_address_view i ON i.uuid = ip.iuuid
WHERE ip.observations -> ''''0f87eac1-cf6a-4632-8af2-29a935451fe4'''' IS NOT NULL
  AND ip.observations -> ''''0f87eac1-cf6a-4632-8af2-29a935451fe4'''' ?| ARRAY [''''92ad8878-b476-4291-aa76-3377fa7cf19c'''',
  ''''33385edf-93bc-4513-aa03-480ce3bc7b5c'''', ''''1c478c50-4761-460c-b33c-a18d0c1500f7'''',
  ''''761b7f7a-5db7-4115-aa84-32fcfce5ddfc'''', ''''4085f165-ccb8-409b-9d6e-ea7755cf123e'''',
  ''''aa30fb91-4b64-438b-b09e-4c7ff2701d71'''', ''''e27f4a35-c2ae-4d05-8930-e19e432221d1'''',
  ''''ce47ae12-e61c-49cc-8ccd-715f9d5cb76d'''']
  AND erank = 1
'')
UNION ALL
SELECT
''Abnormal Discharge''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''WITH individual_program_partitions AS (
  SELECT i.uuid          AS                                                                                   iuuid,
         row_number() OVER (PARTITION BY i.uuid ORDER BY pe.encounter_date_time desc) erank,
         pe.uuid         AS                                                                                   euuid,
         pe.observations AS                                                                                   observations,
         pe.encounter_date_time
  FROM completed_program_encounter_view pe
         INNER JOIN non_exited_program_enrolment_view e ON pe.program_enrolment_id = e.id
         INNER JOIN individual_view i ON e.individual_id = i.id
  WHERE e.program_name = ''''Adolescent''''
    and (pe.encounter_type_name = ''''Annual Visit'''' or pe.encounter_type_name = ''''Quarterly Visit'''')
)
SELECT i.uuid              as uuid,
       i.gender            as gender_name,
       i.addresslevel_type as address_type,
       i.addresslevel_name as address_name
FROM individual_program_partitions ip
       LEFT OUTER JOIN individual_gender_address_view i ON i.uuid = ip.iuuid
WHERE ip.observations -> ''''0f87eac1-cf6a-4632-8af2-29a935451fe4'''' IS NOT NULL
  AND ip.observations -> ''''0f87eac1-cf6a-4632-8af2-29a935451fe4'''' ?| ARRAY [''''aa30fb91-4b64-438b-b09e-4c7ff2701d71'''']
  AND erank = 1
'', ''WITH individual_program_partitions AS (
  SELECT i.uuid          AS                                                                                   iuuid,
         row_number() OVER (PARTITION BY i.uuid ORDER BY pe.encounter_date_time desc) erank,
         pe.uuid         AS                                                                                   euuid,
         pe.observations AS                                                                                   observations,
         pe.encounter_date_time
  FROM completed_program_encounter_view pe
         INNER JOIN non_exited_program_enrolment_view e ON pe.program_enrolment_id = e.id
         INNER JOIN individual_view i ON e.individual_id = i.id
  WHERE e.program_name = ''''Adolescent''''
    and (pe.encounter_type_name = ''''Annual Visit'''' or pe.encounter_type_name = ''''Quarterly Visit'''')
)
SELECT i.uuid  uuid,
       i.gender  gender_name,
       i.addresslevel_type  address_type,
       i.addresslevel_name address_name
FROM individual_program_partitions ip
       LEFT OUTER JOIN individual_gender_address_view i ON i.uuid = ip.iuuid
WHERE ip.observations -> ''''0f87eac1-cf6a-4632-8af2-29a935451fe4'''' IS NOT NULL
  AND ip.observations -> ''''0f87eac1-cf6a-4632-8af2-29a935451fe4'''' ?| ARRAY [''''92ad8878-b476-4291-aa76-3377fa7cf19c'''',
  ''''33385edf-93bc-4513-aa03-480ce3bc7b5c'''', ''''1c478c50-4761-460c-b33c-a18d0c1500f7'''',
  ''''761b7f7a-5db7-4115-aa84-32fcfce5ddfc'''', ''''4085f165-ccb8-409b-9d6e-ea7755cf123e'''',
  ''''aa30fb91-4b64-438b-b09e-4c7ff2701d71'''', ''''e27f4a35-c2ae-4d05-8930-e19e432221d1'''',
  ''''ce47ae12-e61c-49cc-8ccd-715f9d5cb76d'''']
  AND erank = 1
'')
UNION ALL
SELECT
''Backache''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''WITH individual_program_partitions AS (
  SELECT i.uuid          AS                                                                                   iuuid,
         row_number() OVER (PARTITION BY i.uuid ORDER BY pe.encounter_date_time desc) erank,
         pe.uuid         AS                                                                                   euuid,
         pe.observations AS                                                                                   observations,
         pe.encounter_date_time
  FROM completed_program_encounter_view pe
         INNER JOIN non_exited_program_enrolment_view e ON pe.program_enrolment_id = e.id
         INNER JOIN individual_view i ON e.individual_id = i.id
  WHERE e.program_name = ''''Adolescent''''
    and (pe.encounter_type_name = ''''Annual Visit'''' or pe.encounter_type_name = ''''Quarterly Visit'''')
)
SELECT i.uuid  uuid,
       i.gender  gender_name,
       i.addresslevel_type  address_type,
       i.addresslevel_name address_name
FROM individual_program_partitions ip
       LEFT OUTER JOIN individual_gender_address_view i ON i.uuid = ip.iuuid
WHERE ip.observations -> ''''0f87eac1-cf6a-4632-8af2-29a935451fe4'''' IS NOT NULL
  AND ip.observations -> ''''0f87eac1-cf6a-4632-8af2-29a935451fe4'''' ?| ARRAY [''''33385edf-93bc-4513-aa03-480ce3bc7b5c'''']
  AND erank = 1
'', ''WITH individual_program_partitions AS (
  SELECT i.uuid          AS                                                                                   iuuid,
         row_number() OVER (PARTITION BY i.uuid ORDER BY pe.encounter_date_time desc) erank,
         pe.uuid         AS                                                                                   euuid,
         pe.observations AS                                                                                   observations,
         pe.encounter_date_time
  FROM completed_program_encounter_view pe
         INNER JOIN non_exited_program_enrolment_view e ON pe.program_enrolment_id = e.id
         INNER JOIN individual_view i ON e.individual_id = i.id
  WHERE e.program_name = ''''Adolescent''''
    and (pe.encounter_type_name = ''''Annual Visit'''' or pe.encounter_type_name = ''''Quarterly Visit'''')
)
SELECT i.uuid  uuid,
       i.gender  gender_name,
       i.addresslevel_type  address_type,
       i.addresslevel_name address_name
FROM individual_program_partitions ip
       LEFT OUTER JOIN individual_gender_address_view i ON i.uuid = ip.iuuid
WHERE ip.observations -> ''''0f87eac1-cf6a-4632-8af2-29a935451fe4'''' IS NOT NULL
  AND ip.observations -> ''''0f87eac1-cf6a-4632-8af2-29a935451fe4'''' ?| ARRAY [''''92ad8878-b476-4291-aa76-3377fa7cf19c'''',
  ''''33385edf-93bc-4513-aa03-480ce3bc7b5c'''', ''''1c478c50-4761-460c-b33c-a18d0c1500f7'''',
  ''''761b7f7a-5db7-4115-aa84-32fcfce5ddfc'''', ''''4085f165-ccb8-409b-9d6e-ea7755cf123e'''',
  ''''aa30fb91-4b64-438b-b09e-4c7ff2701d71'''', ''''e27f4a35-c2ae-4d05-8930-e19e432221d1'''',
  ''''ce47ae12-e61c-49cc-8ccd-715f9d5cb76d'''']
  AND erank = 1
'')
UNION ALL
SELECT
''Leg Pain''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''WITH individual_program_partitions AS (
  SELECT i.uuid          AS                                                                                   iuuid,
         row_number() OVER (PARTITION BY i.uuid ORDER BY pe.encounter_date_time desc) erank,
         pe.uuid         AS                                                                                   euuid,
         pe.observations AS                                                                                   observations,
         pe.encounter_date_time
  FROM completed_program_encounter_view pe
         INNER JOIN non_exited_program_enrolment_view e ON pe.program_enrolment_id = e.id
         INNER JOIN individual_view i ON e.individual_id = i.id
  WHERE e.program_name = ''''Adolescent''''
    and (pe.encounter_type_name = ''''Annual Visit'''' or pe.encounter_type_name = ''''Quarterly Visit'''')
)
SELECT i.uuid  uuid,
       i.gender  gender_name,
       i.addresslevel_type  address_type,
       i.addresslevel_name address_name
FROM individual_program_partitions ip
       LEFT OUTER JOIN individual_gender_address_view i ON i.uuid = ip.iuuid
WHERE ip.observations -> ''''0f87eac1-cf6a-4632-8af2-29a935451fe4'''' IS NOT NULL
  AND ip.observations -> ''''0f87eac1-cf6a-4632-8af2-29a935451fe4'''' ?| ARRAY [''''1c478c50-4761-460c-b33c-a18d0c1500f7'''']
  AND erank = 1
'', ''WITH individual_program_partitions AS (
  SELECT i.uuid          AS                                                                                   iuuid,
         row_number() OVER (PARTITION BY i.uuid ORDER BY pe.encounter_date_time desc) erank,
         pe.uuid         AS                                                                                   euuid,
         pe.observations AS                                                                                   observations,
         pe.encounter_date_time
  FROM completed_program_encounter_view pe
         INNER JOIN non_exited_program_enrolment_view e ON pe.program_enrolment_id = e.id
         INNER JOIN individual_view i ON e.individual_id = i.id
  WHERE e.program_name = ''''Adolescent''''
    and (pe.encounter_type_name = ''''Annual Visit'''' or pe.encounter_type_name = ''''Quarterly Visit'''')
)
SELECT i.uuid  uuid,
       i.gender  gender_name,
       i.addresslevel_type  address_type,
       i.addresslevel_name address_name
FROM individual_program_partitions ip
       LEFT OUTER JOIN individual_gender_address_view i ON i.uuid = ip.iuuid
WHERE ip.observations -> ''''0f87eac1-cf6a-4632-8af2-29a935451fe4'''' IS NOT NULL
  AND ip.observations -> ''''0f87eac1-cf6a-4632-8af2-29a935451fe4'''' ?| ARRAY [''''92ad8878-b476-4291-aa76-3377fa7cf19c'''',
  ''''33385edf-93bc-4513-aa03-480ce3bc7b5c'''', ''''1c478c50-4761-460c-b33c-a18d0c1500f7'''',
  ''''761b7f7a-5db7-4115-aa84-32fcfce5ddfc'''', ''''4085f165-ccb8-409b-9d6e-ea7755cf123e'''',
  ''''aa30fb91-4b64-438b-b09e-4c7ff2701d71'''', ''''e27f4a35-c2ae-4d05-8930-e19e432221d1'''',
  ''''ce47ae12-e61c-49cc-8ccd-715f9d5cb76d'''']
  AND erank = 1
'')
UNION ALL
SELECT
''Nausea And Vomiting''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''WITH individual_program_partitions AS (
  SELECT i.uuid          AS                                                           iuuid,
         row_number() OVER (PARTITION BY i.uuid ORDER BY pe.encounter_date_time desc) erank,
         pe.uuid         AS                                                           euuid,
         pe.observations AS                                                           observations,
         pe.encounter_date_time
  FROM completed_program_encounter_view pe
         INNER JOIN non_exited_program_enrolment_view e ON pe.program_enrolment_id = e.id
         INNER JOIN individual_view i ON e.individual_id = i.id
  WHERE e.program_name = ''''Adolescent''''
    and (pe.encounter_type_name = ''''Annual Visit'''' or pe.encounter_type_name = ''''Quarterly Visit'''')
)
SELECT i.uuid              uuid,
       i.gender            gender_name,
       i.addresslevel_type address_type,
       i.addresslevel_name address_name
FROM individual_program_partitions ip
       LEFT OUTER JOIN individual_gender_address_view i ON i.uuid = ip.iuuid
WHERE ip.observations -> ''''0f87eac1-cf6a-4632-8af2-29a935451fe4'''' IS NOT NULL
  AND ip.observations -> ''''0f87eac1-cf6a-4632-8af2-29a935451fe4'''' ?| ARRAY [''''761b7f7a-5db7-4115-aa84-32fcfce5ddfc'''']
  AND erank = 1
'', ''WITH individual_program_partitions AS (
  SELECT i.uuid          AS                                                                                   iuuid,
         row_number() OVER (PARTITION BY i.uuid ORDER BY pe.encounter_date_time desc) erank,
         pe.uuid         AS                                                                                   euuid,
         pe.observations AS                                                                                   observations,
         pe.encounter_date_time
  FROM completed_program_encounter_view pe
         INNER JOIN non_exited_program_enrolment_view e ON pe.program_enrolment_id = e.id
         INNER JOIN individual_view i ON e.individual_id = i.id
  WHERE e.program_name = ''''Adolescent''''
    and (pe.encounter_type_name = ''''Annual Visit'''' or pe.encounter_type_name = ''''Quarterly Visit'''')
)
SELECT i.uuid  uuid,
       i.gender  gender_name,
       i.addresslevel_type  address_type,
       i.addresslevel_name address_name
FROM individual_program_partitions ip
       LEFT OUTER JOIN individual_gender_address_view i ON i.uuid = ip.iuuid
WHERE ip.observations -> ''''0f87eac1-cf6a-4632-8af2-29a935451fe4'''' IS NOT NULL
  AND ip.observations -> ''''0f87eac1-cf6a-4632-8af2-29a935451fe4'''' ?| ARRAY [''''92ad8878-b476-4291-aa76-3377fa7cf19c'''',
  ''''33385edf-93bc-4513-aa03-480ce3bc7b5c'''', ''''1c478c50-4761-460c-b33c-a18d0c1500f7'''',
  ''''761b7f7a-5db7-4115-aa84-32fcfce5ddfc'''', ''''4085f165-ccb8-409b-9d6e-ea7755cf123e'''',
  ''''aa30fb91-4b64-438b-b09e-4c7ff2701d71'''', ''''e27f4a35-c2ae-4d05-8930-e19e432221d1'''',
  ''''ce47ae12-e61c-49cc-8ccd-715f9d5cb76d'''']
  AND erank = 1
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