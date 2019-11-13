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
    AND pe.observations -> '2973890d-0142-41a6-a6f5-988e7eb36d79' NOTNULL
    AND pe.observations -> 'cc54cff8-efc5-4246-b9c2-c226361b3798' NOTNULL
    and (e.enrolment_date_time ISNULL OR e.enrolment_date_time between 'FILTERS.start_date' and 'FILTERS.end_date')
)
SELECT i.uuid              as uuid,
       i.gender            as gender_name,
       i.addresslevel_type as address_type,
       i.addresslevel_name as address_name
FROM individual_program_partitions ip
       JOIN individual_gender_address_view i ON i.uuid = ip.iuuid
WHERE ip.obs ->> '2973890d-0142-41a6-a6f5-988e7eb36d79' = '04bb1773-c353-44a1-a68c-9b448e07ff70'
  AND ip.obs -> 'cc54cff8-efc5-4246-b9c2-c226361b3798' IS NOT NULL
  AND ip.obs -> 'cc54cff8-efc5-4246-b9c2-c226361b3798' ?| ARRAY ['8d9b69e1-9efe-410f-8063-71767b6482f6']
  AND erank = 1;
