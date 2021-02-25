WITH individual_program_partitions AS (
  SELECT i.uuid          AS                                                                                   iuuid,
         row_number() OVER (PARTITION BY i.uuid ORDER BY pe.encounter_date_time desc) erank,
         pe.uuid         AS                                                                                   euuid,
         pe.observations AS                                                                                   obs,
         pe.encounter_date_time
  FROM completed_program_encounter_view pe
         INNER JOIN non_exited_program_enrolment_view e ON pe.program_enrolment_id = e.id
         INNER JOIN individual_view i ON e.individual_id = i.id
  WHERE e.program_name = 'Adolescent'
    AND (pe.encounter_type_name = 'Annual Visit' or pe.encounter_type_name = 'Quarterly Visit')
    AND pe.observations ->> 'f9ecabbc-2df2-4bfc-a6fa-aa417c50e11b' notnull
    and (e.enrolment_date_time ISNULL OR e.enrolment_date_time between 'FILTERS.start_date' and 'FILTERS.end_date')

),
individual_program_partitions_recieved AS (
  SELECT i.uuid          AS                                                                                   iuuid,
         row_number() OVER (PARTITION BY i.uuid ORDER BY pe.encounter_date_time desc) erank,
         pe.uuid         AS                                                                                   euuid,
         pe.observations AS                                                                                   obs,
         pe.encounter_date_time
  FROM completed_program_encounter_view pe
         INNER JOIN non_exited_program_enrolment_view e ON pe.program_enrolment_id = e.id
         INNER JOIN individual_view i ON e.individual_id = i.id
  WHERE e.program_name = 'Adolescent'
    AND (pe.encounter_type_name = 'Severe Anemia Followup' or pe.encounter_type_name = 'Moderate Anemia Followup')
    AND cast(pe.observations -> '1a750ccd-8330-42b6-b8e1-c383030ca87d' as FLOAT) > 0
    AND cast(pe.observations ->> 'a0fa3ce5-adc6-4c6e-9715-2f8d53b986ca' AS FLOAT) > 0
    and (e.enrolment_date_time ISNULL OR e.enrolment_date_time between 'FILTERS.start_date' and 'FILTERS.end_date')

)
SELECT distinct i.uuid              as uuid,
       i.gender            as gender_name,
       i.addresslevel_type as address_type,
       i.addresslevel_name as address_name
FROM individual_program_partitions ip
       JOIN individual_gender_address_view i ON i.uuid = ip.iuuid
       JOIN individual_program_partitions_recieved r on r.iuuid = ip.iuuid
WHERE cast(ip.obs ->> 'f9ecabbc-2df2-4bfc-a6fa-aa417c50e11b' AS FLOAT) <= 10
  AND cast(r.obs ->> 'a0fa3ce5-adc6-4c6e-9715-2f8d53b986ca' AS FLOAT) between  1 and 10
  AND ip.erank = 1 and r.erank = 1;
