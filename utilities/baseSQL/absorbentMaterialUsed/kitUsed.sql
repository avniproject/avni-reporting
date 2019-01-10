WITH all_program_entire_enrolment AS (
    SELECT
      i.uuid AS                                                 iuuid,
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
FROM all_program_entire_enrolment lpe
  LEFT OUTER JOIN individual_gender_address_view i ON i.uuid = lpe.iuuid
WHERE lpe.obs -> '7503cf02-c2e6-440b-a768-8e4cb1df4c68' IS NOT NULL AND
      lpe.obs ->> '7503cf02-c2e6-440b-a768-8e4cb1df4c68' = '04bb1773-c353-44a1-a68c-9b448e07ff70'