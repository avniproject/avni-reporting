-- Generated Report
-- Name: Vulnerabilities

SELECT * FROM crosstab('SELECT
''Vulnerable Adolescents''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''WITH all_program_entire_enrolment AS (
    SELECT
      i.uuid AS                                                  iuuid,
      jsonb_merge(jsonb_agg(jsonb_strip_nulls(pe.observations))) obs
    FROM completed_program_encounter_view pe
      INNER JOIN non_exited_program_enrolment_view e ON pe.program_enrolment_id = e.id
      INNER JOIN individual_view i ON e.individual_id = i.id
    WHERE e.program_name = ''''Adolescent''''
    GROUP BY i.uuid
)
SELECT
  lpe.iuuid uuid,
  i.gender    gender_name,
  i.addresslevel_type   address_type,
  i.addresslevel_name   address_name
FROM all_program_entire_enrolment lpe
  LEFT OUTER JOIN individual_gender_address_view i ON i.uuid = lpe.iuuid
WHERE lpe.obs -> ''''2eb87840-160d-4ee0-bb4c-55dc00c8998a'''' IS NOT NULL AND
      lpe.obs -> ''''2eb87840-160d-4ee0-bb4c-55dc00c8998a'''' ?| ARRAY [''''b5e3310a-7628-40d9-8bb3-961a6c302c84'''',
      ''''f8e3347d-5ffe-496d-9858-5ea8095d7c96'''', ''''4f1c4d88-8d87-4a53-8e3a-1bb163e13b66'''',
      ''''eb6254e5-ed09-43e8-bb0b-a4e7326e0300'''', ''''8b6e4a90-aa59-4f80-acdd-a6f3c71163d9'''']'', ''SELECT
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
''School Dropout''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''WITH all_program_entire_enrolment AS (
    SELECT
      i.uuid AS                                                 iuuid,
      jsonb_merge(jsonb_agg(jsonb_strip_nulls(pe.observations))) obs
    FROM completed_program_encounter_view pe
      INNER JOIN non_exited_program_enrolment_view e ON pe.program_enrolment_id = e.id
      INNER JOIN individual_view i ON e.individual_id = i.id
    WHERE e.program_name = ''''Adolescent''''
    GROUP BY i.uuid
)
SELECT
  lpe.iuuid uuid,
  i.gender    gender_name,
  i.addresslevel_type   address_type,
  i.addresslevel_name   address_name
FROM all_program_entire_enrolment lpe
  LEFT OUTER JOIN individual_gender_address_view i ON i.uuid = lpe.iuuid
WHERE lpe.obs -> ''''2eb87840-160d-4ee0-bb4c-55dc00c8998a'''' IS NOT NULL AND
      lpe.obs -> ''''2eb87840-160d-4ee0-bb4c-55dc00c8998a'''' ?| ARRAY [''''b5e3310a-7628-40d9-8bb3-961a6c302c84'''']'', ''WITH all_program_entire_enrolment AS (
    SELECT
      i.uuid AS                                                  iuuid,
      jsonb_merge(jsonb_agg(jsonb_strip_nulls(pe.observations))) obs
    FROM completed_program_encounter_view pe
      INNER JOIN non_exited_program_enrolment_view e ON pe.program_enrolment_id = e.id
      INNER JOIN individual_view i ON e.individual_id = i.id
    WHERE e.program_name = ''''Adolescent''''
    GROUP BY i.uuid
)
SELECT
  lpe.iuuid uuid,
  i.gender    gender_name,
  i.addresslevel_type   address_type,
  i.addresslevel_name   address_name
FROM all_program_entire_enrolment lpe
  LEFT OUTER JOIN individual_gender_address_view i ON i.uuid = lpe.iuuid
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
    FROM completed_program_encounter_view pe
      INNER JOIN non_exited_program_enrolment_view e ON pe.program_enrolment_id = e.id
      INNER JOIN individual_view i ON e.individual_id = i.id
    WHERE e.program_name = ''''Adolescent''''
    GROUP BY i.uuid
)
SELECT
  lpe.iuuid uuid,
  i.gender    gender_name,
  i.addresslevel_type   address_type,
  i.addresslevel_name   address_name
FROM all_program_entire_enrolment lpe
  LEFT OUTER JOIN individual_gender_address_view i ON i.uuid = lpe.iuuid
WHERE lpe.obs -> ''''2eb87840-160d-4ee0-bb4c-55dc00c8998a'''' IS NOT NULL AND
      lpe.obs -> ''''2eb87840-160d-4ee0-bb4c-55dc00c8998a'''' ?| ARRAY [''''f8e3347d-5ffe-496d-9858-5ea8095d7c96'''']'', ''WITH all_program_entire_enrolment AS (
    SELECT
      i.uuid AS                                                  iuuid,
      jsonb_merge(jsonb_agg(jsonb_strip_nulls(pe.observations))) obs
    FROM completed_program_encounter_view pe
      INNER JOIN non_exited_program_enrolment_view e ON pe.program_enrolment_id = e.id
      INNER JOIN individual_view i ON e.individual_id = i.id
    WHERE e.program_name = ''''Adolescent''''
    GROUP BY i.uuid
)
SELECT
  lpe.iuuid uuid,
  i.gender    gender_name,
  i.addresslevel_type   address_type,
  i.addresslevel_name   address_name
FROM all_program_entire_enrolment lpe
  LEFT OUTER JOIN individual_gender_address_view i ON i.uuid = lpe.iuuid
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
    FROM completed_program_encounter_view pe
      INNER JOIN non_exited_program_enrolment_view e ON pe.program_enrolment_id = e.id
      INNER JOIN individual_view i ON e.individual_id = i.id
    WHERE e.program_name = ''''Adolescent''''
    GROUP BY i.uuid
)
SELECT
  lpe.iuuid uuid,
  i.gender    gender_name,
  i.addresslevel_type   address_type,
  i.addresslevel_name   address_name
