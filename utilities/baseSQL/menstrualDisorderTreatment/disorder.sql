WITH all_program_entire_enrolment AS (
    SELECT
      i.uuid AS                                                 iuuid,
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
FROM all_program_entire_enrolment lpe
  LEFT OUTER JOIN individual i ON i.uuid = lpe.iuuid
  LEFT OUTER JOIN address_level_type_view a ON i.address_id = a.id
  LEFT OUTER JOIN gender g ON i.gender_id = g.id
WHERE lpe.obs -> '0f87eac1-cf6a-4632-8af2-29a935451fe4' IS NOT NULL AND
      lpe.obs -> '0f87eac1-cf6a-4632-8af2-29a935451fe4' ?| ARRAY ['92ad8878-b476-4291-aa76-3377fa7cf19c',
      '33385edf-93bc-4513-aa03-480ce3bc7b5c', '1c478c50-4761-460c-b33c-a18d0c1500f7',
      '761b7f7a-5db7-4115-aa84-32fcfce5ddfc', '4085f165-ccb8-409b-9d6e-ea7755cf123e',
      'aa30fb91-4b64-438b-b09e-4c7ff2701d71', 'e27f4a35-c2ae-4d05-8930-e19e432221d1',
      'ce47ae12-e61c-49cc-8ccd-715f9d5cb76d']