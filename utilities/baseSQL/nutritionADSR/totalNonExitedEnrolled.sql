SELECT DISTINCT i.uuid uuid, i.gender gender_name, alt.name address_type, a.title address_name
FROM adsr.individual i
LEFT OUTER JOIN adsr.individual_adolescent_annual_visit_baseline baseline
ON baseline.individual_id = i.id
JOIN address_level a
ON a.id = i.address_id
JOIN address_level_type alt
ON alt.id = a.type_id
WHERE baseline.is_voided is false AND i.is_voided = false and a.is_voided = false
[[ and baseline.enrolment_date_time >=(q1 || q4 || quote_literal({{ start_date }}) || q4 || q1  ::DATE)]]
[[and baseline.enrolment_date_time <=q1 || q4 || quote_literal({{end_date}}) || q4 || q1 ::DATE]]
[[and a.title  = q1 || q4 || quote_literal({{title}}) || q4 || q1]]