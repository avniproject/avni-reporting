-- Generated Report
-- Name: Education

SELECT * FROM crosstab('SELECT
''Adolescents who discontinued education''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''SELECT i.uuid as uuid,
       i.gender as gender_name,
       i.addresslevel_type as address_type,
       i.addresslevel_name as address_name
FROM non_exited_enrolment_completed_encounters_agg_view lpe
      JOIN individual_gender_address_view i ON i.id = lpe.individual_id
WHERE lpe.program_name = ''''Adolescent''''
      AND lpe.agg_obs @> ''''{"575a29c3-a070-4c7d-ac96-fe58b6bddca3":"58f789aa-6570-4aea-87a7-1f7651729c5a"}''''
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
''Not interested in studies''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''WITH latest_program_all_encounters AS (
  SELECT
    i.uuid       AS             iuuid,
    row_number() OVER (PARTITION BY i.uuid, pe.encounter_type_name ORDER BY pe.encounter_date_time desc) rank,
    pe.uuid      AS             euuid,
    pe.observations AS          observations
  FROM completed_program_encounter_view pe
         INNER JOIN non_exited_program_enrolment_view e ON pe.program_enrolment_id = e.id
         INNER JOIN individual_view i ON e.individual_id = i.id
  WHERE e.program_name = ''''Adolescent''''
)
SELECT i.uuid              as uuid,
       i.gender            as gender_name,
       i.addresslevel_type as address_type,
       i.addresslevel_name as address_name
FROM latest_program_all_encounters lpe
       LEFT OUTER JOIN individual_gender_address_view i ON i.uuid = lpe.iuuid
WHERE lpe.observations -> ''''c9aceef5-fb03-49ed-a455-bfa603dddb28'''' IS NOT NULL
  AND lpe.observations -> ''''c9aceef5-fb03-49ed-a455-bfa603dddb28'''' ?| ARRAY [''''384bdb12-0761-414e-8459-962aed124ead'''']
  AND rank = 1
'', ''SELECT i.uuid as uuid,
       i.gender as gender_name,
       i.addresslevel_type as address_type,
       i.addresslevel_name as address_name
FROM non_exited_enrolment_completed_encounters_agg_view lpe
      JOIN individual_gender_address_view i ON i.id = lpe.individual_id
WHERE lpe.program_name = ''''Adolescent''''
      AND lpe.agg_obs @> ''''{"575a29c3-a070-4c7d-ac96-fe58b6bddca3":"58f789aa-6570-4aea-87a7-1f7651729c5a"}''''
'')
UNION ALL
SELECT
''Poor Economic Condition''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''WITH latest_program_all_encounters AS (
  SELECT
    i.uuid       AS             iuuid,
    row_number() OVER (PARTITION BY i.uuid, pe.encounter_type_name ORDER BY pe.encounter_date_time desc) rank,
    pe.uuid      AS             euuid,
    pe.observations AS          observations
  FROM completed_program_encounter_view pe
         INNER JOIN non_exited_program_enrolment_view e ON pe.program_enrolment_id = e.id
         INNER JOIN individual_view i ON e.individual_id = i.id
  WHERE e.program_name = ''''Adolescent''''
)
SELECT i.uuid              as uuid,
       i.gender            as gender_name,
       i.addresslevel_type as address_type,
       i.addresslevel_name as address_name
FROM latest_program_all_encounters lpe
       LEFT OUTER JOIN individual_gender_address_view i ON i.uuid = lpe.iuuid
WHERE lpe.observations -> ''''c9aceef5-fb03-49ed-a455-bfa603dddb28'''' IS NOT NULL AND
      lpe.observations -> ''''c9aceef5-fb03-49ed-a455-bfa603dddb28'''' ?| ARRAY [''''0e84adb9-f99a-408d-9a40-44a5d00866a1''''] AND
      rank = 1
