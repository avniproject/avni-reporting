WITH individual_program_partitions AS (
  SELECT i.uuid          AS                                                                                   iuuid,
         row_number() OVER (PARTITION BY i.uuid, pe.encounter_type_name ORDER BY pe.encounter_date_time desc) erank,
         pe.uuid         AS                                                                                   euuid,
         pe.observations AS                                                                                   obs,
         pe.encounter_date_time
  FROM completed_program_encounter_view pe
         INNER JOIN non_exited_program_enrolment_view e ON pe.program_enrolment_id = e.id
         INNER JOIN individual_view i ON e.individual_id = i.id
  WHERE e.program_name = 'Adolescent'
    and (pe.encounter_type_name = 'Annual Visit' or pe.encounter_type_name = 'Quarterly Visit')
)
SELECT ip.iuuid            uuid,
       i.gender            gender_name,
       i.addresslevel_type address_type,
       i.addresslevel_name address_name
FROM individual_program_partitions ip
       LEFT OUTER JOIN individual_gender_address_view i ON i.uuid = ip.iuuid
WHERE (ip.obs -> '0361d3b7-1187-414b-acb1-ed1da58e4e44' IS NOT NULL
  AND ip.obs -> '0361d3b7-1187-414b-acb1-ed1da58e4e44' ?| ARRAY ['48689220-7064-4a73-90c4-b8857445a0c8'])
  OR  (ip.obs -> '49b70138-ea65-45ee-8f3f-676bb8a1f8d3' IS NOT NULL
  AND ip.obs -> '49b70138-ea65-45ee-8f3f-676bb8a1f8d3' ?| ARRAY ['48689220-7064-4a73-90c4-b8857445a0c8'])
  AND erank = 1
