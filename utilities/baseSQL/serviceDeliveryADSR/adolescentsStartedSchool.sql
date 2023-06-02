with data as(
    select "Are you ready to readmit in school",
           individual_id,
           row_number() over (partition by program_enrolment_id order by encounter_date_time desc ) rank
    from adsr.individual_adolescent_school_dropout_visit where  encounter_date_time notnull
)select i.uuid   as uuid,
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
         inner join data an on an.individual_id = i.id
         left join adsr.address a on a.id = i.address_id
where ia.program_exit_date_time isnull
  and i.is_voided = false
  and ia.is_voided = false
  and "Are you ready to readmit in school" = 'Yes' and rank=1
  [[ and ia.enrolment_date_time >=(q1 || q4 || quote_literal({{ start_date }}) || q4 || q1  ::DATE)]]
  [[and ia.enrolment_date_time <=q1 || q4 || quote_literal({{end_date}}) || q4 || q1 ::DATE]]