'', ''SELECT i.uuid as uuid,
       i.gender as gender_name,
       i.addresslevel_type as address_type,
       i.addresslevel_name as address_name
FROM non_exited_enrolment_completed_encounters_agg_view lpe
      JOIN individual_gender_address_view i ON i.id = lpe.individual_id
WHERE lpe.program_name = ''''Adolescent''''
      AND lpe.agg_obs @> ''''{"575a29c3-a070-4c7d-ac96-fe58b6bddca3":"58f789aa-6570-4aea-87a7-1f7651729c5a"}''''
'')
UNION ALL
SELECT
''Domestic Work''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''WITH latest_program_all_encounters AS (
  SELECT
    i.uuid       AS             iuuid,
    row_number() OVER (PARTITION BY i.uuid, pe.encounter_type_name ORDER BY pe.encounter_date_time desc) rank,
    pe.uuid      AS             euuid,
    pe.observations AS          observations
  FROM completed_program_encounter_view pe
         INNER JOIN non_exited_program_enrolment_view e ON pe.program_enrolment_id = e.id
         INNER JOIN individual_view i ON e.individual_id = i.id
  WHERE e.program_name = ''''Adolescent''''
)
SELECT i.uuid              as uuid,
       i.gender            as gender_name,
       i.addresslevel_type as address_type,
       i.addresslevel_name as address_name
FROM latest_program_all_encounters lpe
       LEFT OUTER JOIN individual_gender_address_view i ON i.uuid = lpe.iuuid
WHERE lpe.observations -> ''''c9aceef5-fb03-49ed-a455-bfa603dddb28'''' IS NOT NULL AND
      lpe.observations -> ''''c9aceef5-fb03-49ed-a455-bfa603dddb28'''' ?| ARRAY [''''5c9520f7-85e3-4859-91c0-5c378821e389''''] AND
      rank = 1
'', ''SELECT i.uuid as uuid,
       i.gender as gender_name,
       i.addresslevel_type as address_type,
       i.addresslevel_name as address_name
FROM non_exited_enrolment_completed_encounters_agg_view lpe
      JOIN individual_gender_address_view i ON i.id = lpe.individual_id
WHERE lpe.program_name = ''''Adolescent''''
      AND lpe.agg_obs @> ''''{"575a29c3-a070-4c7d-ac96-fe58b6bddca3":"58f789aa-6570-4aea-87a7-1f7651729c5a"}''''
'')
UNION ALL
SELECT
''Migration''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''WITH latest_program_all_encounters AS (
  SELECT
    i.uuid       AS             iuuid,
    row_number() OVER (PARTITION BY i.uuid, pe.encounter_type_name ORDER BY pe.encounter_date_time desc) rank,
    pe.uuid      AS             euuid,
    pe.observations AS          observations
  FROM completed_program_encounter_view pe
         INNER JOIN non_exited_program_enrolment_view e ON pe.program_enrolment_id = e.id
         INNER JOIN individual_view i ON e.individual_id = i.id
  WHERE e.program_name = ''''Adolescent''''
)
SELECT i.uuid              as uuid,
       i.gender            as gender_name,
       i.addresslevel_type as address_type,
       i.addresslevel_name as address_name
FROM latest_program_all_encounters lpe
       LEFT OUTER JOIN individual_gender_address_view i ON i.uuid = lpe.iuuid
WHERE lpe.observations -> ''''c9aceef5-fb03-49ed-a455-bfa603dddb28'''' IS NOT NULL AND
      lpe.observations -> ''''c9aceef5-fb03-49ed-a455-bfa603dddb28'''' ?| ARRAY [''''229fac5f-468e-46f0-b812-bdcc56840b6c''''] AND
      rank = 1
'', ''SELECT i.uuid as uuid,
       i.gender as gender_name,
       i.addresslevel_type as address_type,
       i.addresslevel_name as address_name
FROM non_exited_enrolment_completed_encounters_agg_view lpe
      JOIN individual_gender_address_view i ON i.id = lpe.individual_id
