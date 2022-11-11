WITH individual_program_partitions AS (
SELECT i.uuid          AS                                                           iuuid,
           row_number() OVER (PARTITION BY i.uuid ORDER BY pe.encounter_date_time desc) erank,
           pe.uuid         AS                                                           euuid,
pe."Have you been referred" AS                                                           obs,
pe.encounter_date_time
FROM adsr.individual_adolescent_sickle_cell_disease_followup pe
INNER JOIN adsr.individual_adolescent e ON pe.program_enrolment_id = e.id
INNER JOIN adsr.individual i ON e.individual_id = i.id
INNER JOIN address_level a ON a.id = i.address_id
WHERE e.program_exit_date_time is null
and pe.encounter_date_time is not null
[[and e.enrolment_date_time >=(q1 || q4 || quote_literal({{ start_date }}) || q4 || q1  ::DATE)]]
[[and e.enrolment_date_time <=q1 || q4 || quote_literal({{end_date}}) || q4 || q1 ::DATE]]
[[and a.title = q1 || q4 || quote_literal({{title}}) || q4 || q1]]
)

SELECT ip.iuuid            uuid,
       i.gender            gender_name,
       alt.name address_type,
       a.title address_name
FROM individual_program_partitions ip
LEFT OUTER JOIN adsr.individual i ON i.uuid = ip.iuuid
LEFT OUTER JOIN address_level a on a.id = i.address_id
LEFT OUTER JOIN address_level_type alt on alt.id = a.type_id
WHERE ip.obs = 'Yes'
AND erank = 1