WITH all_program_entire_enrolment AS (
    SELECT
      i.uuid AS                                                 iuuid,
      jsonb_merge(jsonb_agg(e.observations || pe.observations)) obs
    FROM program_encounter pe
      INNER JOIN program_enrolment e ON pe.program_enrolment_id = e.id
      INNER JOIN individual i ON e.individual_id = i.id
      INNER JOIN encounter_type et ON pe.encounter_type_id = et.id
      INNER JOIN program p ON p.id = e.program_id
    WHERE p.name = 'Adolescent'
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
WHERE lpe.obs -> '7f0b8b27-af91-43c8-8b69-49402ba9681c' IS NOT NULL AND
      lpe.obs -> '7f0b8b27-af91-43c8-8b69-49402ba9681c' ?| ARRAY ['0e84adb9-f99a-408d-9a40-44a5d00866a1']