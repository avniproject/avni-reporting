SELECT * FROM crosstab('SELECT
''Vulnerable Adolescents''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''WITH all_program_entire_enrolment AS (
    SELECT
      i.uuid AS                                                  iuuid,
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
WHERE lpe.obs -> ''''2eb87840-160d-4ee0-bb4c-55dc00c8998a'''' IS NOT NULL AND
      lpe.obs -> ''''2eb87840-160d-4ee0-bb4c-55dc00c8998a'''' ?| ARRAY [''''b5e3310a-7628-40d9-8bb3-961a6c302c84'''',
      ''''f8e3347d-5ffe-496d-9858-5ea8095d7c96'''', ''''4f1c4d88-8d87-4a53-8e3a-1bb163e13b66'''',
      ''''eb6254e5-ed09-43e8-bb0b-a4e7326e0300'''', ''''8b6e4a90-aa59-4f80-acdd-a6f3c71163d9'''']'', ''SELECT
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
''School Dropout''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''WITH all_program_entire_enrolment AS (
    SELECT
      i.uuid AS                                                 iuuid,
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
WHERE lpe.obs -> ''''2eb87840-160d-4ee0-bb4c-55dc00c8998a'''' IS NOT NULL AND
      lpe.obs -> ''''2eb87840-160d-4ee0-bb4c-55dc00c8998a'''' ?| ARRAY [''''b5e3310a-7628-40d9-8bb3-961a6c302c84'''']'', ''WITH all_program_entire_enrolment AS (
    SELECT
      i.uuid AS                                                  iuuid,
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
WHERE lpe.obs -> ''''2eb87840-160d-4ee0-bb4c-55dc00c8998a'''' IS NOT NULL AND
      lpe.obs -> ''''2eb87840-160d-4ee0-bb4c-55dc00c8998a'''' ?| ARRAY [''''b5e3310a-7628-40d9-8bb3-961a6c302c84'''',
      ''''f8e3347d-5ffe-496d-9858-5ea8095d7c96'''', ''''4f1c4d88-8d87-4a53-8e3a-1bb163e13b66'''',
      ''''eb6254e5-ed09-43e8-bb0b-a4e7326e0300'''', ''''8b6e4a90-aa59-4f80-acdd-a6f3c71163d9'''']'')
UNION ALL
SELECT
''Addiction''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''WITH all_program_entire_enrolment AS (
    SELECT
      i.uuid AS                                                 iuuid,
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
WHERE lpe.obs -> ''''2eb87840-160d-4ee0-bb4c-55dc00c8998a'''' IS NOT NULL AND
      lpe.obs -> ''''2eb87840-160d-4ee0-bb4c-55dc00c8998a'''' ?| ARRAY [''''f8e3347d-5ffe-496d-9858-5ea8095d7c96'''']'', ''WITH all_program_entire_enrolment AS (
    SELECT
      i.uuid AS                                                  iuuid,
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
WHERE lpe.obs -> ''''2eb87840-160d-4ee0-bb4c-55dc00c8998a'''' IS NOT NULL AND
      lpe.obs -> ''''2eb87840-160d-4ee0-bb4c-55dc00c8998a'''' ?| ARRAY [''''b5e3310a-7628-40d9-8bb3-961a6c302c84'''',
      ''''f8e3347d-5ffe-496d-9858-5ea8095d7c96'''', ''''4f1c4d88-8d87-4a53-8e3a-1bb163e13b66'''',
      ''''eb6254e5-ed09-43e8-bb0b-a4e7326e0300'''', ''''8b6e4a90-aa59-4f80-acdd-a6f3c71163d9'''']'')
UNION ALL
SELECT
''Early Pregnancy and RTI''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''WITH all_program_entire_enrolment AS (
    SELECT
      i.uuid AS                                                 iuuid,
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
WHERE lpe.obs -> ''''2eb87840-160d-4ee0-bb4c-55dc00c8998a'''' IS NOT NULL AND
      lpe.obs -> ''''2eb87840-160d-4ee0-bb4c-55dc00c8998a'''' ?| ARRAY [''''4f1c4d88-8d87-4a53-8e3a-1bb163e13b66'''']'', ''WITH all_program_entire_enrolment AS (
    SELECT
      i.uuid AS                                                  iuuid,
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
WHERE lpe.obs -> ''''2eb87840-160d-4ee0-bb4c-55dc00c8998a'''' IS NOT NULL AND
      lpe.obs -> ''''2eb87840-160d-4ee0-bb4c-55dc00c8998a'''' ?| ARRAY [''''b5e3310a-7628-40d9-8bb3-961a6c302c84'''',
      ''''f8e3347d-5ffe-496d-9858-5ea8095d7c96'''', ''''4f1c4d88-8d87-4a53-8e3a-1bb163e13b66'''',
      ''''eb6254e5-ed09-43e8-bb0b-a4e7326e0300'''', ''''8b6e4a90-aa59-4f80-acdd-a6f3c71163d9'''']'')
UNION ALL
SELECT
''Early Marriage''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''WITH all_program_entire_enrolment AS (
    SELECT
      i.uuid AS                                                 iuuid,
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
WHERE lpe.obs -> ''''2eb87840-160d-4ee0-bb4c-55dc00c8998a'''' IS NOT NULL AND
      lpe.obs -> ''''2eb87840-160d-4ee0-bb4c-55dc00c8998a'''' ?| ARRAY [''''eb6254e5-ed09-43e8-bb0b-a4e7326e0300'''']'', ''WITH all_program_entire_enrolment AS (
    SELECT
      i.uuid AS                                                  iuuid,
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
WHERE lpe.obs -> ''''2eb87840-160d-4ee0-bb4c-55dc00c8998a'''' IS NOT NULL AND
      lpe.obs -> ''''2eb87840-160d-4ee0-bb4c-55dc00c8998a'''' ?| ARRAY [''''b5e3310a-7628-40d9-8bb3-961a6c302c84'''',
      ''''f8e3347d-5ffe-496d-9858-5ea8095d7c96'''', ''''4f1c4d88-8d87-4a53-8e3a-1bb163e13b66'''',
      ''''eb6254e5-ed09-43e8-bb0b-a4e7326e0300'''', ''''8b6e4a90-aa59-4f80-acdd-a6f3c71163d9'''']'')
UNION ALL
SELECT
''Road Traffic Accident''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''WITH all_program_entire_enrolment AS (
    SELECT
      i.uuid AS                                                  iuuid,
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
WHERE lpe.obs -> ''''2eb87840-160d-4ee0-bb4c-55dc00c8998a'''' IS NOT NULL AND
      lpe.obs -> ''''2eb87840-160d-4ee0-bb4c-55dc00c8998a'''' ?| ARRAY [''''8b6e4a90-aa59-4f80-acdd-a6f3c71163d9'''']'', ''WITH all_program_entire_enrolment AS (
    SELECT
      i.uuid AS                                                  iuuid,
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
WHERE lpe.obs -> ''''2eb87840-160d-4ee0-bb4c-55dc00c8998a'''' IS NOT NULL AND
      lpe.obs -> ''''2eb87840-160d-4ee0-bb4c-55dc00c8998a'''' ?| ARRAY [''''b5e3310a-7628-40d9-8bb3-961a6c302c84'''',
      ''''f8e3347d-5ffe-496d-9858-5ea8095d7c96'''', ''''4f1c4d88-8d87-4a53-8e3a-1bb163e13b66'''',
      ''''eb6254e5-ed09-43e8-bb0b-a4e7326e0300'''', ''''8b6e4a90-aa59-4f80-acdd-a6f3c71163d9'''']'')') AS (
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