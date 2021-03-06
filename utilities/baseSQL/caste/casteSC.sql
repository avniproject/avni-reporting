SELECT
  i.uuid uuid,
  g.name    gender_name,
  a.type    address_type,
  a.title   address_name
FROM individual i
  LEFT OUTER JOIN address_level_type_view a ON i.address_id = a.id
  LEFT OUTER JOIN gender g ON i.gender_id = g.id
  join program_enrolment pe on i.id = pe.individual_id
WHERE i.observations @> '{"61ab6413-5c6a-4512-ab6e-7d5cd1439569":"a3519a96-350e-4da4-90d9-827c0ff15538"}'
and i.is_voided=false
 and pe.program_exit_date_time isnull
and pe.enrolment_date_time between 'FILTERS.start_date' and 'FILTERS.end_date'
