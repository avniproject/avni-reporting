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
          left join adsr.address a on a.id = i.address_id
  where  i.is_voided = false
    [[ and i.registration_date >=(q1 || q4 || quote_literal({{ start_date }}) || q4 || q1  ::DATE)]]
      [[and i.registration_date <=q1 || q4 || quote_literal({{end_date}}) || q4 || q1 ::DATE]]
