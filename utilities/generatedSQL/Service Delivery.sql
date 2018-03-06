SELECT * FROM crosstab('SELECT
  ''Total Adolescents Registered''                                          rowid,
  address_type || '' '' || gender AS                             attribute,
  total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''SELECT
  DISTINCT
  i.uuid  uuid,
  g.name  gender_name,
  a.type  address_type,
  a.title address_name
FROM
  program_encounter pe
  LEFT OUTER JOIN encounter_type et ON et.id = pe.encounter_type_id
  LEFT OUTER JOIN program_enrolment enrolment ON pe.program_enrolment_id = enrolment.id
  LEFT OUTER JOIN program p ON enrolment.program_id = p.id
  LEFT OUTER JOIN individual i ON enrolment.individual_id = i.id
  LEFT OUTER JOIN gender g ON g.id = i.gender_id
  LEFT OUTER JOIN address_level a ON i.address_id = a.id
WHERE p.name = ''''Adolescent'''' AND et.name = ''''Annual Visit'''''')
UNION ALL
SELECT
  ''Total Adolescents Enrolled''                                          rowid,
  address_type || '' '' || gender AS                             attribute,
  total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''SELECT
  i.uuid  uuid,
  g.name  gender_name,
  a.type  address_type,
  a.title address_name
FROM individual i
  LEFT OUTER JOIN gender g ON g.id = i.gender_id
  INNER JOIN address_level a ON i.address_id = a.id
  INNER JOIN program_enrolment enrolment ON i.id = enrolment.individual_id
  INNER JOIN program p ON enrolment.program_id = p.id
WHERE p.name = ''''Adolescent'''''')
UNION ALL
SELECT
''Total Adolescents With Problems''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''WITH latest_program_all_encounters AS (
    SELECT
      i.uuid       AS             iuuid,
      max(pe.encounter_date_time) edt,
      et.name                     etname,
      max(pe.uuid) AS             euuid,
      e.uuid       AS             puuid
    FROM program_encounter pe
      INNER JOIN program_enrolment e ON pe.program_enrolment_id = e.id
      INNER JOIN individual i ON e.individual_id = i.id
      INNER JOIN encounter_type et ON pe.encounter_type_id = et.id
      INNER JOIN program p ON p.id = e.program_id
    WHERE p.name = ''''Adolescent''''
          AND pe.encounter_date_time IS NOT NULL
    GROUP BY i.uuid, e.uuid, et.name
), latest_program_encounters AS (
    SELECT
      lpae.iuuid                              iuuid,
      jsonb_merge(jsonb_agg(jsonb_strip_nulls(pe.observations))) obs
    FROM latest_program_all_encounters lpae
      INNER JOIN program_encounter pe ON pe.uuid = lpae.euuid
    GROUP BY lpae.iuuid
)
SELECT
  lpe.iuuid uuid,
  g.name    gender_name,
  a.type    address_type,
  a.title   address_name
FROM latest_program_encounters lpe
  LEFT OUTER JOIN individual i ON i.uuid = lpe.iuuid
  LEFT OUTER JOIN address_level a ON i.address_id = a.id
  LEFT OUTER JOIN gender g ON i.gender_id = g.id
WHERE (lpe.obs @> ''''{"5af82adf-6be9-4792-9b3d-543b4b00f816":"04bb1773-c353-44a1-a68c-9b448e07ff70"}''''
       OR lpe.obs @> ''''{"cbcfdd44-dac8-435f-9cd9-35f20db1f367":"04bb1773-c353-44a1-a68c-9b448e07ff70"}''''
       OR lpe.obs @> ''''{"f621f0e0-f73f-4443-b02f-0b9d7cb5a5a6":"04bb1773-c353-44a1-a68c-9b448e07ff70"}''''
       OR lpe.obs @> ''''{"4f29a019-05f5-4d50-a255-81ab7e12b4a3":"04bb1773-c353-44a1-a68c-9b448e07ff70"}''''
       OR lpe.obs @> ''''{"15004f46-0720-417a-ab03-8805a3b549c4":"04bb1773-c353-44a1-a68c-9b448e07ff70"}''''
       OR lpe.obs @> ''''{"4db4857f-7caa-4bd8-a528-09e8416e8f11":"04bb1773-c353-44a1-a68c-9b448e07ff70"}''''
       OR lpe.obs @> ''''{"53ba2bf5-e8d8-4f88-86a3-0068465086ac":"04bb1773-c353-44a1-a68c-9b448e07ff70"}''''
       OR lpe.obs @> ''''{"14598553-b87c-4c7c-b97a-27c83effae73":"04bb1773-c353-44a1-a68c-9b448e07ff70"}''''
       OR lpe.obs @> ''''{"f3794468-8ff5-44a3-a279-2d8d2fb5aa78":"04bb1773-c353-44a1-a68c-9b448e07ff70"}''''
       OR lpe.obs @> ''''{"4c58ddb2-0ba9-490d-ba07-f1cd70e0905a":"04bb1773-c353-44a1-a68c-9b448e07ff70"}''''
       OR lpe.obs @> ''''{"14bb22df-1348-4336-9e4a-66b0741a6c3b":"04bb1773-c353-44a1-a68c-9b448e07ff70"}''''
       OR lpe.obs @> ''''{"fdd74e4f-363b-4f74-a38c-d7e8ad1b00a1":"04bb1773-c353-44a1-a68c-9b448e07ff70"}''''
       OR lpe.obs @> ''''{"7a71445d-6faa-4db6-95e1-f891312d0a33":"04bb1773-c353-44a1-a68c-9b448e07ff70"}''''
       OR lpe.obs @> ''''{"bd4bab3c-f0c5-4427-a2cb-325e538774e3":"04bb1773-c353-44a1-a68c-9b448e07ff70"}''''
       OR lpe.obs @> ''''{"1701b2f7-aaad-4808-9dcc-05437dd569f7":"04bb1773-c353-44a1-a68c-9b448e07ff70"}''''
       OR lpe.obs @> ''''{"e36ee991-51f2-4443-afbc-ab96a7ec4276":"04bb1773-c353-44a1-a68c-9b448e07ff70"}''''
       OR lpe.obs @> ''''{"54a4c12f-7e67-471d-a668-eddc3b712c0d":"04bb1773-c353-44a1-a68c-9b448e07ff70"}''''
       OR lpe.obs @> ''''{"41b9cc54-8f06-4d9f-a70d-f9311b95c747":"04bb1773-c353-44a1-a68c-9b448e07ff70"}''''
       OR lpe.obs @> ''''{"50d57508-77c3-4561-b8fc-402bd6d7a413":"04bb1773-c353-44a1-a68c-9b448e07ff70"}''''
       OR lpe.obs @> ''''{"d86fbdcd-cbd3-4c13-9067-3bbde010438f":"04bb1773-c353-44a1-a68c-9b448e07ff70"}''''
       OR lpe.obs @> ''''{"66dd68ee-6118-47df-95ee-a0d115a75a12":"04bb1773-c353-44a1-a68c-9b448e07ff70"}''''
       OR lpe.obs @> ''''{"65fe703a-9756-4688-96d7-6854e783caa1":"04bb1773-c353-44a1-a68c-9b448e07ff70"}''''
       OR lpe.obs @> ''''{"7a71445d-6faa-4db6-95e1-f891312d0a33":["04bb1773-c353-44a1-a68c-9b448e07ff70"]}''''
       -- Menstrual Disorders
       OR lpe.obs -> ''''0f87eac1-cf6a-4632-8af2-29a935451fe4'''' ?| ARRAY [
''''92ad8878-b476-4291-aa76-3377fa7cf19c'''',
''''33385edf-93bc-4513-aa03-480ce3bc7b5c'''',
''''92ad8878-b476-4291-aa76-3377fa7cf19c'''',
''''1c478c50-4761-460c-b33c-a18d0c1500f7'''',
''''4085f165-ccb8-409b-9d6e-ea7755cf123e'''',
''''aa30fb91-4b64-438b-b09e-4c7ff2701d71'''',
''''e27f4a35-c2ae-4d05-8930-e19e432221d1'''', ''''ce47ae12-e61c-49cc-8ccd-715f9d5cb76d''''])'', ''SELECT
  DISTINCT
  i.uuid  uuid,
  g.name  gender_name,
  a.type  address_type,
  a.title address_name
FROM
  program_encounter pe
  LEFT OUTER JOIN encounter_type et ON et.id = pe.encounter_type_id
  LEFT OUTER JOIN program_enrolment enrolment ON pe.program_enrolment_id = enrolment.id
  LEFT OUTER JOIN program p ON enrolment.program_id = p.id
  LEFT OUTER JOIN individual i ON enrolment.individual_id = i.id
  LEFT OUTER JOIN gender g ON g.id = i.gender_id
  LEFT OUTER JOIN address_level a ON i.address_id = a.id
WHERE p.name = ''''Adolescent'''' AND et.name = ''''Annual Visit'''''')
UNION ALL
SELECT
''Total Adolescents Referred''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''WITH all_program_all_encounters AS (
    SELECT
      i.uuid AS                               iuuid,
      jsonb_merge(jsonb_agg(jsonb_strip_nulls(pe.observations))) obs
    FROM program_encounter pe
      INNER JOIN program_enrolment e ON pe.program_enrolment_id = e.id
      INNER JOIN individual i ON e.individual_id = i.id
      INNER JOIN encounter_type et ON pe.encounter_type_id = et.id
      INNER JOIN program p ON p.id = e.program_id
    WHERE p.name = ''''Adolescent''''
          AND pe.encounter_date_time IS NOT NULL
    GROUP BY i.uuid
)
SELECT
  lpe.iuuid uuid,
  g.name    gender_name,
  a.type    address_type,
  a.title   address_name
FROM all_program_all_encounters lpe
  LEFT OUTER JOIN individual i ON i.uuid = lpe.iuuid
  LEFT OUTER JOIN address_level a ON i.address_id = a.id
  LEFT OUTER JOIN gender g ON i.gender_id = g.id
WHERE lpe.obs -> ''''0e620ea5-1a80-499f-9d07-b972a9130d60'''' IS NOT NULL'', ''SELECT
  DISTINCT
  i.uuid  uuid,
  g.name  gender_name,
  a.type  address_type,
  a.title address_name
FROM
  program_encounter pe
  LEFT OUTER JOIN encounter_type et ON et.id = pe.encounter_type_id
  LEFT OUTER JOIN program_enrolment enrolment ON pe.program_enrolment_id = enrolment.id
  LEFT OUTER JOIN program p ON enrolment.program_id = p.id
  LEFT OUTER JOIN individual i ON enrolment.individual_id = i.id
  LEFT OUTER JOIN gender g ON g.id = i.gender_id
  LEFT OUTER JOIN address_level a ON i.address_id = a.id
WHERE p.name = ''''Adolescent'''' AND et.name = ''''Annual Visit'''''')
UNION ALL
SELECT
''Total Adolescents needed Counselling''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''WITH all_program_all_encounters AS (
    SELECT
      i.uuid AS                               iuuid,
      jsonb_merge(jsonb_agg(jsonb_strip_nulls(pe.observations))) obs
    FROM program_encounter pe
      INNER JOIN program_enrolment e ON pe.program_enrolment_id = e.id
      INNER JOIN individual i ON e.individual_id = i.id
      INNER JOIN encounter_type et ON pe.encounter_type_id = et.id
      INNER JOIN program p ON p.id = e.program_id
    WHERE p.name = ''''Adolescent''''
          AND pe.encounter_date_time IS NOT NULL
    GROUP BY i.uuid
)
SELECT
  lpe.iuuid uuid,
  g.name    gender_name,
  a.type    address_type,
  a.title   address_name
FROM all_program_all_encounters lpe
  LEFT OUTER JOIN individual i ON i.uuid = lpe.iuuid
  LEFT OUTER JOIN address_level a ON i.address_id = a.id
  LEFT OUTER JOIN gender g ON i.gender_id = g.id
WHERE lpe.obs -> ''''e45d8168-c4a2-427b-85aa-d0f0e8467a8f'''' IS NOT NULL
      OR lpe.obs -> ''''e31481f1-c719-46dc-b1de-a0f282b33d12'''' IS NOT NULL
      OR lpe.obs -> ''''6c0ed446-b555-4bb7-90f8-6da6f9827ab9'''' IS NOT NULL
      OR lpe.obs -> ''''ed9ea061-2e35-41b8-a50f-aa2b30b7fc3c'''' IS NOT NULL
      OR lpe.obs -> ''''a32eeb3a-a36d-4f82-a02d-d8066c41a5b1'''' IS NOT NULL
      OR lpe.obs -> ''''c3aceea7-e0f0-46f1-855a-a664ecc4d063'''' IS NOT NULL
      OR lpe.obs -> ''''5a300ad8-13f3-4d1c-aa2d-6bc36dcb5ff6'''' IS NOT NULL
      OR lpe.obs -> ''''a53a6c13-8a84-4be5-958b-e07611426fe0'''' IS NOT NULL'', ''SELECT
  DISTINCT
  i.uuid  uuid,
  g.name  gender_name,
  a.type  address_type,
  a.title address_name
FROM
  program_encounter pe
  LEFT OUTER JOIN encounter_type et ON et.id = pe.encounter_type_id
  LEFT OUTER JOIN program_enrolment enrolment ON pe.program_enrolment_id = enrolment.id
  LEFT OUTER JOIN program p ON enrolment.program_id = p.id
  LEFT OUTER JOIN individual i ON enrolment.individual_id = i.id
  LEFT OUTER JOIN gender g ON g.id = i.gender_id
  LEFT OUTER JOIN address_level a ON i.address_id = a.id
WHERE p.name = ''''Adolescent'''' AND et.name = ''''Annual Visit'''''')
UNION ALL
SELECT
''Total Adolescents Counselled''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''WITH all_program_all_encounters AS (
    SELECT
      i.uuid AS                               iuuid,
      jsonb_merge(jsonb_agg(jsonb_strip_nulls(pe.observations))) obs
    FROM program_encounter pe
      INNER JOIN program_enrolment e ON pe.program_enrolment_id = e.id
      INNER JOIN individual i ON e.individual_id = i.id
      INNER JOIN encounter_type et ON pe.encounter_type_id = et.id
      INNER JOIN program p ON p.id = e.program_id
    WHERE p.name = ''''Adolescent''''
          AND pe.encounter_date_time IS NOT NULL
    GROUP BY i.uuid
)
SELECT
  lpe.iuuid uuid,
  g.name    gender_name,
  a.type    address_type,
  a.title   address_name
FROM all_program_all_encounters lpe
  LEFT OUTER JOIN individual i ON i.uuid = lpe.iuuid
  LEFT OUTER JOIN address_level a ON i.address_id = a.id
  LEFT OUTER JOIN gender g ON i.gender_id = g.id
WHERE lpe.obs @> ''''{"e45d8168-c4a2-427b-85aa-d0f0e8467a8f":"04bb1773-c353-44a1-a68c-9b448e07ff70"}''''
      OR lpe.obs @> ''''{"e31481f1-c719-46dc-b1de-a0f282b33d12":"04bb1773-c353-44a1-a68c-9b448e07ff70"}''''
      OR lpe.obs @> ''''{"6c0ed446-b555-4bb7-90f8-6da6f9827ab9":"04bb1773-c353-44a1-a68c-9b448e07ff70"}''''
      OR lpe.obs @> ''''{"ed9ea061-2e35-41b8-a50f-aa2b30b7fc3c":"04bb1773-c353-44a1-a68c-9b448e07ff70"}''''
      OR lpe.obs @> ''''{"a32eeb3a-a36d-4f82-a02d-d8066c41a5b1":"04bb1773-c353-44a1-a68c-9b448e07ff70"}''''
      OR lpe.obs @> ''''{"c3aceea7-e0f0-46f1-855a-a664ecc4d063":"04bb1773-c353-44a1-a68c-9b448e07ff70"}''''
      OR lpe.obs @> ''''{"5a300ad8-13f3-4d1c-aa2d-6bc36dcb5ff6":"04bb1773-c353-44a1-a68c-9b448e07ff70"}''''
      OR lpe.obs @> ''''{"a53a6c13-8a84-4be5-958b-e07611426fe0":"04bb1773-c353-44a1-a68c-9b448e07ff70"}'''''', ''SELECT
  DISTINCT
  i.uuid  uuid,
  g.name  gender_name,
  a.type  address_type,
  a.title address_name
FROM
  program_encounter pe
  LEFT OUTER JOIN encounter_type et ON et.id = pe.encounter_type_id
  LEFT OUTER JOIN program_enrolment enrolment ON pe.program_enrolment_id = enrolment.id
  LEFT OUTER JOIN program p ON enrolment.program_id = p.id
  LEFT OUTER JOIN individual i ON enrolment.individual_id = i.id
  LEFT OUTER JOIN gender g ON g.id = i.gender_id
  LEFT OUTER JOIN address_level a ON i.address_id = a.id
WHERE p.name = ''''Adolescent'''' AND et.name = ''''Annual Visit'''''')
UNION ALL
SELECT
''Total Adolescents Dropped Out''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''WITH all_program_entire_enrolment AS (
    SELECT
      i.uuid AS                                                 iuuid,
      jsonb_merge(jsonb_agg(e.observations || jsonb_strip_nulls(pe.observations))) obs
    FROM program_encounter pe
      INNER JOIN program_enrolment e ON pe.program_enrolment_id = e.id
      INNER JOIN individual i ON e.individual_id = i.id
      INNER JOIN encounter_type et ON pe.encounter_type_id = et.id
      INNER JOIN program p ON p.id = e.program_id
    WHERE p.name = ''''Adolescent''''
          AND pe.encounter_date_time IS NOT NULL
    GROUP BY i.uuid
)
SELECT
  lpe.iuuid uuid,
  g.name    gender_name,
  a.type    address_type,
  a.title   address_name
FROM all_program_entire_enrolment lpe
  LEFT OUTER JOIN individual i ON i.uuid = lpe.iuuid
  LEFT OUTER JOIN address_level a ON i.address_id = a.id
  LEFT OUTER JOIN gender g ON i.gender_id = g.id
WHERE lpe.obs @> ''''{"575a29c3-a070-4c7d-ac96-fe58b6bddca3":"58f789aa-6570-4aea-87a7-1f7651729c5a"}'''''', ''SELECT
  DISTINCT
  i.uuid  uuid,
  g.name  gender_name,
  a.type  address_type,
  a.title address_name
FROM
  program_encounter pe
  LEFT OUTER JOIN encounter_type et ON et.id = pe.encounter_type_id
  LEFT OUTER JOIN program_enrolment enrolment ON pe.program_enrolment_id = enrolment.id
  LEFT OUTER JOIN program p ON enrolment.program_id = p.id
  LEFT OUTER JOIN individual i ON enrolment.individual_id = i.id
  LEFT OUTER JOIN gender g ON g.id = i.gender_id
  LEFT OUTER JOIN address_level a ON i.address_id = a.id
WHERE p.name = ''''Adolescent'''' AND et.name = ''''Annual Visit'''''')
UNION ALL
SELECT
''Total Adolescents With a Dropout Home Visit''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''SELECT DISTINCT
  i.uuid,
  g.name,
  al.type,
  al.title
FROM program_encounter pe
  INNER JOIN program_enrolment enrolment ON pe.program_enrolment_id = enrolment.id
  INNER JOIN program p ON enrolment.program_id = p.id
  INNER JOIN encounter_type et ON pe.encounter_type_id = et.id
  INNER JOIN individual i ON enrolment.individual_id = i.id
  INNER JOIN gender g ON i.gender_id = g.id
  INNER JOIN address_level al ON i.address_id = al.id
WHERE p.name = ''''Adolescent'''' AND et.name = ''''Dropout Home Visit'''' AND pe.encounter_date_time IS NOT NULL'', ''SELECT
  DISTINCT
  i.uuid  uuid,
  g.name  gender_name,
  a.type  address_type,
  a.title address_name
FROM
  program_encounter pe
  LEFT OUTER JOIN encounter_type et ON et.id = pe.encounter_type_id
  LEFT OUTER JOIN program_enrolment enrolment ON pe.program_enrolment_id = enrolment.id
  LEFT OUTER JOIN program p ON enrolment.program_id = p.id
  LEFT OUTER JOIN individual i ON enrolment.individual_id = i.id
  LEFT OUTER JOIN gender g ON g.id = i.gender_id
  LEFT OUTER JOIN address_level a ON i.address_id = a.id
WHERE p.name = ''''Adolescent'''' AND et.name = ''''Annual Visit'''''')') AS (
rowid TEXT,
"All Female" TEXT,
"All Male" TEXT,
"All Total" TEXT,
"Boarding Female" TEXT,
"Boarding Male" TEXT,
"Boarding Total" TEXT,
"School Female" TEXT,
"School Male" TEXT,
"School Total" TEXT,
"Village Female" TEXT,
"Village Male" TEXT,
"Village Total" TEXT);