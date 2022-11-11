SELECT DISTINCT i.uuid uuid, i.gender gender_name, alt.name address_type, a.title address_name
FROM program_enrolment enrolment
LEFT OUTER JOIN adsr.individual i
ON enrolment.individual_id = i.id
JOIN address_level a
ON a.id = i.address_id
JOIN address_level_type alt
ON alt.id = a.type_id
WHERE program_exit_date_time is null  AND i.is_voided = false and a.is_voided = false
[[ and enrolment.enrolment_date_time >=(q1 || q4 || quote_literal({{ start_date }}) || q4 || q1  ::DATE)]]
[[and enrolment.enrolment_date_time <=q1 || q4 || quote_literal({{end_date}}) || q4 || q1 ::DATE]]
[[and a.title  = q1 || q4 || quote_literal({{title}}) || q4 || q1]]