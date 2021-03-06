-- Generated Report
-- Name: ServiceDelivery

with filters as (
    select coalesce( [[ {{start_date}} , ]] '1900-01-01'::timestamptz) start_date,
           coalesce( [[ {{end_date}} , ]] current_timestamp) end_date
)

SELECT * FROM crosstab('SELECT
  ''Total Adolescents Registered''                                          rowid,
  address_type || '' '' || gender AS                             attribute,
  total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''SELECT
  i.uuid  uuid,
  i.gender as gender_name,
  i.addresslevel_type as address_type,
  i.addresslevel_name as address_name
FROM individual_gender_address_view i
WHERE 1 = 1 [[ and i.registration_date >=(' || '''' || quote_literal({{ start_date }}) || '''' || '  ::DATE)]]
  [[and i.registration_date <=' || '''' || quote_literal({{end_date}}) || '''' || ' ::DATE]]
'')
UNION ALL
SELECT
''Total Adolescents Enrolled''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''SELECT
  DISTINCT
  i.uuid  uuid,
  i.gender  gender_name,
  i.addresslevel_type  address_type,
  i.addresslevel_name address_name
FROM
  non_exited_program_enrolment_view enrolment
  LEFT OUTER JOIN individual_gender_address_view i ON enrolment.individual_id = i.id
WHERE enrolment.program_name = ''''Adolescent''''
[[ and enrolment.enrolment_date_time >=(' || '''' || quote_literal({{ start_date }}) || '''' || '  ::DATE)]]
  [[and enrolment.enrolment_date_time <=' || '''' || quote_literal({{end_date}}) || '''' || ' ::DATE]]
'', ''SELECT
  i.uuid  uuid,
  i.gender as gender_name,
  i.addresslevel_type as address_type,
  i.addresslevel_name as address_name
FROM individual_gender_address_view i
WHERE 1 = 1 [[ and i.registration_date >=(' || '''' || quote_literal({{ start_date }}) || '''' || '  ::DATE)]]
  [[and i.registration_date <=' || '''' || quote_literal({{end_date}}) || '''' || ' ::DATE]]
'')
UNION ALL
SELECT
''Total Adolescents With Problems''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''WITH latest_annual_visit AS (
    SELECT i.uuid          AS                                                                                 iuuid,
           (row_number() OVER (PARTITION BY individual_id ORDER BY pe.encounter_date_time desc) = 1)::boolean islatest,
           pe.uuid         AS                                                                                 euuid,
           pe.observations AS                                                                                 obs,
           pe.encounter_date_time
    FROM completed_program_encounter_view pe
             INNER JOIN non_exited_program_enrolment_view e ON pe.program_enrolment_id = e.id
             INNER JOIN individual_view i ON e.individual_id = i.id
    WHERE e.program_name = ''''Adolescent''''
      and pe.encounter_type_name = ''''Annual Visit''''
    [[ and e.enrolment_date_time >=(' || '''' || quote_literal({{ start_date }}) || '''' || '  ::DATE)]]
  [[and e.enrolment_date_time <=' || '''' || quote_literal({{end_date}}) || '''' || ' ::DATE]]
),
     latest_quarterly_visit AS (
         SELECT i.uuid          AS iuuid,
                (row_number() OVER (PARTITION BY individual_id ORDER BY pe.encounter_date_time desc) =
                 1)::boolean       islatest,
                pe.uuid         AS euuid,
                pe.observations AS obs,
                pe.encounter_date_time
         FROM completed_program_encounter_view pe
                  INNER JOIN non_exited_program_enrolment_view e ON pe.program_enrolment_id = e.id
                  INNER JOIN individual_view i ON e.individual_id = i.id
         WHERE e.program_name = ''''Adolescent''''
           and pe.encounter_type_name = ''''Quarterly Visit''''
    [[ and e.enrolment_date_time >=(' || '''' || quote_literal({{ start_date }}) || '''' || '  ::DATE)]]
  [[and e.enrolment_date_time <=' || '''' || quote_literal({{end_date}}) || '''' || ' ::DATE]]
     ),
     both_visits as (select *
                     from latest_annual_visit
                     where latest_annual_visit.islatest
                     union all
                     select *
                     from latest_quarterly_visit
                     where latest_quarterly_visit.islatest)
SELECT DISTINCT ip.iuuid            uuid,
                i.gender            gender_name,
                i.addresslevel_type address_type,
                i.addresslevel_name address_name
FROM both_visits ip
         LEFT OUTER JOIN individual_gender_address_view i ON i.uuid = ip.iuuid
