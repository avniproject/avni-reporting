with agg_data as (select uuid,
                         individual_id,
                         program_enrolment_id,
                         encounter_date_time,
                         "Sickling test result"
                  from adsr.individual_adolescent_annual_visit_baseline
                  where encounter_date_time is not null
                  union all
                  select uuid,
                         individual_id,
                         program_enrolment_id,
                         encounter_date_time,
                         "Sickling test result"
                  from adsr.individual_adolescent_annual_visit_endline
                  where encounter_date_time is not null)
        ,
     individual_program_partitions AS (SELECT i.uuid  AS                                                      iuuid,
                                              row_number()
                                              OVER (PARTITION BY i.uuid ORDER BY pe.encounter_date_time desc) erank,
                                              pe.uuid AS                                                      euuid,
                                              "Sickling test result",
                                              pe.encounter_date_time
                                       FROM agg_data pe
                                                INNER JOIN adsr.individual_adolescent e ON pe.program_enrolment_id = e.id
                                                INNER JOIN adsr.individual i ON e.individual_id = i.id
                                                JOIN address_level a on a.id = i.address_id
                                       WHERE e.program_exit_date_time is null
                                         and e.is_voided = false
                                         and i.is_voided = false
                                         and "Sickling test result" notnull
                                           [[and e.enrolment_date_time >=(q1 || q4 || quote_literal({{ start_date }}) || q4 || q1  ::DATE)]]
                                           [[and e.enrolment_date_time <=q1 || q4 || quote_literal({{end_date}}) || q4 || q1 ::DATE]]
                                           [[and a.title = q1 || q4 || quote_literal({{title}}) || q4 || q1]]
     )


SELECT distinct i.uuid   as uuid,
                i.gender as gender_name,
                alt.name as address_type,
                a.title  as address_name
FROM individual_program_partitions ip
         JOIN adsr.individual i ON i.uuid = ip.iuuid
         JOIN address_level a on a.id = i.address_id
         JOIN address_level_type alt on a.type_id = alt.id
WHERE (ip."Sickling test result" = 'Disease'
    OR ip."Sickling test result" = 'Trait')
  and erank = 1;