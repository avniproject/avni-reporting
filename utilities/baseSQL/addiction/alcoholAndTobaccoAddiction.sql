WITH latest_program_all_encounters AS (
    SELECT
      i.uuid       AS             iuuid,
      row_number() OVER (PARTITION BY i.uuid, pe.encounter_type_name ORDER BY pe.encounter_date_time desc) rank,
      pe.uuid      AS             euuid
    FROM completed_program_encounter_view pe
      INNER JOIN non_exited_program_enrolment_view e ON pe.program_enrolment_id = e.id
      INNER JOIN individual_view i ON e.individual_id = i.id
    WHERE e.program_name = 'Adolescent'
    GROUP BY i.uuid, pe.encounter_type_name, pe.encounter_date_time, pe.uuid
), latest_program_encounters AS (
    SELECT
      lpae.iuuid                              iuuid,
      jsonb_merge(jsonb_agg(jsonb_strip_nulls(pe.observations))) obs
    FROM latest_program_all_encounters lpae
      INNER JOIN program_encounter pe ON pe.uuid = lpae.euuid
    WHERE lpae.rank = 1
    GROUP BY lpae.iuuid
)
SELECT
  lpe.iuuid uuid,
  i.gender    gender_name,
  i.addresslevel_type   address_type,
  i.addresslevel_name   address_name
FROM latest_program_encounters lpe
  LEFT OUTER JOIN individual_gender_address_view i ON i.uuid = lpe.iuuid
WHERE lpe.obs -> '2ebca9be-3be3-4d11-ada0-187563ff04f8' ?| ARRAY ['246df73a-07d8-4924-8cf9-787dea8278fe']