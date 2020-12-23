WITH individual_program_partitions AS (
  SELECT i.uuid          AS                                                           iuuid,
        i.id iid,
         row_number() OVER (PARTITION BY i.uuid ORDER BY pe.encounter_date_time desc) erank,
         pe.uuid         AS                                                           euuid,
         pe.observations AS                                                           obs,
         pe.encounter_date_time
  FROM completed_program_encounter_view pe
         INNER JOIN non_exited_program_enrolment_view e ON pe.program_enrolment_id = e.id
         INNER JOIN individual_view i ON e.individual_id = i.id
  WHERE e.program_name = ''Adolescent''
    AND ( pe.encounter_type_name = ''Quarterly Visit''
    OR pe.encounter_type_name = ''Annual Visit''
     OR pe.encounter_type_name = ''Endline Visit'')

),
individual_dropout_partitions AS (
SELECT i.uuid          AS                                                           iuuid,
         row_number() OVER (PARTITION BY i.uuid ORDER BY pe.encounter_date_time desc) eranks,
         pe.uuid         AS                                                           euuid,
         pe.observations AS                                                           obs,
         pe.encounter_date_time dropout_date_time
  FROM program_encounter_view pe
         INNER JOIN non_exited_program_enrolment_view e ON pe.program_enrolment_id = e.id
         INNER JOIN individual_view i ON e.individual_id = i.id
  WHERE e.program_name = ''Adolescent''
    AND pe.encounter_type_name = ''Dropout Home Visit''

)
SELECT i.uuid              as uuid,
       i.gender            as gender_name,
       i.addresslevel_type as address_type,
       i.addresslevel_name as address_name
FROM individual_program_partitions ip
        LEFT OUTER JOIN individual_dropout_partitions drop on drop.iuuid = ip.iuuid
        LEFT OUTER JOIN individual_gender_address_view i ON i.uuid = ip.iuuid
WHERE (dropout_date_time is null or drop.obs -> ''c9aceef5-fb03-49ed-a455-bfa603dddb28'' IS NULL) and
   ip.obs ->> ''575a29c3-a070-4c7d-ac96-fe58b6bddca3'' = ''58f789aa-6570-4aea-87a7-1f7651729c5a''
  AND erank = 1 and eranks =1