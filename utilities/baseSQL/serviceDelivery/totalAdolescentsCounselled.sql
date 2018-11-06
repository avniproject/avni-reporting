WITH all_program_all_encounters AS (
    SELECT
      i.uuid AS                               iuuid,
      jsonb_merge(jsonb_agg(jsonb_strip_nulls(pe.observations))) obs
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
FROM all_program_all_encounters lpe
  LEFT OUTER JOIN individual i ON i.uuid = lpe.iuuid
  LEFT OUTER JOIN address_level_type_view a ON i.address_id = a.id
  LEFT OUTER JOIN gender g ON i.gender_id = g.id
WHERE lpe.obs @> '{"e45d8168-c4a2-427b-85aa-d0f0e8467a8f":"04bb1773-c353-44a1-a68c-9b448e07ff70"}'
      OR lpe.obs @> '{"e31481f1-c719-46dc-b1de-a0f282b33d12":"04bb1773-c353-44a1-a68c-9b448e07ff70"}'
      OR lpe.obs @> '{"6c0ed446-b555-4bb7-90f8-6da6f9827ab9":"04bb1773-c353-44a1-a68c-9b448e07ff70"}'
      OR lpe.obs @> '{"ed9ea061-2e35-41b8-a50f-aa2b30b7fc3c":"04bb1773-c353-44a1-a68c-9b448e07ff70"}'
      OR lpe.obs @> '{"a32eeb3a-a36d-4f82-a02d-d8066c41a5b1":"04bb1773-c353-44a1-a68c-9b448e07ff70"}'
      OR lpe.obs @> '{"c3aceea7-e0f0-46f1-855a-a664ecc4d063":"04bb1773-c353-44a1-a68c-9b448e07ff70"}'
      OR lpe.obs @> '{"5a300ad8-13f3-4d1c-aa2d-6bc36dcb5ff6":"04bb1773-c353-44a1-a68c-9b448e07ff70"}'
      OR lpe.obs @> '{"a53a6c13-8a84-4be5-958b-e07611426fe0":"04bb1773-c353-44a1-a68c-9b448e07ff70"}'