FROM all_program_entire_enrolment lpe
  LEFT OUTER JOIN individual_gender_address_view i ON i.uuid = lpe.iuuid
WHERE lpe.obs -> ''''2eb87840-160d-4ee0-bb4c-55dc00c8998a'''' IS NOT NULL AND
      lpe.obs -> ''''2eb87840-160d-4ee0-bb4c-55dc00c8998a'''' ?| ARRAY [''''4f1c4d88-8d87-4a53-8e3a-1bb163e13b66'''']'', ''WITH all_program_entire_enrolment AS (
    SELECT
      i.uuid AS                                                  iuuid,
      jsonb_merge(jsonb_agg(jsonb_strip_nulls(pe.observations))) obs
    FROM completed_program_encounter_view pe
      INNER JOIN non_exited_program_enrolment_view e ON pe.program_enrolment_id = e.id
      INNER JOIN individual_view i ON e.individual_id = i.id
    WHERE e.program_name = ''''Adolescent''''
    GROUP BY i.uuid
)
SELECT
  lpe.iuuid uuid,
  i.gender    gender_name,
  i.addresslevel_type   address_type,
  i.addresslevel_name   address_name
FROM all_program_entire_enrolment lpe
  LEFT OUTER JOIN individual_gender_address_view i ON i.uuid = lpe.iuuid
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
    FROM completed_program_encounter_view pe
      INNER JOIN non_exited_program_enrolment_view e ON pe.program_enrolment_id = e.id
      INNER JOIN individual_view i ON e.individual_id = i.id
    WHERE e.program_name = ''''Adolescent''''
    GROUP BY i.uuid
)
SELECT
  lpe.iuuid uuid,
  i.gender    gender_name,
  i.addresslevel_type   address_type,
  i.addresslevel_name   address_name
FROM all_program_entire_enrolment lpe
  LEFT OUTER JOIN individual_gender_address_view i ON i.uuid = lpe.iuuid
WHERE lpe.obs -> ''''2eb87840-160d-4ee0-bb4c-55dc00c8998a'''' IS NOT NULL AND
      lpe.obs -> ''''2eb87840-160d-4ee0-bb4c-55dc00c8998a'''' ?| ARRAY [''''eb6254e5-ed09-43e8-bb0b-a4e7326e0300'''']'', ''WITH all_program_entire_enrolment AS (
    SELECT
      i.uuid AS                                                  iuuid,
      jsonb_merge(jsonb_agg(jsonb_strip_nulls(pe.observations))) obs
    FROM completed_program_encounter_view pe
      INNER JOIN non_exited_program_enrolment_view e ON pe.program_enrolment_id = e.id
      INNER JOIN individual_view i ON e.individual_id = i.id
    WHERE e.program_name = ''''Adolescent''''
    GROUP BY i.uuid
)
SELECT
  lpe.iuuid uuid,
  i.gender    gender_name,
  i.addresslevel_type   address_type,
  i.addresslevel_name   address_name
FROM all_program_entire_enrolment lpe
  LEFT OUTER JOIN individual_gender_address_view i ON i.uuid = lpe.iuuid
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
    FROM completed_program_encounter_view pe
      INNER JOIN non_exited_program_enrolment_view e ON pe.program_enrolment_id = e.id
      INNER JOIN individual_view i ON e.individual_id = i.id
    WHERE e.program_name = ''''Adolescent''''
    GROUP BY i.uuid
)
SELECT
  lpe.iuuid uuid,
  i.gender    gender_name,
  i.addresslevel_type   address_type,
  i.addresslevel_name   address_name
FROM all_program_entire_enrolment lpe
  LEFT OUTER JOIN individual_gender_address_view i ON i.uuid = lpe.iuuid
WHERE lpe.obs -> ''''2eb87840-160d-4ee0-bb4c-55dc00c8998a'''' IS NOT NULL AND
      lpe.obs -> ''''2eb87840-160d-4ee0-bb4c-55dc00c8998a'''' ?| ARRAY [''''8b6e4a90-aa59-4f80-acdd-a6f3c71163d9'''']'', ''WITH all_program_entire_enrolment AS (
    SELECT
      i.uuid AS                                                  iuuid,
      jsonb_merge(jsonb_agg(jsonb_strip_nulls(pe.observations))) obs
    FROM completed_program_encounter_view pe
      INNER JOIN non_exited_program_enrolment_view e ON pe.program_enrolment_id = e.id
      INNER JOIN individual_view i ON e.individual_id = i.id
    WHERE e.program_name = ''''Adolescent''''
    GROUP BY i.uuid
)
SELECT
  lpe.iuuid uuid,
  i.gender    gender_name,
  i.addresslevel_type   address_type,
  i.addresslevel_name   address_name
FROM all_program_entire_enrolment lpe
  LEFT OUTER JOIN individual_gender_address_view i ON i.uuid = lpe.iuuid
WHERE lpe.obs -> ''''2eb87840-160d-4ee0-bb4c-55dc00c8998a'''' IS NOT NULL AND
      lpe.obs -> ''''2eb87840-160d-4ee0-bb4c-55dc00c8998a'''' ?| ARRAY [''''b5e3310a-7628-40d9-8bb3-961a6c302c84'''',
      ''''f8e3347d-5ffe-496d-9858-5ea8095d7c96'''', ''''4f1c4d88-8d87-4a53-8e3a-1bb163e13b66'''',
      ''''eb6254e5-ed09-43e8-bb0b-a4e7326e0300'''', ''''8b6e4a90-aa59-4f80-acdd-a6f3c71163d9'''']'')') AS (
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