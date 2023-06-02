  select   distinct
  i.uuid      uuid,
         i.gender as gender_name,
         case
             when a."School" notnull then 'School'
             when a."Village" notnull then 'Village'
             when a."Boarding" notnull then 'Boarding'
             end  as address_type,
         case
             when a."School" notnull then a."School"
             when a."Village" notnull then a."Village"
             when a."Boarding" notnull then a."Boarding"
             end  as address_name
  from adsr.individual i
           left join adsr.individual_adolescent ia on i.id = ia.individual_id
           left join adsr.address a on a.id = i.address_id
  where  i.is_voided = false
    and ia.is_voided = false
    and ia.program_exit_date_time is null
 [[ and ia.enrolment_date_time >=(q1 || q4 || quote_literal({{ start_date }}) || q4 || q1  ::DATE)]]
   [[and ia.enrolment_date_time <=q1 || q4 || quote_literal({{end_date}}) || q4 || q1 ::DATE]]
