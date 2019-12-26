
  SELECT
    i.uuid uuid,
    g.name    gender_name,
    a.type    address_type,
    a.title   address_name
FROM individual i
         LEFT OUTER JOIN address_level_type_view a ON i.address_id = a.id
         LEFT OUTER JOIN gender g ON i.gender_id = g.id
         join program_enrolment_view pe on i.id = pe.individual_id
where i.observations @>'{"476a0b71-485b-4a0a-ba6f-4f3cf13568ca":"eace7aa2-8444-4c43-b5aa-8b5ec0b19a20"}'
 and pe.enrolment_date_time notnull and pe.program_name='Adolescent'
 and i.is_voided=false
  and pe.program_exit_date_time isnull
  and
    pe.enrolment_date_time between 'FILTERS.start_date' and 'FILTERS.end_date'