WHERE lpe.program_name = ''''Adolescent''''
      AND lpe.agg_obs @> ''''{"575a29c3-a070-4c7d-ac96-fe58b6bddca3":"58f789aa-6570-4aea-87a7-1f7651729c5a"}''''
'')
UNION ALL
SELECT
''Marriage''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''WITH latest_program_all_encounters AS (
  SELECT
    i.uuid       AS             iuuid,
    row_number() OVER (PARTITION BY i.uuid, pe.encounter_type_name ORDER BY pe.encounter_date_time desc) rank,
    pe.uuid      AS             euuid,
    pe.observations AS          observations
  FROM completed_program_encounter_view pe
         INNER JOIN non_exited_program_enrolment_view e ON pe.program_enrolment_id = e.id
         INNER JOIN individual_view i ON e.individual_id = i.id
  WHERE e.program_name = ''''Adolescent''''
)
SELECT i.uuid              as uuid,
       i.gender            as gender_name,
       i.addresslevel_type as address_type,
       i.addresslevel_name as address_name
FROM latest_program_all_encounters lpe
       LEFT OUTER JOIN individual_gender_address_view i ON i.uuid = lpe.iuuid
WHERE lpe.observations -> ''''c9aceef5-fb03-49ed-a455-bfa603dddb28'''' IS NOT NULL AND
      lpe.observations -> ''''c9aceef5-fb03-49ed-a455-bfa603dddb28'''' ?| ARRAY [''''104c7ffb-fb43-45a0-876b-77fba9ee7759''''] AND
      rank = 1
'', ''SELECT i.uuid as uuid,
       i.gender as gender_name,
       i.addresslevel_type as address_type,
       i.addresslevel_name as address_name
FROM non_exited_enrolment_completed_encounters_agg_view lpe
      JOIN individual_gender_address_view i ON i.id = lpe.individual_id
WHERE lpe.program_name = ''''Adolescent''''
      AND lpe.agg_obs @> ''''{"575a29c3-a070-4c7d-ac96-fe58b6bddca3":"58f789aa-6570-4aea-87a7-1f7651729c5a"}''''
'')
UNION ALL
SELECT
''No School in Village''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''WITH latest_program_all_encounters AS (
  SELECT
    i.uuid       AS             iuuid,
    row_number() OVER (PARTITION BY i.uuid, pe.encounter_type_name ORDER BY pe.encounter_date_time desc) rank,
    pe.uuid      AS             euuid,
    pe.observations AS          observations
  FROM completed_program_encounter_view pe
         INNER JOIN non_exited_program_enrolment_view e ON pe.program_enrolment_id = e.id
         INNER JOIN individual_view i ON e.individual_id = i.id
  WHERE e.program_name = ''''Adolescent''''
)
SELECT i.uuid              as uuid,
       i.gender            as gender_name,
       i.addresslevel_type as address_type,
       i.addresslevel_name as address_name
FROM latest_program_all_encounters lpe
       LEFT OUTER JOIN individual_gender_address_view i ON i.uuid = lpe.iuuid
WHERE lpe.observations -> ''''c9aceef5-fb03-49ed-a455-bfa603dddb28'''' IS NOT NULL AND
      lpe.observations -> ''''c9aceef5-fb03-49ed-a455-bfa603dddb28'''' ?| ARRAY [''''af10b937-e9f2-4b9b-8cfe-1d59bc0b21f6''''] AND
      rank = 1
'', ''SELECT i.uuid as uuid,
       i.gender as gender_name,
       i.addresslevel_type as address_type,
       i.addresslevel_name as address_name
FROM non_exited_enrolment_completed_encounters_agg_view lpe
      JOIN individual_gender_address_view i ON i.id = lpe.individual_id
