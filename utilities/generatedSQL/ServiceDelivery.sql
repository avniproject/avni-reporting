-- Generated Report
-- Name: ServiceDelivery

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
WHERE enrolment.program_name = ''''Adolescent'''' [[and enrolment.enrolment_date_time >=(' || '''' || quote_literal({{ start_date }}) || '''' || '  ::DATE)]]
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
FROM frequency_and_percentage(''WITH individual_program_partitions AS (
  SELECT i.uuid          AS                                                                                   iuuid,
         row_number() OVER (PARTITION BY i.uuid, pe.encounter_type_name ORDER BY pe.encounter_date_time desc) erank,
         pe.uuid         AS                                                                                   euuid,
         pe.observations AS                                                                                   obs,
         pe.encounter_date_time
  FROM completed_program_encounter_view pe
         INNER JOIN non_exited_program_enrolment_view e ON pe.program_enrolment_id = e.id
         INNER JOIN individual_view i ON e.individual_id = i.id
  WHERE e.program_name = ''''Adolescent''''
    and (pe.encounter_type_name = ''''Annual Visit'''' or pe.encounter_type_name = ''''Quarterly Visit'''')
    [[and pe.encounter_date_time >=(' || '''' || quote_literal({{ start_date }}) || '''' || '  ::DATE)]]
      [[and pe.encounter_date_time <=' || '''' || quote_literal({{end_date}}) || '''' || ' ::DATE]]
), individual_partitions AS (
  select *,
         row_number() OVER (PARTITION BY pe.iuuid ORDER BY pe.encounter_date_time desc) irank
  from individual_program_partitions pe
  where erank = 1
)
SELECT
  ip.iuuid            uuid,
  i.gender            gender_name,
  i.addresslevel_type address_type,
  i.addresslevel_name address_name
FROM individual_partitions ip
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
  -- Menstrual Disorders
  OR ip.obs -> ''''0f87eac1-cf6a-4632-8af2-29a935451fe4'''' ?| ARRAY [
    ''''92ad8878-b476-4291-aa76-3377fa7cf19c'''',
    ''''33385edf-93bc-4513-aa03-480ce3bc7b5c'''',
    ''''92ad8878-b476-4291-aa76-3377fa7cf19c'''',
    ''''1c478c50-4761-460c-b33c-a18d0c1500f7'''',
    ''''4085f165-ccb8-409b-9d6e-ea7755cf123e'''',
    ''''aa30fb91-4b64-438b-b09e-4c7ff2701d71'''',
    ''''e27f4a35-c2ae-4d05-8930-e19e432221d1'''', ''''ce47ae12-e61c-49cc-8ccd-715f9d5cb76d''''])
  AND irank = 1
'', ''SELECT
  DISTINCT
  i.uuid  uuid,
  i.gender  gender_name,
  i.addresslevel_type  address_type,
  i.addresslevel_name address_name
FROM
  non_exited_program_enrolment_view enrolment
  LEFT OUTER JOIN individual_gender_address_view i ON enrolment.individual_id = i.id
WHERE enrolment.program_name = ''''Adolescent'''' [[and enrolment.enrolment_date_time >=(' || '''' || quote_literal({{ start_date }}) || '''' || '  ::DATE)]]
    [[and enrolment.enrolment_date_time <=' || '''' || quote_literal({{end_date}}) || '''' || ' ::DATE]]
'')
UNION ALL
SELECT
''Total Adolescents Referred''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''WITH individual_program_partitions AS (
  SELECT i.uuid          AS                                                                                   iuuid,
         row_number() OVER (PARTITION BY i.uuid, pe.encounter_type_name ORDER BY pe.encounter_date_time desc) erank,
         pe.uuid         AS                                                                                   euuid,
         pe.observations AS                                                                                   obs,
         pe.encounter_date_time
  FROM completed_program_encounter_view pe
         INNER JOIN non_exited_program_enrolment_view e ON pe.program_enrolment_id = e.id
         INNER JOIN individual_view i ON e.individual_id = i.id
  WHERE e.program_name = ''''Adolescent''''
    and (pe.encounter_type_name = ''''Annual Visit'''' or pe.encounter_type_name = ''''Quarterly Visit'''')
    [[and pe.encounter_date_time >=(' || '''' || quote_literal({{ start_date }}) || '''' || '  ::DATE)]]
      [[and pe.encounter_date_time <=' || '''' || quote_literal({{end_date}}) || '''' || ' ::DATE]]
), individual_partitions AS (
  select *,
         row_number() OVER (PARTITION BY pe.iuuid ORDER BY pe.encounter_date_time desc) irank
  from individual_program_partitions pe
  where erank = 1
)
SELECT
  ip.iuuid uuid,
  i.gender    gender_name,
  i.addresslevel_type   address_type,
  i.addresslevel_name   address_name
FROM individual_partitions ip
  LEFT OUTER JOIN individual_gender_address_view i ON i.uuid = ip.iuuid
WHERE ip.obs -> ''''0e620ea5-1a80-499f-9d07-b972a9130d60'''' IS NOT NULL
  AND irank = 1
'', ''SELECT
  DISTINCT
  i.uuid  uuid,
  i.gender  gender_name,
  i.addresslevel_type  address_type,
  i.addresslevel_name address_name
FROM
  non_exited_program_enrolment_view enrolment
  LEFT OUTER JOIN individual_gender_address_view i ON enrolment.individual_id = i.id
WHERE enrolment.program_name = ''''Adolescent'''' [[and enrolment.enrolment_date_time >=(' || '''' || quote_literal({{ start_date }}) || '''' || '  ::DATE)]]
    [[and enrolment.enrolment_date_time <=' || '''' || quote_literal({{end_date}}) || '''' || ' ::DATE]]
