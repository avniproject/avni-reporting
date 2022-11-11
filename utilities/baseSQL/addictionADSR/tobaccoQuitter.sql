WITH agg_data as (
  select uuid,
         individual_id,
         program_enrolment_id,
         encounter_date_time,
         "Do you have any addiction"
  from adsr.individual_adolescent_annual_visit_baseline
  where  encounter_date_time is not null
  union all
  select uuid,
         individual_id,
         program_enrolment_id,
         encounter_date_time,
         "Do you have any addiction"
  from adsr.individual_adolescent_annual_visit_endline
  where  encounter_date_time is not null
  union all
  select uuid,
         individual_id,
         program_enrolment_id,
         encounter_date_time,
         "Do you have any addiction"
  from adsr.individual_adolescent_severe_malnutrition_followup
  where  encounter_date_time is not null
),
  individual_program_partitions AS (
  SELECT i.uuid          AS                                                           iuuid,
           row_number() OVER (PARTITION BY i.uuid ORDER BY pe.encounter_date_time desc) erank,
           pe.uuid         AS                                                           euuid,
pe."Do you have any addiction" AS                                                           obs,
pe.encounter_date_time
FROM agg_data pe
INNER JOIN adsr.individual_adolescent e ON pe.program_enrolment_id = e.id
INNER JOIN adsr.individual i ON e.individual_id = i.id
INNER JOIN address_level a ON a.id = i.address_id
WHERE pe."Do you have any addiction" is not null
and e.program_exit_date_time is null
[[ and e.enrolment_date_time >=(q1 || q4 || quote_literal({{ start_date }}) || q4 || q1  ::DATE)]]
[[and e.enrolment_date_time <=q1 || q4 || quote_literal({{end_date}}) || q4 || q1 ::DATE]]
[[and a.title = q1 || q4 || quote_literal({{title}}) || q4 || q1]]
),
tobacco_takers as (SELECT ip.iuuid               iuuid,
                               ip.encounter_date_time encounter_date_time
                        FROM individual_program_partitions ip
                                 LEFT OUTER JOIN adsr.individual i ON i.uuid = ip.iuuid
                        WHERE obs = 'Tobacco'
                          AND erank = 1)

SELECT tt.iuuid            uuid,
       i.gender            gender_name,
       alt.name address_type,
       a.title address_name
FROM adsr.individual_adolescent_addiction_followup pe
INNER JOIN adsr.individual_adolescent e ON pe.program_enrolment_id = e.id
INNER JOIN adsr.individual i ON i.id = e.individual_id
INNER JOIN address_level a on a.id = i.address_id
INNER JOIN address_level_type alt on alt.id = a.type_id
INNER JOIN tobacco_takers tt ON tt.iuuid = i.uuid
Where e.program_exit_date_time is null and i.is_voided = false and a.is_voided = false
AND pe.encounter_date_time >= tt.encounter_date_time
AND  "Knowing about hazards of tobacco, have you quit tobacco/alcohol" = 'Yes'