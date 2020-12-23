-- Generated Report
-- Name: AbsorbentMaterialUsed

with filters as (
    select coalesce( [[ {{start_date}} , ]] '1900-01-01'::timestamptz) start_date,
           coalesce( [[ {{end_date}} , ]] current_timestamp) end_date
)

SELECT * FROM crosstab('SELECT
''Old Cloth''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''WITH individual_program_partitions AS (
  SELECT i.uuid          AS                                                           iuuid,
         row_number() OVER (PARTITION BY i.uuid ORDER BY pe.encounter_date_time desc) erank,
         pe.uuid         AS                                                           euuid,
         pe.observations AS                                                           obs,
         pe.encounter_date_time
  FROM completed_program_encounter_view pe
         INNER JOIN non_exited_program_enrolment_view e ON pe.program_enrolment_id = e.id
         INNER JOIN individual_view i ON e.individual_id = i.id
  WHERE e.program_name = ''''Adolescent''''
    AND (pe.encounter_type_name = ''''Annual Visit'''' or pe.encounter_type_name = ''''Quarterly Visit'''')
    [[ and e.enrolment_date_time >=(' || '''' || quote_literal({{ start_date }}) || '''' || '  ::DATE)]]
    [[and e.enrolment_date_time <=' || '''' || quote_literal({{end_date}}) || '''' || ' ::DATE]]
)
SELECT i.uuid              as uuid,
       i.gender            as gender_name,
       i.addresslevel_type as address_type,
       i.addresslevel_name as address_name
FROM individual_program_partitions ip
       JOIN individual_gender_address_view i ON i.uuid = ip.iuuid
WHERE ip.obs -> ''''a54fcfad-8656-46ae-9706-671a600eabca'''' IS NOT NULL
  AND ip.obs -> ''''a54fcfad-8656-46ae-9706-671a600eabca'''' ?| ARRAY [''''968b26b8-a357-4960-8aa8-0db67a728481'''']
  AND erank = 1
'', ''SELECT DISTINCT i.uuid              as uuid,
                i.gender            as gender_name,
                i.addresslevel_type as address_type,
                i.addresslevel_name as address_name
FROM non_exited_enrolment_completed_encounters_agg_view lpe
       JOIN individual_gender_address_view i ON i.id = lpe.individual_id
       JOIN non_exited_program_enrolment_view e ON e.individual_id = i.id
WHERE lpe.program_name = ''''Adolescent''''
  AND lpe.agg_obs @> ''''{"9cb4c266-0511-48f6-a058-d4f1fa3eb17c":"04bb1773-c353-44a1-a68c-9b448e07ff70"}''''
    [[ and e.enrolment_date_time >=(' || '''' || quote_literal({{ start_date }}) || '''' || '  ::DATE)]]
    [[and e.enrolment_date_time <=' || '''' || quote_literal({{end_date}}) || '''' || ' ::DATE]]
'')
UNION ALL
SELECT
''Sanitary Pad''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''WITH individual_program_partitions AS (
  SELECT i.uuid          AS                                                           iuuid,
         row_number() OVER (PARTITION BY i.uuid ORDER BY pe.encounter_date_time desc) erank,
         pe.uuid         AS                                                           euuid,
         pe.observations AS                                                           obs,
         pe.encounter_date_time
  FROM completed_program_encounter_view pe
         INNER JOIN non_exited_program_enrolment_view e ON pe.program_enrolment_id = e.id
         INNER JOIN individual_view i ON e.individual_id = i.id
  WHERE e.program_name = ''''Adolescent''''
    AND (pe.encounter_type_name = ''''Annual Visit'''' or pe.encounter_type_name = ''''Quarterly Visit'''')
    [[ and e.enrolment_date_time >=(' || '''' || quote_literal({{ start_date }}) || '''' || '  ::DATE)]]
    [[and e.enrolment_date_time <=' || '''' || quote_literal({{end_date}}) || '''' || ' ::DATE]]
)
SELECT i.uuid              as uuid,
       i.gender            as gender_name,
       i.addresslevel_type as address_type,
       i.addresslevel_name as address_name
FROM individual_program_partitions ip
       JOIN individual_gender_address_view i ON i.uuid = ip.iuuid
WHERE ip.obs -> ''''a54fcfad-8656-46ae-9706-671a600eabca'''' IS NOT NULL
  AND ip.obs -> ''''a54fcfad-8656-46ae-9706-671a600eabca'''' ?| ARRAY [''''fa118efa-116e-471e-a9cc-f39eabbc0a57'''']
  AND erank = 1
'', ''SELECT DISTINCT i.uuid              as uuid,
                i.gender            as gender_name,
                i.addresslevel_type as address_type,
                i.addresslevel_name as address_name
FROM non_exited_enrolment_completed_encounters_agg_view lpe
       JOIN individual_gender_address_view i ON i.id = lpe.individual_id
       JOIN non_exited_program_enrolment_view e ON e.individual_id = i.id
WHERE lpe.program_name = ''''Adolescent''''
  AND lpe.agg_obs @> ''''{"9cb4c266-0511-48f6-a058-d4f1fa3eb17c":"04bb1773-c353-44a1-a68c-9b448e07ff70"}''''
    [[ and e.enrolment_date_time >=(' || '''' || quote_literal({{ start_date }}) || '''' || '  ::DATE)]]
    [[and e.enrolment_date_time <=' || '''' || quote_literal({{end_date}}) || '''' || ' ::DATE]]
'')
UNION ALL
SELECT
''Falalin''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''WITH individual_program_partitions AS (
  SELECT i.uuid          AS                                                           iuuid,
         row_number() OVER (PARTITION BY i.uuid ORDER BY pe.encounter_date_time desc) erank,
         pe.uuid         AS                                                           euuid,
         pe.observations AS                                                           obs,
         pe.encounter_date_time
  FROM completed_program_encounter_view pe
         INNER JOIN non_exited_program_enrolment_view e ON pe.program_enrolment_id = e.id
         INNER JOIN individual_view i ON e.individual_id = i.id
  WHERE e.program_name = ''''Adolescent''''
    AND (pe.encounter_type_name = ''''Annual Visit'''' or pe.encounter_type_name = ''''Quarterly Visit'''')
    [[ and e.enrolment_date_time >=(' || '''' || quote_literal({{ start_date }}) || '''' || '  ::DATE)]]
    [[and e.enrolment_date_time <=' || '''' || quote_literal({{end_date}}) || '''' || ' ::DATE]]
)
SELECT i.uuid              as uuid,
       i.gender            as gender_name,
       i.addresslevel_type as address_type,
       i.addresslevel_name as address_name
FROM individual_program_partitions ip
       JOIN individual_gender_address_view i ON i.uuid = ip.iuuid
WHERE ip.obs -> ''''a54fcfad-8656-46ae-9706-671a600eabca'''' IS NOT NULL
  AND (ip.obs -> ''''a54fcfad-8656-46ae-9706-671a600eabca'''' ?| ARRAY [''''6ebf2af2-38c6-4703-98c2-cba9f234b8f5'''']
   or ip.obs -> ''''a54fcfad-8656-46ae-9706-671a600eabca'''' ?| ARRAY [''''99414d2a-b7b1-434d-9354-c3da69619d83''''])
  AND erank = 1'', ''SELECT DISTINCT i.uuid              as uuid,
                i.gender            as gender_name,
                i.addresslevel_type as address_type,
                i.addresslevel_name as address_name
FROM non_exited_enrolment_completed_encounters_agg_view lpe
       JOIN individual_gender_address_view i ON i.id = lpe.individual_id
       JOIN non_exited_program_enrolment_view e ON e.individual_id = i.id
WHERE lpe.program_name = ''''Adolescent''''
  AND lpe.agg_obs @> ''''{"9cb4c266-0511-48f6-a058-d4f1fa3eb17c":"04bb1773-c353-44a1-a68c-9b448e07ff70"}''''
    [[ and e.enrolment_date_time >=(' || '''' || quote_literal({{ start_date }}) || '''' || '  ::DATE)]]
    [[and e.enrolment_date_time <=' || '''' || quote_literal({{end_date}}) || '''' || ' ::DATE]]
'')
UNION ALL
SELECT
''All menstruating girls''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''SELECT DISTINCT i.uuid              as uuid,
                i.gender            as gender_name,
                i.addresslevel_type as address_type,
                i.addresslevel_name as address_name
FROM non_exited_enrolment_completed_encounters_agg_view lpe
       JOIN individual_gender_address_view i ON i.id = lpe.individual_id
       JOIN non_exited_program_enrolment_view e ON e.individual_id = i.id
WHERE lpe.program_name = ''''Adolescent''''
  AND lpe.agg_obs @> ''''{"9cb4c266-0511-48f6-a058-d4f1fa3eb17c":"04bb1773-c353-44a1-a68c-9b448e07ff70"}''''
    [[ and e.enrolment_date_time >=(' || '''' || quote_literal({{ start_date }}) || '''' || '  ::DATE)]]
    [[and e.enrolment_date_time <=' || '''' || quote_literal({{end_date}}) || '''' || ' ::DATE]]
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
AND i.gender =''''Female''''
 [[ and enrolment.enrolment_date_time >=(' || '''' || quote_literal({{ start_date }}) || '''' || '  ::DATE)]]
    [[and enrolment.enrolment_date_time <=' || '''' || quote_literal({{end_date}}) || '''' || ' ::DATE]]
    [[and i.addresslevel_name = ' || '''' || quote_literal({{title}}) || '''' || ']]'')
UNION ALL
SELECT
''MHM Kit Provided?''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''WITH individual_program_partitions AS (
  SELECT i.uuid          AS                                                           iuuid,
         row_number() OVER (PARTITION BY i.uuid ORDER BY pe.encounter_date_time desc) erank,
         pe.uuid         AS                                                           euuid,
         pe.observations AS                                                           obs,
         pe.encounter_date_time
  FROM completed_program_encounter_view pe
         INNER JOIN non_exited_program_enrolment_view e ON pe.program_enrolment_id = e.id
         INNER JOIN individual_view i ON e.individual_id = i.id
  WHERE e.program_name = ''''Adolescent''''
    AND (pe.encounter_type_name = ''''Annual Visit'''' or pe.encounter_type_name = ''''Quarterly Visit'''')
    [[ and e.enrolment_date_time >=(' || '''' || quote_literal({{ start_date }}) || '''' || '  ::DATE)]]
    [[and e.enrolment_date_time <=' || '''' || quote_literal({{end_date}}) || '''' || ' ::DATE]]
)
SELECT i.uuid              as uuid,
       i.gender            as gender_name,
       i.addresslevel_type as address_type,
       i.addresslevel_name as address_name
FROM individual_program_partitions ip
       JOIN individual_gender_address_view i ON i.uuid = ip.iuuid
WHERE ip.obs -> ''''5b11c506-d17b-499c-902f-75405bfc1d67'''' IS NOT NULL
  AND ip.obs ->> ''''5b11c506-d17b-499c-902f-75405bfc1d67'''' = ''''04bb1773-c353-44a1-a68c-9b448e07ff70''''
  AND erank = 1
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
AND i.gender =''''Female''''
 [[ and enrolment.enrolment_date_time >=(' || '''' || quote_literal({{ start_date }}) || '''' || '  ::DATE)]]
    [[and enrolment.enrolment_date_time <=' || '''' || quote_literal({{end_date}}) || '''' || ' ::DATE]]
    [[and i.addresslevel_name = ' || '''' || quote_literal({{title}}) || '''' || ']]'')
UNION ALL
SELECT
''MHM Kit Used''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''WITH individual_program_partitions AS (
  SELECT i.uuid          AS                                                           iuuid,
         row_number() OVER (PARTITION BY i.uuid ORDER BY pe.encounter_date_time desc) erank,
         pe.uuid         AS                                                           euuid,
         pe.observations AS                                                           obs,
         pe.encounter_date_time
  FROM completed_program_encounter_view pe
         INNER JOIN non_exited_program_enrolment_view e ON pe.program_enrolment_id = e.id
         INNER JOIN individual_view i ON e.individual_id = i.id
  WHERE e.program_name = ''''Adolescent''''
    AND (pe.encounter_type_name = ''''Annual Visit'''' or pe.encounter_type_name = ''''Quarterly Visit'''')
    [[ and e.enrolment_date_time >=(' || '''' || quote_literal({{ start_date }}) || '''' || '  ::DATE)]]
    [[and e.enrolment_date_time <=' || '''' || quote_literal({{end_date}}) || '''' || ' ::DATE]]
)
SELECT i.uuid              as uuid,
       i.gender            as gender_name,
       i.addresslevel_type as address_type,
       i.addresslevel_name as address_name
FROM individual_program_partitions ip
       JOIN individual_gender_address_view i ON i.uuid = ip.iuuid
WHERE ip.obs -> ''''7503cf02-c2e6-440b-a768-8e4cb1df4c68'''' IS NOT NULL
  AND ip.obs ->> ''''7503cf02-c2e6-440b-a768-8e4cb1df4c68'''' = ''''04bb1773-c353-44a1-a68c-9b448e07ff70''''
  AND erank = 1'', ''SELECT DISTINCT i.uuid              as uuid,
                i.gender            as gender_name,
                i.addresslevel_type as address_type,
                i.addresslevel_name as address_name
FROM non_exited_enrolment_completed_encounters_agg_view lpe
       JOIN individual_gender_address_view i ON i.id = lpe.individual_id
       JOIN non_exited_program_enrolment_view e ON e.individual_id = i.id
WHERE lpe.program_name = ''''Adolescent''''
  AND lpe.agg_obs @> ''''{"9cb4c266-0511-48f6-a058-d4f1fa3eb17c":"04bb1773-c353-44a1-a68c-9b448e07ff70"}''''
    [[ and e.enrolment_date_time >=(' || '''' || quote_literal({{ start_date }}) || '''' || '  ::DATE)]]
    [[and e.enrolment_date_time <=' || '''' || quote_literal({{end_date}}) || '''' || ' ::DATE]]
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