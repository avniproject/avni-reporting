
SELECT
    DISTINCT
    i.uuid  uuid,
    g.name  gender_name,
    a.type  address_type,
    a.title address_name

FROM
    individual i
        LEFT OUTER JOIN gender g ON g.id = i.gender_id
        LEFT OUTER JOIN address_level_type_view a ON i.address_id = a.id
        join program_enrolment_view pe on i.id = pe.individual_id
where pe.program_name='Indi'
    pe.enrolment_date_time between 'FILTERS.start_date' and 'FILTERS.end_date'