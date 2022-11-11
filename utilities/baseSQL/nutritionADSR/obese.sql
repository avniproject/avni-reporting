WITH agg_data as (
  select uuid,
         individual_id,
         program_enrolment_id,
         encounter_date_time,
         "BMI (kg/m²)"
  from adsr.individual_adolescent_annual_visit_baseline
  where  encounter_date_time is not null
  and "BMI (kg/m²)" is not null
  union all
  select uuid,
         individual_id,
         program_enrolment_id,
         encounter_date_time,
         "BMI (kg/m²)"
  from adsr.individual_adolescent_annual_visit_endline
  where  encounter_date_time is not null
  and "BMI (kg/m²)" is not null

),
  individual_program_partitions AS (
  SELECT i.uuid          AS                                                           iuuid,
           row_number() OVER (PARTITION BY i.uuid ORDER BY pe.encounter_date_time desc) erank,
           pe.uuid         AS                                                           euuid,
pe."BMI (kg/m²)"                                                             obs,
pe.encounter_date_time
FROM agg_data pe
INNER JOIN adsr.individual_adolescent e ON pe.program_enrolment_id = e.id
INNER JOIN adsr.individual i ON e.individual_id = i.id
WHERE e.program_exit_date_time is null
and i.is_voided = false
and pe."BMI (kg/m²)" is not null

)
SELECT  i.uuid              as uuid,
        i.gender            as gender_name,
        alt.name as address_type,
        a.title as address_name,
        obs
        FROM individual_program_partitions ip
JOIN adsr.individual i ON i.uuid = ip.iuuid
JOIN address_level a on a.id = i.address_id
JOIN address_level_type alt on alt.id = a.type_id
WHERE erank = 1 and a.is_voided = false
and obs >= 30
