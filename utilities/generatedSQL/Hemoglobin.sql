SELECT * FROM crosstab('SELECT
''< 7''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''WITH all_program_entire_enrolment AS (
    SELECT
      i.uuid AS                                                                    iuuid,
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
FROM all_program_entire_enrolment lpe
  LEFT OUTER JOIN individual i ON i.uuid = lpe.iuuid
  LEFT OUTER JOIN address_level a ON i.address_id = a.id
  LEFT OUTER JOIN gender g ON i.gender_id = g.id
WHERE cast(lpe.obs ->> ''''f9ecabbc-2df2-4bfc-a6fa-aa417c50e11b'''' AS FLOAT) < 7'', ''SELECT
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
''7.1 - 10.0''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''WITH all_program_entire_enrolment AS (
    SELECT
      i.uuid AS                                                                    iuuid,
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
FROM all_program_entire_enrolment lpe
  LEFT OUTER JOIN individual i ON i.uuid = lpe.iuuid
  LEFT OUTER JOIN address_level a ON i.address_id = a.id
  LEFT OUTER JOIN gender g ON i.gender_id = g.id
WHERE cast(lpe.obs ->> ''''f9ecabbc-2df2-4bfc-a6fa-aa417c50e11b'''' AS FLOAT) > 7
      AND cast(lpe.obs ->> ''''f9ecabbc-2df2-4bfc-a6fa-aa417c50e11b'''' AS FLOAT) <= 10'', ''SELECT
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
''10.1 - 11.9''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''WITH all_program_entire_enrolment AS (
    SELECT
      i.uuid AS                                                                    iuuid,
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
FROM all_program_entire_enrolment lpe
  LEFT OUTER JOIN individual i ON i.uuid = lpe.iuuid
  LEFT OUTER JOIN address_level a ON i.address_id = a.id
  LEFT OUTER JOIN gender g ON i.gender_id = g.id
WHERE cast(lpe.obs ->> ''''f9ecabbc-2df2-4bfc-a6fa-aa417c50e11b'''' AS FLOAT) > 10
      AND cast(lpe.obs ->> ''''f9ecabbc-2df2-4bfc-a6fa-aa417c50e11b'''' AS FLOAT) < 12'', ''SELECT
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
''12''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''WITH all_program_entire_enrolment AS (
    SELECT
      i.uuid AS                                                                    iuuid,
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
FROM all_program_entire_enrolment lpe
  LEFT OUTER JOIN individual i ON i.uuid = lpe.iuuid
  LEFT OUTER JOIN address_level a ON i.address_id = a.id
  LEFT OUTER JOIN gender g ON i.gender_id = g.id
WHERE cast(lpe.obs ->> ''''f9ecabbc-2df2-4bfc-a6fa-aa417c50e11b'''' AS FLOAT) = 12'', ''SELECT
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
''12.1 - 13.0''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''WITH all_program_entire_enrolment AS (
    SELECT
      i.uuid AS                                                                    iuuid,
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
FROM all_program_entire_enrolment lpe
  LEFT OUTER JOIN individual i ON i.uuid = lpe.iuuid
  LEFT OUTER JOIN address_level a ON i.address_id = a.id
  LEFT OUTER JOIN gender g ON i.gender_id = g.id
WHERE cast(lpe.obs ->> ''''f9ecabbc-2df2-4bfc-a6fa-aa417c50e11b'''' AS FLOAT) > 12
      AND cast(lpe.obs ->> ''''f9ecabbc-2df2-4bfc-a6fa-aa417c50e11b'''' AS FLOAT) <= 13'', ''SELECT
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
''> 13''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''WITH all_program_entire_enrolment AS (
    SELECT
      i.uuid AS                                                                    iuuid,
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
FROM all_program_entire_enrolment lpe
  LEFT OUTER JOIN individual i ON i.uuid = lpe.iuuid
  LEFT OUTER JOIN address_level a ON i.address_id = a.id
  LEFT OUTER JOIN gender g ON i.gender_id = g.id
WHERE cast(lpe.obs ->> ''''f9ecabbc-2df2-4bfc-a6fa-aa417c50e11b'''' AS FLOAT) > 13'', ''SELECT
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