'')
UNION ALL
SELECT
''Total Adolescents Dropped Out''                                          rowid,
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
WHERE e.program_name = ''''Adolescent'''' AND pe.observations @> ''''{"575a29c3-a070-4c7d-ac96-fe58b6bddca3":"58f789aa-6570-4aea-87a7-1f7651729c5a"}''''
   [[and pe.encounter_date_time >=(' || '''' || quote_literal({{ start_date }}) || '''' || '  ::DATE)]]
    [[and pe.encounter_date_time <=' || '''' || quote_literal({{end_date}}) || '''' || ' ::DATE]]
'', ''SELECT
  DISTINCT
  i.uuid  uuid,
  i.gender  gender_name,
  i.addresslevel_type  address_type,
  i.addresslevel_name address_name
FROM
  non_exited_program_enrolment_view enrolment
  LEFT OUTER JOIN individual_gender_address_view i ON enrolment.individual_id = i.id
WHERE enrolment.program_name = ''''Adolescent'''' [[and enrolment.enrolment_date_time >=(' || '''' || quote_literal({{ start_date }}) || '''' || '  ::DATE)]]
    [[and enrolment.enrolment_date_time <=' || '''' || quote_literal({{end_date}}) || '''' || ' ::DATE]]
'')
UNION ALL
SELECT
''Total Adolescents With a Dropout Home Visit''                                          rowid,
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
WHERE e.program_name = ''''Adolescent'''' AND pe.encounter_type_name = ''''Dropout Home Visit'''' [[and pe.encounter_date_time >=(' || '''' || quote_literal({{ start_date }}) || '''' || '  ::DATE)]]
    [[and pe.encounter_date_time <=' || '''' || quote_literal({{end_date}}) || '''' || ' ::DATE]]
'', ''SELECT DISTINCT
  i.uuid,
  i.gender,
  i.addresslevel_type,
  i.addresslevel_name
FROM completed_program_encounter_view pe
       INNER JOIN non_exited_program_enrolment_view e ON pe.program_enrolment_id = e.id
       INNER JOIN individual_gender_address_view i ON e.individual_id = i.id
WHERE e.program_name = ''''Adolescent'''' AND pe.observations @> ''''{"575a29c3-a070-4c7d-ac96-fe58b6bddca3":"58f789aa-6570-4aea-87a7-1f7651729c5a"}''''
   [[and pe.encounter_date_time >=(' || '''' || quote_literal({{ start_date }}) || '''' || '  ::DATE)]]
    [[and pe.encounter_date_time <=' || '''' || quote_literal({{end_date}}) || '''' || ' ::DATE]]
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
  [[and pe.encounter_date_time >=(' || '''' || quote_literal({{ start_date }}) || '''' || '  ::DATE)]]
    [[and pe.encounter_date_time <=' || '''' || quote_literal({{end_date}}) || '''' || ' ::DATE]]'', ''SELECT DISTINCT
  i.uuid,
  i.gender,
  i.addresslevel_type,
  i.addresslevel_name
FROM completed_program_encounter_view pe
       INNER JOIN non_exited_program_enrolment_view e ON pe.program_enrolment_id = e.id
       INNER JOIN individual_gender_address_view i ON e.individual_id = i.id
WHERE e.program_name = ''''Adolescent'''' AND pe.observations @> ''''{"575a29c3-a070-4c7d-ac96-fe58b6bddca3":"58f789aa-6570-4aea-87a7-1f7651729c5a"}''''
   [[and pe.encounter_date_time >=(' || '''' || quote_literal({{ start_date }}) || '''' || '  ::DATE)]]
    [[and pe.encounter_date_time <=' || '''' || quote_literal({{end_date}}) || '''' || ' ::DATE]]
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