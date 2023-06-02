WITH agg_data as (select uuid,
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
   , individual_program_partitions AS (
    select *, row_number() over (partition by individual_id order by encounter_date_time desc ) rank
    from agg_data
    where "Sickling test result" notnull
)
SELECT  i.uuid              as uuid,
                i.gender            as gender_name,
                alt.name as address_type,
                a.title as address_name
FROM individual_program_partitions ip
         JOIN adsr.individual i ON i.id = ip.individual_id
         join adsr.individual_adolescent enl on i.id = enl.individual_id
         JOIN address_level a ON a.id = i.address_id
         JOIN address_level_type alt ON alt.id = a.type_id
WHERE ip."Sickling test result" is not null
  and i.is_voided = false
  and rank = 1
  and enl.is_voided = false
  and enl.program_exit_date_time isnull
    [[and enl.enrolment_date_time >=(q1 || q4 || quote_literal({{ start_date }}) || q4 || q1  ::DATE)]]
    [[and enl.enrolment_date_time <=q1 || q4 || quote_literal({{end_date}}) || q4 || q1 ::DATE]]
    [[and a.title = q1 || q4 || quote_literal({{title}}) || q4 || q1]]
