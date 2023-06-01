SELECT
  DISTINCT
  ind.uuid  uuid,
  ind.gender  gender_name,
  case
      when a."Village" is not null then 'Village'
      when a."School" is not null then 'School'
      when a."Boarding" is not null then 'Boarding'
      end  as address_type,
  case
      when a."Village" is not null then a."Village"
      when a."School" is not null then a."School"
      when a."Boarding" is not null then a."Boarding"
      end  as address_name
FROM
  adsr.individual ind
  left join adsr.address a on ind.address_id = a.id
  left join adsr.individual_adolescent enl on ind.id = enl.individual_id
  left join address_level adl on ind.address_id = adl.id
WHERE 1=1
and ind.is_voided = false
and enl.program_exit_date_time isnull
and enl.is_voided= false
    [[ and enl.enrolment_date_time >=(q1 || q4 || quote_literal({{ start_date }}) || q4 || q1  ::DATE)]]
    [[and enl.enrolment_date_time <=q1 || q4 || quote_literal({{end_date}}) || q4 || q1 ::DATE]]
    [[and adl.title = q1 || q4 || quote_literal({{title}}) || q4 || q1]];
