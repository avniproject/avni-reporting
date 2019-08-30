WITH individual_program_partitions AS (
  SELECT i.uuid          AS                                                                                   iuuid,
         row_number() OVER (PARTITION BY i.uuid ORDER BY pe.encounter_date_time desc) erank,
         pe.uuid         AS                                                                                   euuid,
         pe.observations AS                                                                                   observations,
         pe.encounter_date_time
  FROM completed_program_encounter_view pe
         INNER JOIN non_exited_program_enrolment_view e ON pe.program_enrolment_id = e.id
         INNER JOIN individual_view i ON e.individual_id = i.id
         INNER JOIN address_level a ON a.id = i.address_id
  WHERE e.program_name = 'Adolescent'
    and (pe.encounter_type_name = 'Annual Visit' or pe.encounter_type_name = 'Quarterly Visit')
    [[ and e.enrolment_date_time >=(q1 || q4 || quote_literal({{ start_date }}) || q4 || q1  ::DATE)]]
    [[and e.enrolment_date_time <=q1 || q4 || quote_literal({{end_date}}) || q4 || q1 ::DATE]]
    [[and a.title = q1 || q4 || quote_literal({{title}}) || q4 || q1]]
)
SELECT i.uuid  uuid,
       i.gender  gender_name,
       i.addresslevel_type  address_type,
       i.addresslevel_name address_name
FROM individual_program_partitions ip
       LEFT OUTER JOIN individual_gender_address_view i ON i.uuid = ip.iuuid
WHERE ip.observations -> '0f87eac1-cf6a-4632-8af2-29a935451fe4' IS NOT NULL
  AND ip.observations -> '0f87eac1-cf6a-4632-8af2-29a935451fe4' ?| ARRAY ['4085f165-ccb8-409b-9d6e-ea7755cf123e']
  AND erank = 1
