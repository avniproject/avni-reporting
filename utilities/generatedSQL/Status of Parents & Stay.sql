SELECT * FROM crosstab('SELECT
''Either only mother or father alive''                                          rowid,
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
  LEFT OUTER JOIN address_level_type_view a ON i.address_id = a.id
  LEFT OUTER JOIN gender g ON i.gender_id = g.id
WHERE lpe.obs @> ''''{"9083aae8-0a78-4b5b-9177-dd993e6d088c":"1645d2d8-9dc8-4a6a-ad6c-50b0cca09190"}''''
      OR lpe.obs @> ''''{"9083aae8-0a78-4b5b-9177-dd993e6d088c":"6b384012-b46d-4397-b17e-a0b4fa2e4469"}'''''', ''SELECT
  DISTINCT
  i.uuid  uuid,
  i.gender  gender_name,
  i.addresslevel_type  address_type,
  i.addresslevel_name address_name
FROM
  completed_program_encounter_view pe
  JOIN program_enrolment_view enrolment ON pe.program_enrolment_id = enrolment.id
  JOIN individual_gender_address_view i ON enrolment.individual_id = i.id
WHERE enrolment.program_name = ''''Adolescent'''' AND pe.encounter_type_name = ''''Annual Visit'''''')
UNION ALL
SELECT
''Both parents expired''                                          rowid,
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
  LEFT OUTER JOIN address_level_type_view a ON i.address_id = a.id
  LEFT OUTER JOIN gender g ON i.gender_id = g.id
WHERE lpe.obs @> ''''{"9083aae8-0a78-4b5b-9177-dd993e6d088c":"0e7d6595-6217-4498-aa97-79c2edbb875a"}'''''', ''SELECT
  DISTINCT
  i.uuid  uuid,
  i.gender  gender_name,
  i.addresslevel_type  address_type,
  i.addresslevel_name address_name
FROM
  completed_program_encounter_view pe
  JOIN program_enrolment_view enrolment ON pe.program_enrolment_id = enrolment.id
  JOIN individual_gender_address_view i ON enrolment.individual_id = i.id
WHERE enrolment.program_name = ''''Adolescent'''' AND pe.encounter_type_name = ''''Annual Visit'''''')
UNION ALL
SELECT
''Staying With Parents''                                          rowid,
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
  LEFT OUTER JOIN address_level_type_view a ON i.address_id = a.id
  LEFT OUTER JOIN gender g ON i.gender_id = g.id
WHERE lpe.obs @> ''''{"eb47f6b7-1f64-4008-87f3-a781c7c342cd":"fdad6445-316c-4cb7-a327-332e25469dc7"}'''''', ''SELECT
  DISTINCT
  i.uuid  uuid,
  i.gender  gender_name,
  i.addresslevel_type  address_type,
  i.addresslevel_name address_name
FROM
  completed_program_encounter_view pe
  JOIN program_enrolment_view enrolment ON pe.program_enrolment_id = enrolment.id
  JOIN individual_gender_address_view i ON enrolment.individual_id = i.id
WHERE enrolment.program_name = ''''Adolescent'''' AND pe.encounter_type_name = ''''Annual Visit'''''')
UNION ALL
SELECT
''Staying In Hostel''                                          rowid,
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
  LEFT OUTER JOIN address_level_type_view a ON i.address_id = a.id
  LEFT OUTER JOIN gender g ON i.gender_id = g.id
WHERE lpe.obs @> ''''{"eb47f6b7-1f64-4008-87f3-a781c7c342cd":"b14dc6d9-c724-4005-b407-77b365e8241d"}'''''', ''SELECT
  DISTINCT
  i.uuid  uuid,
  i.gender  gender_name,
  i.addresslevel_type  address_type,
  i.addresslevel_name address_name
FROM
  completed_program_encounter_view pe
  JOIN program_enrolment_view enrolment ON pe.program_enrolment_id = enrolment.id
  JOIN individual_gender_address_view i ON enrolment.individual_id = i.id
WHERE enrolment.program_name = ''''Adolescent'''' AND pe.encounter_type_name = ''''Annual Visit'''''')
UNION ALL
SELECT
''Staying With Relatives''                                          rowid,
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
  LEFT OUTER JOIN address_level_type_view a ON i.address_id = a.id
  LEFT OUTER JOIN gender g ON i.gender_id = g.id
WHERE lpe.obs @> ''''{"eb47f6b7-1f64-4008-87f3-a781c7c342cd":"bf99bcf7-5046-4835-9eb3-6fc5d558d60b"}'''''', ''SELECT
  DISTINCT
  i.uuid  uuid,
  i.gender  gender_name,
  i.addresslevel_type  address_type,
  i.addresslevel_name address_name
FROM
  completed_program_encounter_view pe
  JOIN program_enrolment_view enrolment ON pe.program_enrolment_id = enrolment.id
  JOIN individual_gender_address_view i ON enrolment.individual_id = i.id
WHERE enrolment.program_name = ''''Adolescent'''' AND pe.encounter_type_name = ''''Annual Visit'''''')') AS (
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