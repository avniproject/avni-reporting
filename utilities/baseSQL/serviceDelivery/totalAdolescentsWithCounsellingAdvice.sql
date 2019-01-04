WITH all_program_all_encounters AS (
    SELECT
      i.uuid AS                               iuuid,
      jsonb_merge(jsonb_agg(jsonb_strip_nulls(pe.observations))) obs
    FROM completed_program_encounter_view pe
      INNER JOIN non_exited_program_enrolment_view e ON pe.program_enrolment_id = e.id
      INNER JOIN individual_view i ON e.individual_id = i.id
    WHERE e.program_name = 'Adolescent'
    GROUP BY i.uuid
)
SELECT
  lpe.iuuid uuid,
  i.gender    gender_name,
  i.addresslevel_type   address_type,
  i.addresslevel_name   address_name
FROM all_program_all_encounters lpe
  LEFT OUTER JOIN individual_gender_address_view i ON i.uuid = lpe.iuuid
WHERE lpe.obs -> 'e45d8168-c4a2-427b-85aa-d0f0e8467a8f' IS NOT NULL
      OR lpe.obs -> 'e31481f1-c719-46dc-b1de-a0f282b33d12' IS NOT NULL
      OR lpe.obs -> '6c0ed446-b555-4bb7-90f8-6da6f9827ab9' IS NOT NULL
      OR lpe.obs -> 'ed9ea061-2e35-41b8-a50f-aa2b30b7fc3c' IS NOT NULL
      OR lpe.obs -> 'a32eeb3a-a36d-4f82-a02d-d8066c41a5b1' IS NOT NULL
      OR lpe.obs -> 'c3aceea7-e0f0-46f1-855a-a664ecc4d063' IS NOT NULL
      OR lpe.obs -> '5a300ad8-13f3-4d1c-aa2d-6bc36dcb5ff6' IS NOT NULL
      OR lpe.obs -> 'a53a6c13-8a84-4be5-958b-e07611426fe0' IS NOT NULL