-- Generated Report
-- Name: IFADistribution&amp;ConsumptionForSevereAndModerateAnemia

with filters as (
    select coalesce( [[ {{start_date}} , ]] '1900-01-01'::timestamptz) start_date,
           coalesce( [[ {{end_date}} , ]] current_timestamp) end_date
)

SELECT * FROM crosstab('SELECT
''Adolescents with Severe & Moderate Anemia''                                          rowid,
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
    AND (pe.encounter_type_name = ''''Annual Visit'''' or pe.encounter_type_name = ''''Quarterly Visit'''')
    AND pe.observations ->> ''''f9ecabbc-2df2-4bfc-a6fa-aa417c50e11b'''' notnull
   and (e.enrolment_date_time ISNULL OR e.enrolment_date_time between '''''|| (select start_date from filters) ||''''' and '''''|| (select end_date from filters) ||''''')
)
SELECT i.uuid              as uuid,
       i.gender            as gender_name,
       i.addresslevel_type as address_type,
       i.addresslevel_name as address_name
FROM individual_program_partitions ip
       JOIN individual_gender_address_view i ON i.uuid = ip.iuuid
WHERE cast(ip.obs ->> ''''f9ecabbc-2df2-4bfc-a6fa-aa417c50e11b'''' AS FLOAT) <= 10
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
    AND pe.encounter_type_name = ''''Annual Visit''''
    AND pe.observations ->> ''''f9ecabbc-2df2-4bfc-a6fa-aa417c50e11b'''' notnull
)
SELECT i.uuid              as uuid,
       i.gender            as gender_name,
       i.addresslevel_type as address_type,
       i.addresslevel_name as address_name
FROM individual_program_partitions ip
       JOIN individual_gender_address_view i ON i.uuid = ip.iuuid
WHERE cast(ip.obs ->> ''''f9ecabbc-2df2-4bfc-a6fa-aa417c50e11b'''' AS FLOAT) <= 10
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
    AND (pe.encounter_type_name = ''''Annual Visit'''' or pe.encounter_type_name = ''''Quarterly Visit'''')
    AND pe.observations ->> ''''f9ecabbc-2df2-4bfc-a6fa-aa417c50e11b'''' notnull
    AND (e.enrolment_date_time ISNULL OR e.enrolment_date_time between '''''|| (select start_date from filters) ||''''' and '''''|| (select end_date from filters) ||''''')

),
individual_program_partitions_recieved AS (
  SELECT i.uuid          AS                                                                                   iuuid,
         row_number() OVER (PARTITION BY i.uuid ORDER BY pe.encounter_date_time desc) erank,
         pe.uuid         AS                                                                                   euuid,
         pe.observations AS                                                                                   obs,
         pe.encounter_date_time
  FROM completed_program_encounter_view pe
         INNER JOIN non_exited_program_enrolment_view e ON pe.program_enrolment_id = e.id
         INNER JOIN individual_view i ON e.individual_id = i.id
  WHERE e.program_name = ''''Adolescent''''
    AND (pe.encounter_type_name = ''''Severe Anemia Followup'''' or pe.encounter_type_name = ''''Moderate Anemia Followup'''')
    AND cast(pe.observations -> ''''1a750ccd-8330-42b6-b8e1-c383030ca87d'''' as FLOAT) > 0
    AND (e.enrolment_date_time ISNULL OR e.enrolment_date_time between '''''|| (select start_date from filters) ||''''' and '''''|| (select end_date from filters) ||''''')
)
SELECT distinct i.uuid              as uuid,
       i.gender            as gender_name,
       i.addresslevel_type as address_type,
       i.addresslevel_name as address_name
FROM individual_program_partitions ip
       JOIN individual_gender_address_view i ON i.uuid = ip.iuuid
       JOIN individual_program_partitions_recieved r on r.iuuid = ip.iuuid
WHERE cast(ip.obs ->> ''''f9ecabbc-2df2-4bfc-a6fa-aa417c50e11b'''' AS FLOAT) <= 10
  AND ip.erank = 1 and r.erank = 1;
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
    AND (pe.encounter_type_name = ''''Annual Visit'''' or pe.encounter_type_name = ''''Quarterly Visit'''')
    AND pe.observations ->> ''''f9ecabbc-2df2-4bfc-a6fa-aa417c50e11b'''' notnull
   and (e.enrolment_date_time ISNULL OR e.enrolment_date_time between '''''|| (select start_date from filters) ||''''' and '''''|| (select end_date from filters) ||''''')
)
SELECT i.uuid              as uuid,
       i.gender            as gender_name,
       i.addresslevel_type as address_type,
       i.addresslevel_name as address_name
FROM individual_program_partitions ip
       JOIN individual_gender_address_view i ON i.uuid = ip.iuuid
WHERE cast(ip.obs ->> ''''f9ecabbc-2df2-4bfc-a6fa-aa417c50e11b'''' AS FLOAT) <= 10
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
    AND (pe.encounter_type_name = ''''Annual Visit'''' or pe.encounter_type_name = ''''Quarterly Visit'''')
    AND pe.observations ->> ''''f9ecabbc-2df2-4bfc-a6fa-aa417c50e11b'''' notnull
    and (e.enrolment_date_time ISNULL OR e.enrolment_date_time between '''''|| (select start_date from filters) ||''''' and '''''|| (select end_date from filters) ||''''')

),
individual_program_partitions_recieved AS (
  SELECT i.uuid          AS                                                                                   iuuid,
         row_number() OVER (PARTITION BY i.uuid ORDER BY pe.encounter_date_time desc) erank,
         pe.uuid         AS                                                                                   euuid,
         pe.observations AS                                                                                   obs,
         pe.encounter_date_time
  FROM completed_program_encounter_view pe
         INNER JOIN non_exited_program_enrolment_view e ON pe.program_enrolment_id = e.id
         INNER JOIN individual_view i ON e.individual_id = i.id
  WHERE e.program_name = ''''Adolescent''''
    AND (pe.encounter_type_name = ''''Severe Anemia Followup'''' or pe.encounter_type_name = ''''Moderate Anemia Followup'''')
    AND cast(pe.observations -> ''''1a750ccd-8330-42b6-b8e1-c383030ca87d'''' as FLOAT) > 0
    AND cast(pe.observations ->> ''''a0fa3ce5-adc6-4c6e-9715-2f8d53b986ca'''' AS FLOAT)  > 0
    and (e.enrolment_date_time ISNULL OR e.enrolment_date_time between '''''|| (select start_date from filters) ||''''' and '''''|| (select end_date from filters) ||''''')

)
SELECT distinct i.uuid              as uuid,
       i.gender            as gender_name,
       i.addresslevel_type as address_type,
       i.addresslevel_name as address_name
FROM individual_program_partitions ip
       JOIN individual_gender_address_view i ON i.uuid = ip.iuuid
       JOIN individual_program_partitions_recieved r on r.iuuid = ip.iuuid
WHERE cast(ip.obs ->> ''''f9ecabbc-2df2-4bfc-a6fa-aa417c50e11b'''' AS FLOAT) <= 10
  AND ip.erank = 1 and r.erank = 1;
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
    AND (pe.encounter_type_name = ''''Annual Visit'''' or pe.encounter_type_name = ''''Quarterly Visit'''')
    AND pe.observations ->> ''''f9ecabbc-2df2-4bfc-a6fa-aa417c50e11b'''' notnull
    AND (e.enrolment_date_time ISNULL OR e.enrolment_date_time between '''''|| (select start_date from filters) ||''''' and '''''|| (select end_date from filters) ||''''')

),
individual_program_partitions_recieved AS (
  SELECT i.uuid          AS                                                                                   iuuid,
         row_number() OVER (PARTITION BY i.uuid ORDER BY pe.encounter_date_time desc) erank,
         pe.uuid         AS                                                                                   euuid,
         pe.observations AS                                                                                   obs,
         pe.encounter_date_time
  FROM completed_program_encounter_view pe
         INNER JOIN non_exited_program_enrolment_view e ON pe.program_enrolment_id = e.id
         INNER JOIN individual_view i ON e.individual_id = i.id
  WHERE e.program_name = ''''Adolescent''''
    AND (pe.encounter_type_name = ''''Severe Anemia Followup'''' or pe.encounter_type_name = ''''Moderate Anemia Followup'''')
    AND cast(pe.observations -> ''''1a750ccd-8330-42b6-b8e1-c383030ca87d'''' as FLOAT) > 0
    AND (e.enrolment_date_time ISNULL OR e.enrolment_date_time between '''''|| (select start_date from filters) ||''''' and '''''|| (select end_date from filters) ||''''')
)
SELECT distinct i.uuid              as uuid,
       i.gender            as gender_name,
       i.addresslevel_type as address_type,
       i.addresslevel_name as address_name
FROM individual_program_partitions ip
       JOIN individual_gender_address_view i ON i.uuid = ip.iuuid
       JOIN individual_program_partitions_recieved r on r.iuuid = ip.iuuid
WHERE cast(ip.obs ->> ''''f9ecabbc-2df2-4bfc-a6fa-aa417c50e11b'''' AS FLOAT) <= 10
  AND ip.erank = 1 and r.erank = 1;
'')
UNION ALL
SELECT
''Adolescents consumed 1 to 10 tablet''                                          rowid,
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
    AND (pe.encounter_type_name = ''''Annual Visit'''' or pe.encounter_type_name = ''''Quarterly Visit'''')
    AND pe.observations ->> ''''f9ecabbc-2df2-4bfc-a6fa-aa417c50e11b'''' notnull
    and (e.enrolment_date_time ISNULL OR e.enrolment_date_time between '''''|| (select start_date from filters) ||''''' and '''''|| (select end_date from filters) ||''''')

),
individual_program_partitions_recieved AS (
  SELECT i.uuid          AS                                                                                   iuuid,
         row_number() OVER (PARTITION BY i.uuid ORDER BY pe.encounter_date_time desc) erank,
         pe.uuid         AS                                                                                   euuid,
         pe.observations AS                                                                                   obs,
         pe.encounter_date_time
  FROM completed_program_encounter_view pe
         INNER JOIN non_exited_program_enrolment_view e ON pe.program_enrolment_id = e.id
         INNER JOIN individual_view i ON e.individual_id = i.id
  WHERE e.program_name = ''''Adolescent''''
    AND (pe.encounter_type_name = ''''Severe Anemia Followup'''' or pe.encounter_type_name = ''''Moderate Anemia Followup'''')
    AND cast(pe.observations -> ''''1a750ccd-8330-42b6-b8e1-c383030ca87d'''' as FLOAT) > 0
    AND cast(pe.observations ->> ''''a0fa3ce5-adc6-4c6e-9715-2f8d53b986ca'''' AS FLOAT) > 0
    and (e.enrolment_date_time ISNULL OR e.enrolment_date_time between '''''|| (select start_date from filters) ||''''' and '''''|| (select end_date from filters) ||''''')

)
SELECT distinct i.uuid              as uuid,
       i.gender            as gender_name,
       i.addresslevel_type as address_type,
       i.addresslevel_name as address_name
FROM individual_program_partitions ip
       JOIN individual_gender_address_view i ON i.uuid = ip.iuuid
       JOIN individual_program_partitions_recieved r on r.iuuid = ip.iuuid
WHERE cast(ip.obs ->> ''''f9ecabbc-2df2-4bfc-a6fa-aa417c50e11b'''' AS FLOAT) <= 10
  AND cast(r.obs ->> ''''a0fa3ce5-adc6-4c6e-9715-2f8d53b986ca'''' AS FLOAT) between  1 and 10
  AND ip.erank = 1 and r.erank = 1;
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
    AND (pe.encounter_type_name = ''''Annual Visit'''' or pe.encounter_type_name = ''''Quarterly Visit'''')
    AND pe.observations ->> ''''f9ecabbc-2df2-4bfc-a6fa-aa417c50e11b'''' notnull
    AND (e.enrolment_date_time ISNULL OR e.enrolment_date_time between '''''|| (select start_date from filters) ||''''' and '''''|| (select end_date from filters) ||''''')

),
individual_program_partitions_recieved AS (
  SELECT i.uuid          AS                                                                                   iuuid,
         row_number() OVER (PARTITION BY i.uuid ORDER BY pe.encounter_date_time desc) erank,
         pe.uuid         AS                                                                                   euuid,
         pe.observations AS                                                                                   obs,
         pe.encounter_date_time
  FROM completed_program_encounter_view pe
         INNER JOIN non_exited_program_enrolment_view e ON pe.program_enrolment_id = e.id
         INNER JOIN individual_view i ON e.individual_id = i.id
  WHERE e.program_name = ''''Adolescent''''
    AND (pe.encounter_type_name = ''''Severe Anemia Followup'''' or pe.encounter_type_name = ''''Moderate Anemia Followup'''')
    AND cast(pe.observations -> ''''1a750ccd-8330-42b6-b8e1-c383030ca87d'''' as FLOAT) > 0
    AND (e.enrolment_date_time ISNULL OR e.enrolment_date_time between '''''|| (select start_date from filters) ||''''' and '''''|| (select end_date from filters) ||''''')
)
SELECT distinct i.uuid              as uuid,
       i.gender            as gender_name,
       i.addresslevel_type as address_type,
       i.addresslevel_name as address_name
FROM individual_program_partitions ip
       JOIN individual_gender_address_view i ON i.uuid = ip.iuuid
       JOIN individual_program_partitions_recieved r on r.iuuid = ip.iuuid
WHERE cast(ip.obs ->> ''''f9ecabbc-2df2-4bfc-a6fa-aa417c50e11b'''' AS FLOAT) <= 10
  AND ip.erank = 1 and r.erank = 1;
'')
UNION ALL
SELECT
''Adolescents consumed 11 to 20 tablets''                                          rowid,
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
    AND (pe.encounter_type_name = ''''Annual Visit'''' or pe.encounter_type_name = ''''Quarterly Visit'''')
    AND pe.observations ->> ''''f9ecabbc-2df2-4bfc-a6fa-aa417c50e11b'''' notnull
    and (e.enrolment_date_time ISNULL OR e.enrolment_date_time between '''''|| (select start_date from filters) ||''''' and '''''|| (select end_date from filters) ||''''')

),
individual_program_partitions_recieved AS (
  SELECT i.uuid          AS                                                                                   iuuid,
         row_number() OVER (PARTITION BY i.uuid ORDER BY pe.encounter_date_time desc) erank,
         pe.uuid         AS                                                                                   euuid,
         pe.observations AS                                                                                   obs,
         pe.encounter_date_time
  FROM completed_program_encounter_view pe
         INNER JOIN non_exited_program_enrolment_view e ON pe.program_enrolment_id = e.id
         INNER JOIN individual_view i ON e.individual_id = i.id
  WHERE e.program_name = ''''Adolescent''''
    AND (pe.encounter_type_name = ''''Severe Anemia Followup'''' or pe.encounter_type_name = ''''Moderate Anemia Followup'''')
    AND cast(pe.observations -> ''''1a750ccd-8330-42b6-b8e1-c383030ca87d'''' as FLOAT) > 0
    AND cast(pe.observations ->> ''''a0fa3ce5-adc6-4c6e-9715-2f8d53b986ca'''' AS FLOAT) > 0
    and (e.enrolment_date_time ISNULL OR e.enrolment_date_time between '''''|| (select start_date from filters) ||''''' and '''''|| (select end_date from filters) ||''''')

)
SELECT distinct i.uuid              as uuid,
       i.gender            as gender_name,
       i.addresslevel_type as address_type,
       i.addresslevel_name as address_name
FROM individual_program_partitions ip
       JOIN individual_gender_address_view i ON i.uuid = ip.iuuid
       JOIN individual_program_partitions_recieved r on r.iuuid = ip.iuuid
WHERE cast(ip.obs ->> ''''f9ecabbc-2df2-4bfc-a6fa-aa417c50e11b'''' AS FLOAT) <= 10
  AND cast(r.obs ->> ''''a0fa3ce5-adc6-4c6e-9715-2f8d53b986ca'''' AS FLOAT)  between 11 and 20
  AND ip.erank = 1 and r.erank = 1;
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
    AND (pe.encounter_type_name = ''''Annual Visit'''' or pe.encounter_type_name = ''''Quarterly Visit'''')
    AND pe.observations ->> ''''f9ecabbc-2df2-4bfc-a6fa-aa417c50e11b'''' notnull
    AND (e.enrolment_date_time ISNULL OR e.enrolment_date_time between '''''|| (select start_date from filters) ||''''' and '''''|| (select end_date from filters) ||''''')

),
individual_program_partitions_recieved AS (
  SELECT i.uuid          AS                                                                                   iuuid,
         row_number() OVER (PARTITION BY i.uuid ORDER BY pe.encounter_date_time desc) erank,
         pe.uuid         AS                                                                                   euuid,
         pe.observations AS                                                                                   obs,
         pe.encounter_date_time
  FROM completed_program_encounter_view pe
         INNER JOIN non_exited_program_enrolment_view e ON pe.program_enrolment_id = e.id
         INNER JOIN individual_view i ON e.individual_id = i.id
  WHERE e.program_name = ''''Adolescent''''
    AND (pe.encounter_type_name = ''''Severe Anemia Followup'''' or pe.encounter_type_name = ''''Moderate Anemia Followup'''')
    AND cast(pe.observations -> ''''1a750ccd-8330-42b6-b8e1-c383030ca87d'''' as FLOAT) > 0
    AND (e.enrolment_date_time ISNULL OR e.enrolment_date_time between '''''|| (select start_date from filters) ||''''' and '''''|| (select end_date from filters) ||''''')
)
SELECT distinct i.uuid              as uuid,
       i.gender            as gender_name,
       i.addresslevel_type as address_type,
       i.addresslevel_name as address_name
FROM individual_program_partitions ip
       JOIN individual_gender_address_view i ON i.uuid = ip.iuuid
       JOIN individual_program_partitions_recieved r on r.iuuid = ip.iuuid
WHERE cast(ip.obs ->> ''''f9ecabbc-2df2-4bfc-a6fa-aa417c50e11b'''' AS FLOAT) <= 10
  AND ip.erank = 1 and r.erank = 1;
'')
UNION ALL
SELECT
''Adolescents consumed 21 to 30 tablets''                                          rowid,
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
    AND (pe.encounter_type_name = ''''Annual Visit'''' or pe.encounter_type_name = ''''Quarterly Visit'''')
    AND pe.observations ->> ''''f9ecabbc-2df2-4bfc-a6fa-aa417c50e11b'''' notnull
    and (e.enrolment_date_time ISNULL OR e.enrolment_date_time between '''''|| (select start_date from filters) ||''''' and '''''|| (select end_date from filters) ||''''')

),
individual_program_partitions_recieved AS (
  SELECT i.uuid          AS                                                                                   iuuid,
         row_number() OVER (PARTITION BY i.uuid ORDER BY pe.encounter_date_time desc) erank,
         pe.uuid         AS                                                                                   euuid,
         pe.observations AS                                                                                   obs,
         pe.encounter_date_time
  FROM completed_program_encounter_view pe
         INNER JOIN non_exited_program_enrolment_view e ON pe.program_enrolment_id = e.id
         INNER JOIN individual_view i ON e.individual_id = i.id
  WHERE e.program_name = ''''Adolescent''''
    AND (pe.encounter_type_name = ''''Severe Anemia Followup'''' or pe.encounter_type_name = ''''Moderate Anemia Followup'''')
    AND cast(pe.observations -> ''''1a750ccd-8330-42b6-b8e1-c383030ca87d'''' as FLOAT) > 0
    AND cast(pe.observations ->> ''''a0fa3ce5-adc6-4c6e-9715-2f8d53b986ca'''' AS FLOAT) > 0
    and (e.enrolment_date_time ISNULL OR e.enrolment_date_time between '''''|| (select start_date from filters) ||''''' and '''''|| (select end_date from filters) ||''''')

)
SELECT distinct i.uuid              as uuid,
       i.gender            as gender_name,
       i.addresslevel_type as address_type,
       i.addresslevel_name as address_name
FROM individual_program_partitions ip
       JOIN individual_gender_address_view i ON i.uuid = ip.iuuid
       JOIN individual_program_partitions_recieved r on r.iuuid = ip.iuuid
WHERE cast(ip.obs ->> ''''f9ecabbc-2df2-4bfc-a6fa-aa417c50e11b'''' AS FLOAT) <= 10
  AND cast(r.obs ->> ''''a0fa3ce5-adc6-4c6e-9715-2f8d53b986ca'''' AS FLOAT) between 21 and 30
  AND ip.erank = 1 and r.erank = 1;
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
    AND (pe.encounter_type_name = ''''Annual Visit'''' or pe.encounter_type_name = ''''Quarterly Visit'''')
    AND pe.observations ->> ''''f9ecabbc-2df2-4bfc-a6fa-aa417c50e11b'''' notnull
    AND (e.enrolment_date_time ISNULL OR e.enrolment_date_time between '''''|| (select start_date from filters) ||''''' and '''''|| (select end_date from filters) ||''''')

),
individual_program_partitions_recieved AS (
  SELECT i.uuid          AS                                                                                   iuuid,
         row_number() OVER (PARTITION BY i.uuid ORDER BY pe.encounter_date_time desc) erank,
         pe.uuid         AS                                                                                   euuid,
         pe.observations AS                                                                                   obs,
         pe.encounter_date_time
  FROM completed_program_encounter_view pe
         INNER JOIN non_exited_program_enrolment_view e ON pe.program_enrolment_id = e.id
         INNER JOIN individual_view i ON e.individual_id = i.id
  WHERE e.program_name = ''''Adolescent''''
    AND (pe.encounter_type_name = ''''Severe Anemia Followup'''' or pe.encounter_type_name = ''''Moderate Anemia Followup'''')
    AND cast(pe.observations -> ''''1a750ccd-8330-42b6-b8e1-c383030ca87d'''' as FLOAT) > 0
    AND (e.enrolment_date_time ISNULL OR e.enrolment_date_time between '''''|| (select start_date from filters) ||''''' and '''''|| (select end_date from filters) ||''''')
)
SELECT distinct i.uuid              as uuid,
       i.gender            as gender_name,
       i.addresslevel_type as address_type,
       i.addresslevel_name as address_name
FROM individual_program_partitions ip
       JOIN individual_gender_address_view i ON i.uuid = ip.iuuid
       JOIN individual_program_partitions_recieved r on r.iuuid = ip.iuuid
WHERE cast(ip.obs ->> ''''f9ecabbc-2df2-4bfc-a6fa-aa417c50e11b'''' AS FLOAT) <= 10
  AND ip.erank = 1 and r.erank = 1;
'')
UNION ALL
SELECT
''Adolescents consumed > 30 tablets ''                                          rowid,
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
    AND (pe.encounter_type_name = ''''Annual Visit'''' or pe.encounter_type_name = ''''Quarterly Visit'''')
    AND pe.observations ->> ''''f9ecabbc-2df2-4bfc-a6fa-aa417c50e11b'''' notnull
    and (e.enrolment_date_time ISNULL OR e.enrolment_date_time between '''''|| (select start_date from filters) ||''''' and '''''|| (select end_date from filters) ||''''')

),
individual_program_partitions_recieved AS (
  SELECT i.uuid          AS                                                                                   iuuid,
         row_number() OVER (PARTITION BY i.uuid ORDER BY pe.encounter_date_time desc) erank,
         pe.uuid         AS                                                                                   euuid,
         pe.observations AS                                                                                   obs,
         pe.encounter_date_time
  FROM completed_program_encounter_view pe
         INNER JOIN non_exited_program_enrolment_view e ON pe.program_enrolment_id = e.id
         INNER JOIN individual_view i ON e.individual_id = i.id
  WHERE e.program_name = ''''Adolescent''''
    AND (pe.encounter_type_name = ''''Severe Anemia Followup'''' or pe.encounter_type_name = ''''Moderate Anemia Followup'''')
    AND cast(pe.observations -> ''''1a750ccd-8330-42b6-b8e1-c383030ca87d'''' as FLOAT) > 0
    AND cast(pe.observations ->> ''''a0fa3ce5-adc6-4c6e-9715-2f8d53b986ca'''' AS FLOAT)  > 0
    and (e.enrolment_date_time ISNULL OR e.enrolment_date_time between '''''|| (select start_date from filters) ||''''' and '''''|| (select end_date from filters) ||''''')

)
SELECT distinct i.uuid              as uuid,
       i.gender            as gender_name,
       i.addresslevel_type as address_type,
       i.addresslevel_name as address_name
FROM individual_program_partitions ip
       JOIN individual_gender_address_view i ON i.uuid = ip.iuuid
       JOIN individual_program_partitions_recieved r on r.iuuid = ip.iuuid
WHERE cast(ip.obs ->> ''''f9ecabbc-2df2-4bfc-a6fa-aa417c50e11b'''' AS FLOAT) <= 10
  AND cast(r.obs ->> ''''a0fa3ce5-adc6-4c6e-9715-2f8d53b986ca'''' AS FLOAT) > 30
  AND ip.erank = 1 and r.erank = 1;
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
    AND (pe.encounter_type_name = ''''Annual Visit'''' or pe.encounter_type_name = ''''Quarterly Visit'''')
    AND pe.observations ->> ''''f9ecabbc-2df2-4bfc-a6fa-aa417c50e11b'''' notnull
    AND (e.enrolment_date_time ISNULL OR e.enrolment_date_time between '''''|| (select start_date from filters) ||''''' and '''''|| (select end_date from filters) ||''''')

),
individual_program_partitions_recieved AS (
  SELECT i.uuid          AS                                                                                   iuuid,
         row_number() OVER (PARTITION BY i.uuid ORDER BY pe.encounter_date_time desc) erank,
         pe.uuid         AS                                                                                   euuid,
         pe.observations AS                                                                                   obs,
         pe.encounter_date_time
  FROM completed_program_encounter_view pe
         INNER JOIN non_exited_program_enrolment_view e ON pe.program_enrolment_id = e.id
         INNER JOIN individual_view i ON e.individual_id = i.id
  WHERE e.program_name = ''''Adolescent''''
    AND (pe.encounter_type_name = ''''Severe Anemia Followup'''' or pe.encounter_type_name = ''''Moderate Anemia Followup'''')
    AND cast(pe.observations -> ''''1a750ccd-8330-42b6-b8e1-c383030ca87d'''' as FLOAT) > 0
    AND (e.enrolment_date_time ISNULL OR e.enrolment_date_time between '''''|| (select start_date from filters) ||''''' and '''''|| (select end_date from filters) ||''''')
)
SELECT distinct i.uuid              as uuid,
       i.gender            as gender_name,
       i.addresslevel_type as address_type,
       i.addresslevel_name as address_name
FROM individual_program_partitions ip
       JOIN individual_gender_address_view i ON i.uuid = ip.iuuid
       JOIN individual_program_partitions_recieved r on r.iuuid = ip.iuuid
WHERE cast(ip.obs ->> ''''f9ecabbc-2df2-4bfc-a6fa-aa417c50e11b'''' AS FLOAT) <= 10
  AND ip.erank = 1 and r.erank = 1;
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
    AND (pe.encounter_type_name = ''''Severe Anemia Followup'''' or pe.encounter_type_name = ''''Quarterly Visit'''')
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
  AND cast(ip.obs ->> ''''f9ecabbc-2df2-4bfc-a6fa-aa417c50e11b'''' AS FLOAT) <= 10
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
    AND (pe.encounter_type_name = ''''Annual Visit'''' or pe.encounter_type_name = ''''Quarterly Visit'''')
    AND pe.observations ->> ''''f9ecabbc-2df2-4bfc-a6fa-aa417c50e11b'''' notnull
   and (e.enrolment_date_time ISNULL OR e.enrolment_date_time between '''''|| (select start_date from filters) ||''''' and '''''|| (select end_date from filters) ||''''')
)
SELECT i.uuid              as uuid,
       i.gender            as gender_name,
       i.addresslevel_type as address_type,
       i.addresslevel_name as address_name
FROM individual_program_partitions ip
       JOIN individual_gender_address_view i ON i.uuid = ip.iuuid
WHERE cast(ip.obs ->> ''''f9ecabbc-2df2-4bfc-a6fa-aa417c50e11b'''' AS FLOAT) <= 10
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