WHERE lpe.program_name = ''''Adolescent''''
      AND lpe.agg_obs @> ''''{"575a29c3-a070-4c7d-ac96-fe58b6bddca3":"58f789aa-6570-4aea-87a7-1f7651729c5a"}''''
'')
UNION ALL
SELECT
''Study Completed''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''WITH latest_program_all_encounters AS (
  SELECT
    i.uuid       AS             iuuid,
    row_number() OVER (PARTITION BY i.uuid, pe.encounter_type_name ORDER BY pe.encounter_date_time desc) rank,
    pe.uuid      AS             euuid,
    pe.observations AS          observations
  FROM completed_program_encounter_view pe
         INNER JOIN non_exited_program_enrolment_view e ON pe.program_enrolment_id = e.id
         INNER JOIN individual_view i ON e.individual_id = i.id
  WHERE e.program_name = ''''Adolescent''''
)
SELECT i.uuid              as uuid,
       i.gender            as gender_name,
       i.addresslevel_type as address_type,
       i.addresslevel_name as address_name
FROM latest_program_all_encounters lpe
       LEFT OUTER JOIN individual_gender_address_view i ON i.uuid = lpe.iuuid
WHERE lpe.observations -> ''''c9aceef5-fb03-49ed-a455-bfa603dddb28'''' IS NOT NULL AND
      lpe.observations -> ''''c9aceef5-fb03-49ed-a455-bfa603dddb28'''' ?| ARRAY [''''b0b6ec77-c8fc-4cd8-8ad0-561cfb73b56b''''] AND
      rank = 1
'', ''SELECT i.uuid as uuid,
       i.gender as gender_name,
       i.addresslevel_type as address_type,
       i.addresslevel_name as address_name
FROM non_exited_enrolment_completed_encounters_agg_view lpe
      JOIN individual_gender_address_view i ON i.id = lpe.individual_id
WHERE lpe.program_name = ''''Adolescent''''
      AND lpe.agg_obs @> ''''{"575a29c3-a070-4c7d-ac96-fe58b6bddca3":"58f789aa-6570-4aea-87a7-1f7651729c5a"}''''
'')
UNION ALL
SELECT
''Other Reason''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''WITH latest_program_all_encounters AS (
  SELECT
    i.uuid       AS             iuuid,
    row_number() OVER (PARTITION BY i.uuid, pe.encounter_type_name ORDER BY pe.encounter_date_time desc) rank,
    pe.uuid      AS             euuid,
    pe.observations AS          observations
  FROM completed_program_encounter_view pe
         INNER JOIN non_exited_program_enrolment_view e ON pe.program_enrolment_id = e.id
         INNER JOIN individual_view i ON e.individual_id = i.id
  WHERE e.program_name = ''''Adolescent''''
)
SELECT i.uuid              as uuid,
       i.gender            as gender_name,
       i.addresslevel_type as address_type,
       i.addresslevel_name as address_name
FROM latest_program_all_encounters lpe
       LEFT OUTER JOIN individual_gender_address_view i ON i.uuid = lpe.iuuid
WHERE lpe.observations -> ''''c9aceef5-fb03-49ed-a455-bfa603dddb28'''' IS NOT NULL AND
      lpe.observations -> ''''c9aceef5-fb03-49ed-a455-bfa603dddb28'''' ?| ARRAY [''''05ea583c-51d2-412d-ad00-06c432ffe538''''] AND
      rank = 1
'', ''SELECT i.uuid as uuid,
       i.gender as gender_name,
       i.addresslevel_type as address_type,
       i.addresslevel_name as address_name
FROM non_exited_enrolment_completed_encounters_agg_view lpe
      JOIN individual_gender_address_view i ON i.id = lpe.individual_id
WHERE lpe.program_name = ''''Adolescent''''
      AND lpe.agg_obs @> ''''{"575a29c3-a070-4c7d-ac96-fe58b6bddca3":"58f789aa-6570-4aea-87a7-1f7651729c5a"}''''
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