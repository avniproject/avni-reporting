WITH latest_program_all_encounters AS (
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
    WHERE p.name = 'Adolescent'
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
WHERE lpe.obs -> '2ebca9be-3be3-4d11-ada0-187563ff04f8' ?| ARRAY ['92654fda-d485-4b6d-97c5-8a8fe2a9582a']