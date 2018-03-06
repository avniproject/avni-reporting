SELECT * FROM crosstab('SELECT
  ''Severely Malnourished''                                          rowid,
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
WHERE cast(lpe.obs->>''''7ac0d759-c50d-4971-88e0-84274224c839'''' as float) is not null'')
UNION ALL
SELECT
  ''Malnourished''                                          rowid,
  address_type || '' '' || gender AS                             attribute,
  total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''WITH all_program_entire_enrolment AS (
    SELECT
      i.uuid AS                                                                    iuuid,
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
WHERE cast(lpe.obs ->> ''''7ac0d759-c50d-4971-88e0-84274224c839'''' AS FLOAT) >= 14.5
      AND cast(lpe.obs ->> ''''7ac0d759-c50d-4971-88e0-84274224c839'''' AS FLOAT) <= 18.5'')
UNION ALL
SELECT
  ''Normal''                                          rowid,
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
WHERE cast(lpe.obs->>''''7ac0d759-c50d-4971-88e0-84274224c839'''' as float) > 18.5
      and cast(lpe.obs->>''''7ac0d759-c50d-4971-88e0-84274224c839'''' as float) < 25'')
UNION ALL
SELECT
  ''Overweight''                                          rowid,
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
WHERE cast(lpe.obs->>''''7ac0d759-c50d-4971-88e0-84274224c839'''' as float) > 25
      and cast(lpe.obs->>''''7ac0d759-c50d-4971-88e0-84274224c839'''' as float) < 30'')
UNION ALL
SELECT
  ''Obese''                                          rowid,
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
WHERE cast(lpe.obs->>''''7ac0d759-c50d-4971-88e0-84274224c839'''' as float) >= 30'')') AS (
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