WHERE (ip.obs @> ''''{"5af82adf-6be9-4792-9b3d-543b4b00f816":"04bb1773-c353-44a1-a68c-9b448e07ff70"}''''
    OR ip.obs @> ''''{"cbcfdd44-dac8-435f-9cd9-35f20db1f367":"04bb1773-c353-44a1-a68c-9b448e07ff70"}''''
    OR ip.obs @> ''''{"f621f0e0-f73f-4443-b02f-0b9d7cb5a5a6":"04bb1773-c353-44a1-a68c-9b448e07ff70"}''''
    OR ip.obs @> ''''{"4f29a019-05f5-4d50-a255-81ab7e12b4a3":"04bb1773-c353-44a1-a68c-9b448e07ff70"}''''
    OR ip.obs @> ''''{"15004f46-0720-417a-ab03-8805a3b549c4":"04bb1773-c353-44a1-a68c-9b448e07ff70"}''''
    OR ip.obs @> ''''{"4db4857f-7caa-4bd8-a528-09e8416e8f11":"04bb1773-c353-44a1-a68c-9b448e07ff70"}''''
    OR ip.obs @> ''''{"53ba2bf5-e8d8-4f88-86a3-0068465086ac":"04bb1773-c353-44a1-a68c-9b448e07ff70"}''''
    OR ip.obs @> ''''{"14598553-b87c-4c7c-b97a-27c83effae73":"04bb1773-c353-44a1-a68c-9b448e07ff70"}''''
    OR ip.obs @> ''''{"f3794468-8ff5-44a3-a279-2d8d2fb5aa78":"04bb1773-c353-44a1-a68c-9b448e07ff70"}''''
    OR ip.obs @> ''''{"4c58ddb2-0ba9-490d-ba07-f1cd70e0905a":"04bb1773-c353-44a1-a68c-9b448e07ff70"}''''
    OR ip.obs @> ''''{"14bb22df-1348-4336-9e4a-66b0741a6c3b":"04bb1773-c353-44a1-a68c-9b448e07ff70"}''''
    OR ip.obs @> ''''{"fdd74e4f-363b-4f74-a38c-d7e8ad1b00a1":"04bb1773-c353-44a1-a68c-9b448e07ff70"}''''
    OR ip.obs @> ''''{"7a71445d-6faa-4db6-95e1-f891312d0a33":"04bb1773-c353-44a1-a68c-9b448e07ff70"}''''
    OR ip.obs @> ''''{"bd4bab3c-f0c5-4427-a2cb-325e538774e3":"04bb1773-c353-44a1-a68c-9b448e07ff70"}''''
    OR ip.obs @> ''''{"1701b2f7-aaad-4808-9dcc-05437dd569f7":"04bb1773-c353-44a1-a68c-9b448e07ff70"}''''
    OR ip.obs @> ''''{"e36ee991-51f2-4443-afbc-ab96a7ec4276":"04bb1773-c353-44a1-a68c-9b448e07ff70"}''''
    OR ip.obs @> ''''{"54a4c12f-7e67-471d-a668-eddc3b712c0d":"04bb1773-c353-44a1-a68c-9b448e07ff70"}''''
    OR ip.obs @> ''''{"41b9cc54-8f06-4d9f-a70d-f9311b95c747":"04bb1773-c353-44a1-a68c-9b448e07ff70"}''''
    OR ip.obs @> ''''{"50d57508-77c3-4561-b8fc-402bd6d7a413":"04bb1773-c353-44a1-a68c-9b448e07ff70"}''''
    OR ip.obs @> ''''{"d86fbdcd-cbd3-4c13-9067-3bbde010438f":"04bb1773-c353-44a1-a68c-9b448e07ff70"}''''
    OR ip.obs @> ''''{"66dd68ee-6118-47df-95ee-a0d115a75a12":"04bb1773-c353-44a1-a68c-9b448e07ff70"}''''
    OR ip.obs @> ''''{"65fe703a-9756-4688-96d7-6854e783caa1":"04bb1773-c353-44a1-a68c-9b448e07ff70"}''''
    OR ip.obs @> ''''{"7a71445d-6faa-4db6-95e1-f891312d0a33":["04bb1773-c353-44a1-a68c-9b448e07ff70"]}''''
    OR cast(ip.obs ->> ''''7ac0d759-c50d-4971-88e0-84274224c839'''' AS FLOAT) < 14.5
    OR cast(ip.obs ->> ''''f9ecabbc-2df2-4bfc-a6fa-aa417c50e11b'''' AS FLOAT) <= 7
    OR ip.obs @> ''''{"b5daf90d-5b71-4b53-827f-edd4f6539d15":"2c343c7a-db14-4531-902a-d7b169300073"}''''
    OR ip.obs @> ''''{"f0e3c0db-0f01-4c3d-a468-b740849d0011":"04bb1773-c353-44a1-a68c-9b448e07ff70"}''''
    OR ip.obs @> ''''{"4cae960e-5e1e-4b23-9927-d95db35d83e3":"04bb1773-c353-44a1-a68c-9b448e07ff70"}''''
    OR ip.obs @> ''''{"2ebca9be-3be3-4d11-ada0-187563ff04f8":"04bb1773-c353-44a1-a68c-9b448e07ff70"}''''
    OR ip.obs -> ''''2ebca9be-3be3-4d11-ada0-187563ff04f8'''' ?| ARRAY [
        ''''92654fda-d485-4b6d-97c5-8a8fe2a9582a'''',
        ''''ef29759b-5f74-4f5a-b186-fea7697cfb34'''',
        ''''246df73a-07d8-4924-8cf9-787dea8278fe'''']
    OR ip.obs @> ''''{"672815aa-4c3f-457b-ac87-fa0b3924c957":"04bb1773-c353-44a1-a68c-9b448e07ff70"}''''
    OR ip.obs @> ''''{"84e60852-0d0b-4e8e-a3b0-f22d079d42d9":"04bb1773-c353-44a1-a68c-9b448e07ff70"}''''

    -- Menstrual Disorders
    OR ip.obs -> ''''0f87eac1-cf6a-4632-8af2-29a935451fe4'''' ?| ARRAY [
        ''''92ad8878-b476-4291-aa76-3377fa7cf19c'''',
        ''''33385edf-93bc-4513-aa03-480ce3bc7b5c'''',
        ''''92ad8878-b476-4291-aa76-3377fa7cf19c'''',
        ''''1c478c50-4761-460c-b33c-a18d0c1500f7'''',
        ''''4085f165-ccb8-409b-9d6e-ea7755cf123e'''',
        ''''aa30fb91-4b64-438b-b09e-4c7ff2701d71'''',
        ''''e27f4a35-c2ae-4d05-8930-e19e432221d1'''', ''''ce47ae12-e61c-49cc-8ccd-715f9d5cb76d''''])
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
[[ and enrolment.enrolment_date_time >=(' || '''' || quote_literal({{ start_date }}) || '''' || '  ::DATE)]]
  [[and enrolment.enrolment_date_time <=' || '''' || quote_literal({{end_date}}) || '''' || ' ::DATE]]
'')
UNION ALL
SELECT
''Total Adolescents Referred''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''WITH latest_annual_visit AS (
    SELECT i.uuid          AS                                                                                 iuuid,
           (row_number() OVER (PARTITION BY individual_id ORDER BY pe.encounter_date_time desc) = 1)::boolean islatest,
           pe.uuid         AS                                                                                 euuid,
           pe.observations AS                                                                                 obs,
           pe.encounter_date_time
    FROM completed_program_encounter_view pe
             INNER JOIN non_exited_program_enrolment_view e ON pe.program_enrolment_id = e.id
             INNER JOIN individual_view i ON e.individual_id = i.id
    WHERE e.program_name = ''''Adolescent''''
      and pe.encounter_type_name = ''''Annual Visit''''
    [[ and e.enrolment_date_time >=(' || '''' || quote_literal({{ start_date }}) || '''' || '  ::DATE)]]
  [[and e.enrolment_date_time <=' || '''' || quote_literal({{end_date}}) || '''' || ' ::DATE]]
),
     latest_quarterly_visit AS (
         SELECT i.uuid          AS iuuid,
                (row_number() OVER (PARTITION BY individual_id ORDER BY pe.encounter_date_time desc) =
                 1)::boolean       islatest,
                pe.uuid         AS euuid,
                pe.observations AS obs,
                pe.encounter_date_time
         FROM completed_program_encounter_view pe
                  INNER JOIN non_exited_program_enrolment_view e ON pe.program_enrolment_id = e.id
                  INNER JOIN individual_view i ON e.individual_id = i.id
         WHERE e.program_name = ''''Adolescent''''
           and pe.encounter_type_name = ''''Quarterly Visit''''
    [[ and e.enrolment_date_time >=(' || '''' || quote_literal({{ start_date }}) || '''' || '  ::DATE)]]
  [[and e.enrolment_date_time <=' || '''' || quote_literal({{end_date}}) || '''' || ' ::DATE]]
     ),
     both_visits as (select *
                     from latest_annual_visit
                     where latest_annual_visit.islatest
                     union all
                     select *
                     from latest_quarterly_visit
                     where latest_quarterly_visit.islatest)
SELECT distinct ip.iuuid            uuid,
                i.gender            gender_name,
                i.addresslevel_type address_type,
                i.addresslevel_name address_name
FROM both_visits ip
         LEFT OUTER JOIN individual_gender_address_view i ON i.uuid = ip.iuuid
WHERE (ip.obs -> ''''0e620ea5-1a80-499f-9d07-b972a9130d60'''' IS NOT NULL
    OR ip.obs -> ''''de5f1932-263b-48d2-8add-720c089aa6d6'''' IS NOT NULL)

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
[[ and enrolment.enrolment_date_time >=(' || '''' || quote_literal({{ start_date }}) || '''' || '  ::DATE)]]
  [[and enrolment.enrolment_date_time <=' || '''' || quote_literal({{end_date}}) || '''' || ' ::DATE]]
'')
UNION ALL
SELECT
''Total Adolescents Dropped Out''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''WITH individual_program_partitions AS (
    SELECT e.individual_id,
           (row_number()  OVER (PARTITION BY individual_id ORDER BY pe.encounter_date_time desc) = 1)::boolean islatest,
           pe.program_enrolment_id,
           pe.observations @> ''''{"575a29c3-a070-4c7d-ac96-fe58b6bddca3":"58f789aa-6570-4aea-87a7-1f7651729c5a"}'''' isdropout
    FROM completed_program_encounter_view pe
             INNER JOIN non_exited_program_enrolment_view e ON pe.program_enrolment_id = e.id
    WHERE e.program_name = ''''Adolescent''''
      and (e.enrolment_date_time ISNULL OR e.enrolment_date_time between '''''|| (select start_date from filters) ||''''' and '''''|| (select end_date from filters) ||''''')
      AND (pe.encounter_type_name = ''''Annual Visit'''' or pe.encounter_type_name = ''''Quarterly Visit''''))

SELECT DISTINCT
    i.uuid,
    i.gender,
    i.addresslevel_type,
    i.addresslevel_name
FROM individual_program_partitions pe
         JOIN individual_gender_address_view i ON pe.individual_id = i.id
WHERE pe.isdropout and pe.islatest;
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
[[ and enrolment.enrolment_date_time >=(' || '''' || quote_literal({{ start_date }}) || '''' || '  ::DATE)]]
  [[and enrolment.enrolment_date_time <=' || '''' || quote_literal({{end_date}}) || '''' || ' ::DATE]]
'')
UNION ALL
SELECT
''Total Adolescents With a Dropout Home Visit''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''WITH individual_program_partitions AS (
  SELECT e.individual_id,
         (row_number()  OVER (PARTITION BY individual_id ORDER BY pe.encounter_date_time desc) = 1)::boolean islatest,
         pe.program_enrolment_id,
         pe.observations @> ''''{"575a29c3-a070-4c7d-ac96-fe58b6bddca3":"58f789aa-6570-4aea-87a7-1f7651729c5a"}'''' isdropout
  FROM completed_program_encounter_view pe
         INNER JOIN program_enrolment_view e ON pe.program_enrolment_id = e.id
  WHERE e.program_name = ''''Adolescent''''
    and (e.enrolment_date_time ISNULL OR e.enrolment_date_time between '''''|| (select start_date from filters) ||''''' and '''''|| (select end_date from filters) ||''''')
    AND (pe.encounter_type_name = ''''Annual Visit'''' or pe.encounter_type_name = ''''Quarterly Visit''''))

SELECT DISTINCT
  i.uuid,
  i.gender,
  i.addresslevel_type,
  i.addresslevel_name
FROM individual_program_partitions pe
  join completed_program_encounter_view ce ON pe.program_enrolment_id = ce.program_enrolment_id
  JOIN individual_gender_address_view i ON pe.individual_id = i.id
WHERE ce.encounter_type_name = ''''Dropout Home Visit''''
and pe.isdropout and pe.islatest;
'', ''WITH individual_program_partitions AS (
    SELECT e.individual_id,
           (row_number()  OVER (PARTITION BY individual_id ORDER BY pe.encounter_date_time desc) = 1)::boolean islatest,
           pe.program_enrolment_id,
           pe.observations @> ''''{"575a29c3-a070-4c7d-ac96-fe58b6bddca3":"58f789aa-6570-4aea-87a7-1f7651729c5a"}'''' isdropout
    FROM completed_program_encounter_view pe
             INNER JOIN non_exited_program_enrolment_view e ON pe.program_enrolment_id = e.id
    WHERE e.program_name = ''''Adolescent''''
      and (e.enrolment_date_time ISNULL OR e.enrolment_date_time between '''''|| (select start_date from filters) ||''''' and '''''|| (select end_date from filters) ||''''')
      AND (pe.encounter_type_name = ''''Annual Visit'''' or pe.encounter_type_name = ''''Quarterly Visit''''))

SELECT DISTINCT
    i.uuid,
    i.gender,
    i.addresslevel_type,
    i.addresslevel_name
FROM individual_program_partitions pe
         JOIN individual_gender_address_view i ON pe.individual_id = i.id
WHERE pe.isdropout and pe.islatest;
'')
UNION ALL
SELECT
''Total Adolescents Started Going to School Again''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''SELECT DISTINCT
  i.uuid,
  i.gender,
  i.addresslevel_type,
  i.addresslevel_name
FROM completed_program_encounter_view pe
       INNER JOIN non_exited_program_enrolment_view e ON pe.program_enrolment_id = e.id
       INNER JOIN individual_gender_address_view i ON e.individual_id = i.id
WHERE e.program_name = ''''Adolescent''''
  AND (pe.observations @> ''''{"dcfc771a-0785-43be-bcb1-0d2755793e0e":"28e76608-dddd-4914-bd44-3689eccfa5ca"}''''
  OR pe.observations @> ''''{"dcfc771a-0785-43be-bcb1-0d2755793e0e":"9715936e-03f2-44da-900f-33588fe95250"}'''')
  [[ and e.enrolment_date_time >=(' || '''' || quote_literal({{ start_date }}) || '''' || '  ::DATE)]]
  [[and e.enrolment_date_time <=' || '''' || quote_literal({{end_date}}) || '''' || ' ::DATE]]
'', ''WITH individual_program_partitions AS (
    SELECT e.individual_id,
           (row_number()  OVER (PARTITION BY individual_id ORDER BY pe.encounter_date_time desc) = 1)::boolean islatest,
           pe.program_enrolment_id,
           pe.observations @> ''''{"575a29c3-a070-4c7d-ac96-fe58b6bddca3":"58f789aa-6570-4aea-87a7-1f7651729c5a"}'''' isdropout
    FROM completed_program_encounter_view pe
             INNER JOIN non_exited_program_enrolment_view e ON pe.program_enrolment_id = e.id
    WHERE e.program_name = ''''Adolescent''''
      and (e.enrolment_date_time ISNULL OR e.enrolment_date_time between '''''|| (select start_date from filters) ||''''' and '''''|| (select end_date from filters) ||''''')
      AND (pe.encounter_type_name = ''''Annual Visit'''' or pe.encounter_type_name = ''''Quarterly Visit''''))

SELECT DISTINCT
    i.uuid,
    i.gender,
    i.addresslevel_type,
    i.addresslevel_name
FROM individual_program_partitions pe
         JOIN individual_gender_address_view i ON pe.individual_id = i.id
WHERE pe.isdropout and pe.islatest;
'')
UNION ALL
SELECT
''Exited''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''SELECT
  DISTINCT
  i.uuid  uuid,
  i.gender  gender_name,
  i.addresslevel_type  address_type,
  i.addresslevel_name address_name
FROM
  program_enrolment_view enrolment
  LEFT OUTER JOIN individual_gender_address_view i ON enrolment.individual_id = i.id
WHERE enrolment.program_name = ''''Adolescent''''
  AND program_exit_date_time NOTNULL
  [[ and enrolment.program_exit_date_time >= (' || '''' || quote_literal({{ start_date }}) || '''' || '  ::DATE) ]]
  [[ and enrolment.program_exit_date_time <= ' || '''' || quote_literal({{ end_date }}) || '''' || ' ::DATE ]]'', ''SELECT
  DISTINCT
  i.uuid  uuid,
  i.gender  gender_name,
  i.addresslevel_type  address_type,
  i.addresslevel_name address_name
FROM
  program_enrolment_view enrolment
  LEFT OUTER JOIN individual_gender_address_view i ON enrolment.individual_id = i.id
WHERE enrolment.program_name = ''''Adolescent''''
AND (program_exit_date_time ISNULL
  [[ OR enrolment.program_exit_date_time < (' || '''' || quote_literal({{ start_date }}) || '''' || '  ::DATE) ]]
  [[ OR enrolment.program_exit_date_time > ' || '''' || quote_literal({{ end_date }}) || '''' || ' ::DATE ]])'')
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