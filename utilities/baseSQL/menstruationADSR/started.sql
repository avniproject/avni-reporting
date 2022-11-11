with agg_data as (
  select individual_id,
         "Menstruation started"
  from adsr.individual_adolescent_annual_visit_baseline
  where  encounter_date_time is not null
  union all
  select individual_id,
         "Menstruation started"
  from adsr.individual_adolescent_annual_visit_endline
  where  encounter_date_time is not null
)

SELECT DISTINCT i.uuid   as uuid,
                gender   as gender_name,
                alt.name as address_type,
                a.title  as address_name
FROM agg_data lpe
JOIN adsr.individual i ON i.id = lpe.individual_id
JOIN address_level a ON a.id = i.address_id
JOIN address_level_type alt ON alt.id = a.type_id
JOIN program_enrolment e ON e.individual_id = i.id
WHERE program_exit_date_time is null
AND "Menstruation started" = 'Yes'
AND i.is_voided = false and a.is_voided = false
     [[ and e.enrolment_date_time >=(q1 || q4 || quote_literal({{ start_date }}) || q4 || q1  ::DATE)]]
     [[and e.enrolment_date_time <=q1 || q4 || quote_literal({{end_date}}) || q4 || q1 ::DATE]]
     [[and a.title = q1 || q4 || quote_literal({{title}}) || q4 || q1]]