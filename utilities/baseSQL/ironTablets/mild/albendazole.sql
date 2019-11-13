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
    AND (pe.encounter_type_name = 'Severe Anemia Followup' or pe.encounter_type_name = 'Quarterly Visit')
    AND pe.observations -> 'a2e181c3-0827-4da2-9121-a59386449823' NOTNULL
    AND pe.observations -> 'cc54cff8-efc5-4246-b9c2-c226361b3798' NOTNULL
    and (e.enrolment_date_time ISNULL OR e.enrolment_date_time between 'FILTERS.start_date' and 'FILTERS.end_date')
)
SELECT i.uuid as uuid,
       i.gender as gender_name,
       i.addresslevel_type as address_type,
       i.addresslevel_name as address_name
FROM individual_program_partitions ip
      JOIN individual_gender_address_view i ON i.uuid = ip.iuuid
WHERE ip.obs ->> 'a2e181c3-0827-4da2-9121-a59386449823' = '04bb1773-c353-44a1-a68c-9b448e07ff70'
  AND ip.obs -> 'cc54cff8-efc5-4246-b9c2-c226361b3798' IS NOT NULL
  AND ip.obs -> 'cc54cff8-efc5-4246-b9c2-c226361b3798' ?| ARRAY ['a576aaa4-228f-47ad-b6e9-8225fd15cf0e']
  AND erank = 1;
