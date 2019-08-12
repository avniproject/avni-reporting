WITH individual_program_partitions AS (
  SELECT i.uuid          AS                                                           iuuid,
         row_number() OVER (PARTITION BY i.uuid ORDER BY pe.encounter_date_time desc) erank,
         pe.uuid         AS                                                           euuid,
         pe.observations AS                                                           obs,
         pe.encounter_date_time
  FROM completed_program_encounter_view pe
         INNER JOIN non_exited_program_enrolment_view e ON pe.program_enrolment_id = e.id
         INNER JOIN individual_view i ON e.individual_id = i.id
  WHERE e.program_name = 'Adolescent'
    AND pe.encounter_type_name = 'Dropout Home Visit'
)
SELECT i.uuid              as uuid,
       i.gender            as gender_name,
       i.addresslevel_type as address_type,
       i.addresslevel_name as address_name
FROM individual_program_partitions ip
       LEFT OUTER JOIN individual_gender_address_view i ON i.uuid = ip.iuuid
WHERE ip.obs -> 'c9aceef5-fb03-49ed-a455-bfa603dddb28' IS NOT NULL
  AND ip.obs -> 'c9aceef5-fb03-49ed-a455-bfa603dddb28' ?| ARRAY ['af10b937-e9f2-4b9b-8cfe-1d59bc0b21f6']
  AND erank = 1
