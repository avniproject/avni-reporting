SELECT * FROM crosstab('SELECT
''Total Adolescents With Followup Visits''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''SELECT
  i.uuid     uuid,
  i.gender    gender_name,
  i.addresslevel_type   address_type,
  i.addresslevel_name   address_name
FROM program_encounter_view pe
  LEFT OUTER JOIN non_exited_program_enrolment e ON pe.program_enrolment_id = e.id
  LEFT OUTER JOIN individual_gender_address_view i ON e.individual_id = i.id
WHERE pe.encounter_type_name = ''''Dropout Followup Visit'''' AND pe.encounter_type_id IS NOT NULL AND e.program_name = ''''Adolescent''''
GROUP BY i.uuid, i.gender, i.addresslevel_type, i.addresslevel_name
HAVING count(*) > 0;'', ''WITH all_program_entire_enrolment AS (
    SELECT
      i.uuid AS                                                                    iuuid,
      jsonb_merge(jsonb_agg(e.observations || jsonb_strip_nulls(pe.observations))) obs
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
WHERE lpe.obs @> ''''{"dcfc771a-0785-43be-bcb1-0d2755793e0e":"28e76608-dddd-4914-bd44-3689eccfa5ca"}''''
      OR lpe.obs @> ''''{"dcfc771a-0785-43be-bcb1-0d2755793e0e":"9715936e-03f2-44da-900f-33588fe95250"}'''';'')
UNION ALL
SELECT
''1 Visit''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''SELECT
  i.uuid     uuid,
  i.gender    gender_name,
  i.addresslevel_type   address_type,
  i.addresslevel_name   address_name
FROM program_encounter_view pe
  LEFT OUTER JOIN non_exited_program_enrolment e ON pe.program_enrolment_id = e.id
  LEFT OUTER JOIN individual_gender_address_view i ON e.individual_id = i.id
WHERE pe.encounter_type_name = ''''Dropout Followup Visit'''' AND pe.encounter_type_id IS NOT NULL AND e.program_name = ''''Adolescent''''
GROUP BY i.uuid, i.gender, i.addresslevel_type, i.addresslevel_name
HAVING count(*) = 1;'', ''WITH all_program_entire_enrolment AS (
    SELECT
      i.uuid AS                                                                    iuuid,
      jsonb_merge(jsonb_agg(e.observations || jsonb_strip_nulls(pe.observations))) obs
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
WHERE lpe.obs @> ''''{"dcfc771a-0785-43be-bcb1-0d2755793e0e":"28e76608-dddd-4914-bd44-3689eccfa5ca"}''''
      OR lpe.obs @> ''''{"dcfc771a-0785-43be-bcb1-0d2755793e0e":"9715936e-03f2-44da-900f-33588fe95250"}'''';'')
UNION ALL
SELECT
''2 Visit''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''SELECT
  i.uuid     uuid,
  i.gender    gender_name,
  i.addresslevel_type   address_type,
  i.addresslevel_name   address_name
FROM program_encounter_view pe
  LEFT OUTER JOIN non_exited_program_enrolment e ON pe.program_enrolment_id = e.id
  LEFT OUTER JOIN individual_gender_address_view i ON e.individual_id = i.id
WHERE pe.encounter_type_name = ''''Dropout Followup Visit'''' AND pe.encounter_type_id IS NOT NULL AND e.program_name = ''''Adolescent''''
GROUP BY i.uuid, i.gender, i.addresslevel_type, i.addresslevel_name
HAVING count(*) = 2;'', ''WITH all_program_entire_enrolment AS (
    SELECT
      i.uuid AS                                                                    iuuid,
      jsonb_merge(jsonb_agg(e.observations || jsonb_strip_nulls(pe.observations))) obs
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
WHERE lpe.obs @> ''''{"dcfc771a-0785-43be-bcb1-0d2755793e0e":"28e76608-dddd-4914-bd44-3689eccfa5ca"}''''
      OR lpe.obs @> ''''{"dcfc771a-0785-43be-bcb1-0d2755793e0e":"9715936e-03f2-44da-900f-33588fe95250"}'''';'')
UNION ALL
SELECT
''3 Visit''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''SELECT
  i.uuid     uuid,
  i.gender    gender_name,
  i.addresslevel_type   address_type,
  i.addresslevel_name   address_name
FROM program_encounter_view pe
  LEFT OUTER JOIN non_exited_program_enrolment e ON pe.program_enrolment_id = e.id
  LEFT OUTER JOIN individual_gender_address_view i ON e.individual_id = i.id
WHERE pe.encounter_type_name = ''''Dropout Followup Visit'''' AND pe.encounter_type_id IS NOT NULL AND e.program_name = ''''Adolescent''''
GROUP BY i.uuid, i.gender, i.addresslevel_type, i.addresslevel_name
HAVING count(*) = 3;'', ''WITH all_program_entire_enrolment AS (
    SELECT
      i.uuid AS                                                                    iuuid,
      jsonb_merge(jsonb_agg(e.observations || jsonb_strip_nulls(pe.observations))) obs
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
WHERE lpe.obs @> ''''{"dcfc771a-0785-43be-bcb1-0d2755793e0e":"28e76608-dddd-4914-bd44-3689eccfa5ca"}''''
      OR lpe.obs @> ''''{"dcfc771a-0785-43be-bcb1-0d2755793e0e":"9715936e-03f2-44da-900f-33588fe95250"}'''';'')
UNION ALL
SELECT
''4 Visit''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''SELECT
  i.uuid     uuid,
  i.gender    gender_name,
  i.addresslevel_type   address_type,
  i.addresslevel_name   address_name
FROM program_encounter_view pe
  LEFT OUTER JOIN non_exited_program_enrolment e ON pe.program_enrolment_id = e.id
  LEFT OUTER JOIN individual_gender_address_view i ON e.individual_id = i.id
WHERE pe.encounter_type_name = ''''Dropout Followup Visit'''' AND pe.encounter_type_id IS NOT NULL AND e.program_name = ''''Adolescent''''
GROUP BY i.uuid, i.gender, i.addresslevel_type, i.addresslevel_name
HAVING count(*) = 4;'', ''WITH all_program_entire_enrolment AS (
    SELECT
      i.uuid AS                                                                    iuuid,
      jsonb_merge(jsonb_agg(e.observations || jsonb_strip_nulls(pe.observations))) obs
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
WHERE lpe.obs @> ''''{"dcfc771a-0785-43be-bcb1-0d2755793e0e":"28e76608-dddd-4914-bd44-3689eccfa5ca"}''''
      OR lpe.obs @> ''''{"dcfc771a-0785-43be-bcb1-0d2755793e0e":"9715936e-03f2-44da-900f-33588fe95250"}'''';'')
UNION ALL
SELECT
''5 Visit''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''SELECT
  i.uuid     uuid,
  i.gender    gender_name,
  i.addresslevel_type   address_type,
  i.addresslevel_name   address_name
FROM program_encounter_view pe
  LEFT OUTER JOIN non_exited_program_enrolment e ON pe.program_enrolment_id = e.id
  LEFT OUTER JOIN individual_gender_address_view i ON e.individual_id = i.id
WHERE pe.encounter_type_name = ''''Dropout Followup Visit'''' AND pe.encounter_type_id IS NOT NULL AND e.program_name = ''''Adolescent''''
GROUP BY i.uuid, i.gender, i.addresslevel_type, i.addresslevel_name
HAVING count(*) = 5;'', ''WITH all_program_entire_enrolment AS (
    SELECT
      i.uuid AS                                                                    iuuid,
      jsonb_merge(jsonb_agg(e.observations || jsonb_strip_nulls(pe.observations))) obs
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
WHERE lpe.obs @> ''''{"dcfc771a-0785-43be-bcb1-0d2755793e0e":"28e76608-dddd-4914-bd44-3689eccfa5ca"}''''
      OR lpe.obs @> ''''{"dcfc771a-0785-43be-bcb1-0d2755793e0e":"9715936e-03f2-44da-900f-33588fe95250"}'''';'')') AS (
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