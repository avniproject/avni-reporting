WITH latest_program_all_encounters AS (
  SELECT
    i.uuid       AS             iuuid,
    row_number() OVER (PARTITION BY i.uuid, pe.encounter_type_name ORDER BY pe.encounter_date_time desc) rank,
    pe.uuid      AS             euuid,
    pe.observations AS          observations
  FROM completed_program_encounter_view pe
         INNER JOIN non_exited_program_enrolment_view e ON pe.program_enrolment_id = e.id
         INNER JOIN individual_view i ON e.individual_id = i.id
  WHERE e.program_name = 'Adolescent'
)
SELECT i.uuid              as uuid,
       i.gender            as gender_name,
       i.addresslevel_type as address_type,
       i.addresslevel_name as address_name
FROM latest_program_all_encounters lpe
       LEFT OUTER JOIN individual_gender_address_view i ON i.uuid = lpe.iuuid
WHERE lpe.observations -> 'c9aceef5-fb03-49ed-a455-bfa603dddb28' IS NOT NULL AND
      lpe.observations -> 'c9aceef5-fb03-49ed-a455-bfa603dddb28' ?| ARRAY ['05ea583c-51d2-412d-ad00-06c432ffe538'] AND
      rank = 1
