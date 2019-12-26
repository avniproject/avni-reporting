

SELECT
    i.uuid uuid,
    g.name    gender_name,
    a.type    address_type,
    a.title   address_name
FROM individual i
         LEFT OUTER JOIN address_level_type_view a ON i.address_id = a.id
         LEFT OUTER JOIN gender g ON i.gender_id = g.id
         join program_enrolment_view pe on i.id = pe.individual_id
where extract(YEAR FROM age(i.date_of_birth))>21 and enrolment_date_time notnull and program_name='Adolescent'
and i.is_voided=false
and pe.program_exit_date_time isnull

  and
    pe.enrolment_date_time between 'FILTERS.start_date' and 'FILTERS.end_date'