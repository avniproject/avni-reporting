-- Generated Report
-- Name: IFADistribution&amp;ConsumptionForNormalAndMildAnemia

with filters as (
    select coalesce( [[ {{start_date}} , ]] '1900-01-01'::timestamptz) start_date,
           coalesce( [[ {{end_date}} , ]] current_timestamp) end_date
)

SELECT * FROM crosstab('SELECT
''Adolescents with Normal & Mild Anemia''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''WITH individual_program_partitions AS (
  SELECT i.uuid          AS                                                                                   iuuid,
         row_number() OVER (PARTITION BY i.uuid ORDER BY pe.encounter_date_time desc) erank,
         pe.uuid         AS                                                                                   euuid,
         pe.observations AS                                                                                   obs,
         pe.encounter_date_time
  FROM completed_program_encounter_view pe
         INNER JOIN non_exited_program_enrolment_view e ON pe.program_enrolment_id = e.id
         INNER JOIN individual_view i ON e.individual_id = i.id
  WHERE e.program_name = ''''Adolescent''''
--     AND (pe.encounter_type_name = ''''Annual Visit'''')
    AND pe.observations ->> ''''f9ecabbc-2df2-4bfc-a6fa-aa417c50e11b'''' notnull
    and (e.enrolment_date_time ISNULL OR e.enrolment_date_time between '''''|| (select start_date from filters) ||''''' and '''''|| (select end_date from filters) ||''''')
)
SELECT i.uuid              as uuid,
       i.gender            as gender_name,
       i.addresslevel_type as address_type,
       i.addresslevel_name as address_name
FROM individual_program_partitions ip
       JOIN individual_gender_address_view i ON i.uuid = ip.iuuid
WHERE cast(ip.obs ->> ''''f9ecabbc-2df2-4bfc-a6fa-aa417c50e11b'''' AS FLOAT) >= 10.1
  AND erank = 1;
'', ''WITH individual_program_partitions AS (
  SELECT i.uuid          AS                                                                                   iuuid,
         row_number() OVER (PARTITION BY i.uuid ORDER BY pe.encounter_date_time desc) erank,
         pe.uuid         AS                                                                                   euuid,
         pe.observations AS                                                                                   obs,
         pe.encounter_date_time
  FROM completed_program_encounter_view pe
         INNER JOIN non_exited_program_enrolment_view e ON pe.program_enrolment_id = e.id
         INNER JOIN individual_view i ON e.individual_id = i.id
  WHERE e.program_name = ''''Adolescent''''
--     AND pe.encounter_type_name = ''''Annual Visit''''
    AND pe.observations ->> ''''f9ecabbc-2df2-4bfc-a6fa-aa417c50e11b'''' notnull
)
SELECT i.uuid              as uuid,
       i.gender            as gender_name,
       i.addresslevel_type as address_type,
       i.addresslevel_name as address_name
FROM individual_program_partitions ip
       JOIN individual_gender_address_view i ON i.uuid = ip.iuuid
WHERE cast(ip.obs ->> ''''f9ecabbc-2df2-4bfc-a6fa-aa417c50e11b'''' AS FLOAT) >= 10.1
  AND erank = 1;
'')
UNION ALL
SELECT
''Adolescents received IFA''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''WITH individual_program_partitions AS (
  SELECT i.uuid          AS                                                                                   iuuid,
         row_number() OVER (PARTITION BY i.uuid ORDER BY pe.encounter_date_time desc) erank,
         pe.uuid         AS                                                                                   euuid,
         pe.observations AS                                                                                   obs,
         pe.encounter_date_time
  FROM completed_program_encounter_view pe
         INNER JOIN non_exited_program_enrolment_view e ON pe.program_enrolment_id = e.id
         INNER JOIN individual_view i ON e.individual_id = i.id
  WHERE e.program_name = ''''Adolescent''''
    AND (pe.encounter_type_name = ''''Quarterly Visit'''')
    AND pe.observations -> ''''2973890d-0142-41a6-a6f5-988e7eb36d79'''' NOTNULL
    AND pe.observations ->> ''''f9ecabbc-2df2-4bfc-a6fa-aa417c50e11b'''' NOTNULL
    and (e.enrolment_date_time ISNULL OR e.enrolment_date_time between '''''|| (select start_date from filters) ||''''' and '''''|| (select end_date from filters) ||''''')
)
SELECT i.uuid              as uuid,
       i.gender            as gender_name,
       i.addresslevel_type as address_type,
       i.addresslevel_name as address_name
FROM individual_program_partitions ip
       JOIN individual_gender_address_view i ON i.uuid = ip.iuuid
WHERE ip.obs ->> ''''2973890d-0142-41a6-a6f5-988e7eb36d79'''' = ''''04bb1773-c353-44a1-a68c-9b448e07ff70''''
  AND cast(ip.obs ->> ''''f9ecabbc-2df2-4bfc-a6fa-aa417c50e11b'''' AS FLOAT) >= 10.1
  AND erank = 1;
'', ''WITH individual_program_partitions AS (
  SELECT i.uuid          AS                                                                                   iuuid,
         row_number() OVER (PARTITION BY i.uuid ORDER BY pe.encounter_date_time desc) erank,
         pe.uuid         AS                                                                                   euuid,
         pe.observations AS                                                                                   obs,
         pe.encounter_date_time
  FROM completed_program_encounter_view pe
         INNER JOIN non_exited_program_enrolment_view e ON pe.program_enrolment_id = e.id
         INNER JOIN individual_view i ON e.individual_id = i.id
  WHERE e.program_name = ''''Adolescent''''
--     AND (pe.encounter_type_name = ''''Annual Visit'''')
    AND pe.observations ->> ''''f9ecabbc-2df2-4bfc-a6fa-aa417c50e11b'''' notnull
    and (e.enrolment_date_time ISNULL OR e.enrolment_date_time between '''''|| (select start_date from filters) ||''''' and '''''|| (select end_date from filters) ||''''')
)
SELECT i.uuid              as uuid,
       i.gender            as gender_name,
       i.addresslevel_type as address_type,
       i.addresslevel_name as address_name
FROM individual_program_partitions ip
       JOIN individual_gender_address_view i ON i.uuid = ip.iuuid
WHERE cast(ip.obs ->> ''''f9ecabbc-2df2-4bfc-a6fa-aa417c50e11b'''' AS FLOAT) >= 10.1
  AND erank = 1;
'')
UNION ALL
SELECT
''Adolescents received and consumed IFA''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''WITH individual_program_partitions AS (
  SELECT i.uuid          AS                                                                                   iuuid,
         row_number() OVER (PARTITION BY i.uuid ORDER BY pe.encounter_date_time desc) erank,
         pe.uuid         AS                                                                                   euuid,
         pe.observations AS                                                                                   obs,
         pe.encounter_date_time
  FROM completed_program_encounter_view pe
         INNER JOIN non_exited_program_enrolment_view e ON pe.program_enrolment_id = e.id
         INNER JOIN individual_view i ON e.individual_id = i.id
  WHERE e.program_name = ''''Adolescent''''
    AND (pe.encounter_type_name = ''''Quarterly Visit'''')
    and (e.enrolment_date_time ISNULL OR e.enrolment_date_time between '''''|| (select start_date from filters) ||''''' and '''''|| (select end_date from filters) ||''''')
)
SELECT i.uuid              as uuid,
       i.gender            as gender_name,
       i.addresslevel_type as address_type,
       i.addresslevel_name as address_name
FROM individual_program_partitions ip
       JOIN individual_gender_address_view i ON i.uuid = ip.iuuid
WHERE cast (ip.obs ->> ''''bba15025-334a-4c9c-959f-0d186b451197'''' AS FLOAT)  is not null
  AND cast(ip.obs ->> ''''c238b921-749b-45f9-8fd5-6ffc3c14d96d'''' AS FLOAT) > 0
  AND cast(ip.obs ->> ''''f9ecabbc-2df2-4bfc-a6fa-aa417c50e11b'''' AS FLOAT) >= 10.1
  AND erank = 1;
'', ''WITH individual_program_partitions AS (
  SELECT i.uuid          AS                                                                                   iuuid,
         row_number() OVER (PARTITION BY i.uuid ORDER BY pe.encounter_date_time desc) erank,
         pe.uuid         AS                                                                                   euuid,
         pe.observations AS                                                                                   obs,
         pe.encounter_date_time
  FROM completed_program_encounter_view pe
         INNER JOIN non_exited_program_enrolment_view e ON pe.program_enrolment_id = e.id
         INNER JOIN individual_view i ON e.individual_id = i.id
  WHERE e.program_name = ''''Adolescent''''
--     AND (pe.encounter_type_name = ''''Annual Visit'''')
    AND pe.observations ->> ''''f9ecabbc-2df2-4bfc-a6fa-aa417c50e11b'''' notnull
    and (e.enrolment_date_time ISNULL OR e.enrolment_date_time between '''''|| (select start_date from filters) ||''''' and '''''|| (select end_date from filters) ||''''')
)
SELECT i.uuid              as uuid,
       i.gender            as gender_name,
       i.addresslevel_type as address_type,
       i.addresslevel_name as address_name
FROM individual_program_partitions ip
       JOIN individual_gender_address_view i ON i.uuid = ip.iuuid
WHERE cast(ip.obs ->> ''''f9ecabbc-2df2-4bfc-a6fa-aa417c50e11b'''' AS FLOAT) >= 10.1
  AND erank = 1;
'')
UNION ALL
SELECT
''Adolescents consumed 1 to 6 tablet''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''WITH individual_program_partitions AS (
  SELECT i.uuid          AS                                                                                   iuuid,
         row_number() OVER (PARTITION BY i.uuid ORDER BY pe.encounter_date_time desc) erank,
         pe.uuid         AS                                                                                   euuid,
         pe.observations AS                                                                                   obs,
         pe.encounter_date_time
  FROM completed_program_encounter_view pe
         INNER JOIN non_exited_program_enrolment_view e ON pe.program_enrolment_id = e.id
         INNER JOIN individual_view i ON e.individual_id = i.id
  WHERE e.program_name = ''''Adolescent''''
    AND (pe.encounter_type_name = ''''Quarterly Visit'''')
    AND (e.enrolment_date_time ISNULL OR e.enrolment_date_time between '''''|| (select start_date from filters) ||''''' and '''''|| (select end_date from filters) ||''''')
)
SELECT i.uuid              as uuid,
       i.gender            as gender_name,
       i.addresslevel_type as address_type,
       i.addresslevel_name as address_name
FROM individual_program_partitions ip
       JOIN individual_gender_address_view i ON i.uuid = ip.iuuid
WHERE cast (ip.obs ->> ''''bba15025-334a-4c9c-959f-0d186b451197'''' AS FLOAT) > 0
  AND cast(ip.obs ->> ''''c238b921-749b-45f9-8fd5-6ffc3c14d96d'''' AS FLOAT) between 1 and 6.9
  AND cast(ip.obs ->> ''''f9ecabbc-2df2-4bfc-a6fa-aa417c50e11b'''' AS FLOAT) >= 10.1
  AND erank = 1;
'', ''WITH individual_program_partitions AS (
  SELECT i.uuid          AS                                                                                   iuuid,
         row_number() OVER (PARTITION BY i.uuid ORDER BY pe.encounter_date_time desc) erank,
         pe.uuid         AS                                                                                   euuid,
         pe.observations AS                                                                                   obs,
         pe.encounter_date_time
  FROM completed_program_encounter_view pe
         INNER JOIN non_exited_program_enrolment_view e ON pe.program_enrolment_id = e.id
         INNER JOIN individual_view i ON e.individual_id = i.id
  WHERE e.program_name = ''''Adolescent''''
    AND (pe.encounter_type_name = ''''Quarterly Visit'''')
    AND pe.observations -> ''''2973890d-0142-41a6-a6f5-988e7eb36d79'''' NOTNULL
    AND pe.observations ->> ''''f9ecabbc-2df2-4bfc-a6fa-aa417c50e11b'''' NOTNULL
    and (e.enrolment_date_time ISNULL OR e.enrolment_date_time between '''''|| (select start_date from filters) ||''''' and '''''|| (select end_date from filters) ||''''')
)
SELECT i.uuid              as uuid,
       i.gender            as gender_name,
       i.addresslevel_type as address_type,
       i.addresslevel_name as address_name
FROM individual_program_partitions ip
       JOIN individual_gender_address_view i ON i.uuid = ip.iuuid
WHERE ip.obs ->> ''''2973890d-0142-41a6-a6f5-988e7eb36d79'''' = ''''04bb1773-c353-44a1-a68c-9b448e07ff70''''
  AND cast(ip.obs ->> ''''f9ecabbc-2df2-4bfc-a6fa-aa417c50e11b'''' AS FLOAT) >= 10.1
  AND erank = 1;
'')
UNION ALL
SELECT
''Adolescents consumed 7 to 11 tablets''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''WITH individual_program_partitions AS (
  SELECT i.uuid          AS                                                                                   iuuid,
         row_number() OVER (PARTITION BY i.uuid ORDER BY pe.encounter_date_time desc) erank,
         pe.uuid         AS                                                                                   euuid,
         pe.observations AS                                                                                   obs,
         pe.encounter_date_time
  FROM completed_program_encounter_view pe
         INNER JOIN non_exited_program_enrolment_view e ON pe.program_enrolment_id = e.id
         INNER JOIN individual_view i ON e.individual_id = i.id
  WHERE e.program_name = ''''Adolescent''''
    AND (pe.encounter_type_name = ''''Quarterly Visit'''')
    AND (e.enrolment_date_time ISNULL OR e.enrolment_date_time between '''''|| (select start_date from filters) ||''''' and '''''|| (select end_date from filters) ||''''')
)
SELECT i.uuid              as uuid,
       i.gender            as gender_name,
       i.addresslevel_type as address_type,
       i.addresslevel_name as address_name
FROM individual_program_partitions ip
       JOIN individual_gender_address_view i ON i.uuid = ip.iuuid
WHERE cast (ip.obs ->> ''''bba15025-334a-4c9c-959f-0d186b451197'''' AS FLOAT) > 0
  AND cast(ip.obs ->> ''''c238b921-749b-45f9-8fd5-6ffc3c14d96d'''' AS FLOAT) between 7 and 11.9
  AND cast(ip.obs ->> ''''f9ecabbc-2df2-4bfc-a6fa-aa417c50e11b'''' AS FLOAT) >= 10.1
  AND erank = 1;
'', ''WITH individual_program_partitions AS (
  SELECT i.uuid          AS                                                                                   iuuid,
         row_number() OVER (PARTITION BY i.uuid ORDER BY pe.encounter_date_time desc) erank,
         pe.uuid         AS                                                                                   euuid,
         pe.observations AS                                                                                   obs,
         pe.encounter_date_time
  FROM completed_program_encounter_view pe
         INNER JOIN non_exited_program_enrolment_view e ON pe.program_enrolment_id = e.id
         INNER JOIN individual_view i ON e.individual_id = i.id
  WHERE e.program_name = ''''Adolescent''''
    AND (pe.encounter_type_name = ''''Quarterly Visit'''')
    AND pe.observations -> ''''2973890d-0142-41a6-a6f5-988e7eb36d79'''' NOTNULL
    AND pe.observations ->> ''''f9ecabbc-2df2-4bfc-a6fa-aa417c50e11b'''' NOTNULL
    and (e.enrolment_date_time ISNULL OR e.enrolment_date_time between '''''|| (select start_date from filters) ||''''' and '''''|| (select end_date from filters) ||''''')
)
SELECT i.uuid              as uuid,
       i.gender            as gender_name,
       i.addresslevel_type as address_type,
       i.addresslevel_name as address_name
FROM individual_program_partitions ip
       JOIN individual_gender_address_view i ON i.uuid = ip.iuuid
WHERE ip.obs ->> ''''2973890d-0142-41a6-a6f5-988e7eb36d79'''' = ''''04bb1773-c353-44a1-a68c-9b448e07ff70''''
  AND cast(ip.obs ->> ''''f9ecabbc-2df2-4bfc-a6fa-aa417c50e11b'''' AS FLOAT) >= 10.1
  AND erank = 1;
'')
UNION ALL
SELECT
''Adolescents consumed >= 12 (All) tablets''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''WITH individual_program_partitions AS (
  SELECT i.uuid          AS                                                                                   iuuid,
         row_number() OVER (PARTITION BY i.uuid ORDER BY pe.encounter_date_time desc) erank,
         pe.uuid         AS                                                                                   euuid,
         pe.observations AS                                                                                   obs,
         pe.encounter_date_time
  FROM completed_program_encounter_view pe
         INNER JOIN non_exited_program_enrolment_view e ON pe.program_enrolment_id = e.id
         INNER JOIN individual_view i ON e.individual_id = i.id
  WHERE e.program_name = ''''Adolescent''''
    AND (pe.encounter_type_name = ''''Quarterly Visit'''')
    AND pe.observations ->> ''''f9ecabbc-2df2-4bfc-a6fa-aa417c50e11b'''' NOTNULL
    and (e.enrolment_date_time ISNULL OR e.enrolment_date_time between '''''|| (select start_date from filters) ||''''' and '''''|| (select end_date from filters) ||''''')
)
SELECT i.uuid              as uuid,
       i.gender            as gender_name,
       i.addresslevel_type as address_type,
       i.addresslevel_name as address_name
FROM individual_program_partitions ip
       JOIN individual_gender_address_view i ON i.uuid = ip.iuuid
WHERE cast (ip.obs ->> ''''bba15025-334a-4c9c-959f-0d186b451197'''' AS FLOAT) > 0
  AND cast(ip.obs ->> ''''c238b921-749b-45f9-8fd5-6ffc3c14d96d'''' AS FLOAT) >= 12
  AND cast(ip.obs ->> ''''f9ecabbc-2df2-4bfc-a6fa-aa417c50e11b'''' AS FLOAT) >= 10.1
  AND erank = 1;
'', ''WITH individual_program_partitions AS (
  SELECT i.uuid          AS                                                                                   iuuid,
         row_number() OVER (PARTITION BY i.uuid ORDER BY pe.encounter_date_time desc) erank,
         pe.uuid         AS                                                                                   euuid,
         pe.observations AS                                                                                   obs,
         pe.encounter_date_time
  FROM completed_program_encounter_view pe
         INNER JOIN non_exited_program_enrolment_view e ON pe.program_enrolment_id = e.id
         INNER JOIN individual_view i ON e.individual_id = i.id
  WHERE e.program_name = ''''Adolescent''''
    AND (pe.encounter_type_name = ''''Quarterly Visit'''')
    AND pe.observations -> ''''2973890d-0142-41a6-a6f5-988e7eb36d79'''' NOTNULL
    AND pe.observations ->> ''''f9ecabbc-2df2-4bfc-a6fa-aa417c50e11b'''' NOTNULL
    and (e.enrolment_date_time ISNULL OR e.enrolment_date_time between '''''|| (select start_date from filters) ||''''' and '''''|| (select end_date from filters) ||''''')
)
SELECT i.uuid              as uuid,
       i.gender            as gender_name,
       i.addresslevel_type as address_type,
       i.addresslevel_name as address_name
FROM individual_program_partitions ip
       JOIN individual_gender_address_view i ON i.uuid = ip.iuuid
WHERE ip.obs ->> ''''2973890d-0142-41a6-a6f5-988e7eb36d79'''' = ''''04bb1773-c353-44a1-a68c-9b448e07ff70''''
  AND cast(ip.obs ->> ''''f9ecabbc-2df2-4bfc-a6fa-aa417c50e11b'''' AS FLOAT) >= 10.1
  AND erank = 1;
'')
UNION ALL
SELECT
''Adolescents received Albendazol''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''WITH individual_program_partitions AS (
  SELECT i.uuid          AS                                                                                   iuuid,
         row_number() OVER (PARTITION BY i.uuid ORDER BY pe.encounter_date_time desc) erank,
         pe.uuid         AS                                                                                   euuid,
         pe.observations AS                                                                                   obs,
         pe.encounter_date_time
  FROM completed_program_encounter_view pe
         INNER JOIN non_exited_program_enrolment_view e ON pe.program_enrolment_id = e.id
         INNER JOIN individual_view i ON e.individual_id = i.id
  WHERE e.program_name = ''''Adolescent''''
    AND (pe.encounter_type_name = ''''Quarterly Visit'''')
    AND pe.observations -> ''''a2e181c3-0827-4da2-9121-a59386449823'''' NOTNULL
    AND pe.observations ->> ''''f9ecabbc-2df2-4bfc-a6fa-aa417c50e11b'''' notnull
    and (e.enrolment_date_time ISNULL OR e.enrolment_date_time between '''''|| (select start_date from filters) ||''''' and '''''|| (select end_date from filters) ||''''')
)
SELECT i.uuid as uuid,
       i.gender as gender_name,
       i.addresslevel_type as address_type,
       i.addresslevel_name as address_name
FROM individual_program_partitions ip
      JOIN individual_gender_address_view i ON i.uuid = ip.iuuid
WHERE ip.obs ->> ''''a2e181c3-0827-4da2-9121-a59386449823'''' = ''''04bb1773-c353-44a1-a68c-9b448e07ff70''''
  AND cast(ip.obs ->> ''''f9ecabbc-2df2-4bfc-a6fa-aa417c50e11b'''' AS FLOAT) >= 10.1
  AND erank = 1;
'', ''WITH individual_program_partitions AS (
  SELECT i.uuid          AS                                                                                   iuuid,
         row_number() OVER (PARTITION BY i.uuid ORDER BY pe.encounter_date_time desc) erank,
         pe.uuid         AS                                                                                   euuid,
         pe.observations AS                                                                                   obs,
         pe.encounter_date_time
  FROM completed_program_encounter_view pe
         INNER JOIN non_exited_program_enrolment_view e ON pe.program_enrolment_id = e.id
         INNER JOIN individual_view i ON e.individual_id = i.id
  WHERE e.program_name = ''''Adolescent''''
--     AND (pe.encounter_type_name = ''''Annual Visit'''')
    AND pe.observations ->> ''''f9ecabbc-2df2-4bfc-a6fa-aa417c50e11b'''' notnull
    and (e.enrolment_date_time ISNULL OR e.enrolment_date_time between '''''|| (select start_date from filters) ||''''' and '''''|| (select end_date from filters) ||''''')
)
SELECT i.uuid              as uuid,
       i.gender            as gender_name,
       i.addresslevel_type as address_type,
       i.addresslevel_name as address_name
FROM individual_program_partitions ip
       JOIN individual_gender_address_view i ON i.uuid = ip.iuuid
WHERE cast(ip.obs ->> ''''f9ecabbc-2df2-4bfc-a6fa-aa417c50e11b'''' AS FLOAT) >= 10.1
  AND erank = 1;
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