SELECT * FROM crosstab('SELECT
''Total Adolescents With Followup Visits''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''SELECT
  i.uuid     uuid,
  g.name  AS gender,
  a.type  AS address_type,
  a.title AS address_name
FROM program_encounter pe
  LEFT OUTER JOIN program_enrolment e ON pe.program_enrolment_id = e.id
  LEFT OUTER JOIN program p ON e.program_id = p.id
  LEFT OUTER JOIN encounter_type et ON pe.encounter_type_id = et.id
  LEFT OUTER JOIN individual i ON e.individual_id = i.id
  LEFT OUTER JOIN gender g ON i.gender_id = g.id
  LEFT OUTER JOIN address_level a ON i.address_id = a.id
WHERE et.name = ''''Dropout Followup Visit'''' AND et.id IS NOT NULL AND p.name = ''''Adolescent''''
GROUP BY i.uuid, g.name, a.type, a.title
HAVING count(*) > 0;'', ''WITH all_program_entire_enrolment AS (
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
WHERE lpe.obs @> ''''{"dcfc771a-0785-43be-bcb1-0d2755793e0e":"28e76608-dddd-4914-bd44-3689eccfa5ca"}''''
      OR lpe.obs @> ''''{"dcfc771a-0785-43be-bcb1-0d2755793e0e":"9715936e-03f2-44da-900f-33588fe95250"}'''';'')
UNION ALL
SELECT
''1 Visit''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''SELECT
  i.uuid     uuid,
  g.name  AS gender,
  a.type  AS address_type,
  a.title AS address_name
FROM program_encounter pe
  LEFT OUTER JOIN program_enrolment e ON pe.program_enrolment_id = e.id
  LEFT OUTER JOIN program p ON e.program_id = p.id
  LEFT OUTER JOIN encounter_type et ON pe.encounter_type_id = et.id
  LEFT OUTER JOIN individual i ON e.individual_id = i.id
  LEFT OUTER JOIN gender g ON i.gender_id = g.id
  LEFT OUTER JOIN address_level a ON i.address_id = a.id
WHERE et.name = ''''Dropout Followup Visit'''' AND et.id IS NOT NULL AND p.name = ''''Adolescent''''
GROUP BY i.uuid, g.name, a.type, a.title
HAVING count(*) = 1;'', ''WITH all_program_entire_enrolment AS (
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
WHERE lpe.obs @> ''''{"dcfc771a-0785-43be-bcb1-0d2755793e0e":"28e76608-dddd-4914-bd44-3689eccfa5ca"}''''
      OR lpe.obs @> ''''{"dcfc771a-0785-43be-bcb1-0d2755793e0e":"9715936e-03f2-44da-900f-33588fe95250"}'''';'')
UNION ALL
SELECT
''2 Visit''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''SELECT
  i.uuid     uuid,
  g.name  AS gender,
  a.type  AS address_type,
  a.title AS address_name
FROM program_encounter pe
  LEFT OUTER JOIN program_enrolment e ON pe.program_enrolment_id = e.id
  LEFT OUTER JOIN program p ON e.program_id = p.id
  LEFT OUTER JOIN encounter_type et ON pe.encounter_type_id = et.id
  LEFT OUTER JOIN individual i ON e.individual_id = i.id
  LEFT OUTER JOIN gender g ON i.gender_id = g.id
  LEFT OUTER JOIN address_level a ON i.address_id = a.id
WHERE et.name = ''''Dropout Followup Visit'''' AND et.id IS NOT NULL AND p.name = ''''Adolescent''''
GROUP BY i.uuid, g.name, a.type, a.title
HAVING count(*) = 2;'', ''WITH all_program_entire_enrolment AS (
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
WHERE lpe.obs @> ''''{"dcfc771a-0785-43be-bcb1-0d2755793e0e":"28e76608-dddd-4914-bd44-3689eccfa5ca"}''''
      OR lpe.obs @> ''''{"dcfc771a-0785-43be-bcb1-0d2755793e0e":"9715936e-03f2-44da-900f-33588fe95250"}'''';'')
UNION ALL
SELECT
''3 Visit''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''SELECT
  i.uuid     uuid,
  g.name  AS gender,
  a.type  AS address_type,
  a.title AS address_name
FROM program_encounter pe
  LEFT OUTER JOIN program_enrolment e ON pe.program_enrolment_id = e.id
  LEFT OUTER JOIN program p ON e.program_id = p.id
  LEFT OUTER JOIN encounter_type et ON pe.encounter_type_id = et.id
  LEFT OUTER JOIN individual i ON e.individual_id = i.id
  LEFT OUTER JOIN gender g ON i.gender_id = g.id
  LEFT OUTER JOIN address_level a ON i.address_id = a.id
WHERE et.name = ''''Dropout Followup Visit'''' AND et.id IS NOT NULL AND p.name = ''''Adolescent''''
GROUP BY i.uuid, g.name, a.type, a.title
HAVING count(*) = 3;'', ''WITH all_program_entire_enrolment AS (
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
WHERE lpe.obs @> ''''{"dcfc771a-0785-43be-bcb1-0d2755793e0e":"28e76608-dddd-4914-bd44-3689eccfa5ca"}''''
      OR lpe.obs @> ''''{"dcfc771a-0785-43be-bcb1-0d2755793e0e":"9715936e-03f2-44da-900f-33588fe95250"}'''';'')
UNION ALL
SELECT
''4 Visit''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''SELECT
  i.uuid     uuid,
  g.name  AS gender,
  a.type  AS address_type,
  a.title AS address_name
FROM program_encounter pe
  LEFT OUTER JOIN program_enrolment e ON pe.program_enrolment_id = e.id
  LEFT OUTER JOIN program p ON e.program_id = p.id
  LEFT OUTER JOIN encounter_type et ON pe.encounter_type_id = et.id
  LEFT OUTER JOIN individual i ON e.individual_id = i.id
  LEFT OUTER JOIN gender g ON i.gender_id = g.id
  LEFT OUTER JOIN address_level a ON i.address_id = a.id
WHERE et.name = ''''Dropout Followup Visit'''' AND et.id IS NOT NULL AND p.name = ''''Adolescent''''
GROUP BY i.uuid, g.name, a.type, a.title
HAVING count(*) = 4;'', ''WITH all_program_entire_enrolment AS (
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
WHERE lpe.obs @> ''''{"dcfc771a-0785-43be-bcb1-0d2755793e0e":"28e76608-dddd-4914-bd44-3689eccfa5ca"}''''
      OR lpe.obs @> ''''{"dcfc771a-0785-43be-bcb1-0d2755793e0e":"9715936e-03f2-44da-900f-33588fe95250"}'''';'')
UNION ALL
SELECT
''5 Visit''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''SELECT
  i.uuid     uuid,
  g.name  AS gender,
  a.type  AS address_type,
  a.title AS address_name
FROM program_encounter pe
  LEFT OUTER JOIN program_enrolment e ON pe.program_enrolment_id = e.id
  LEFT OUTER JOIN program p ON e.program_id = p.id
  LEFT OUTER JOIN encounter_type et ON pe.encounter_type_id = et.id
  LEFT OUTER JOIN individual i ON e.individual_id = i.id
  LEFT OUTER JOIN gender g ON i.gender_id = g.id
  LEFT OUTER JOIN address_level a ON i.address_id = a.id
WHERE et.name = ''''Dropout Followup Visit'''' AND et.id IS NOT NULL AND p.name = ''''Adolescent''''
GROUP BY i.uuid, g.name, a.type, a.title
HAVING count(*) = 5;'', ''WITH all_program_entire_enrolment AS (
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
WHERE lpe.obs @> ''''{"dcfc771a-0785-43be-bcb1-0d2755793e0e":"28e76608-dddd-4914-bd44-3689eccfa5ca"}''''
      OR lpe.obs @> ''''{"dcfc771a-0785-43be-bcb1-0d2755793e0e":"9715936e-03f2-44da-900f-33588fe95250"}'''';'')') AS (
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