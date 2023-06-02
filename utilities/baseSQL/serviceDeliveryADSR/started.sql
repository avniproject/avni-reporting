
with annual_visit_data as (
    select individual_id, "Menstruation started", encounter_date_time, earliest_visit_date_time, is_voided,program_enrolment_id
    from adsr.individual_adolescent_annual_visit_baseline baseline
    where is_voided = false
      and "Menstruation started" is not null
    union all
    select individual_id, "Menstruation started", encounter_date_time, earliest_visit_date_time, is_voided,program_enrolment_id
    from adsr.individual_adolescent_annual_visit_endline endline
    where is_voided = false
      and "Menstruation started" is not null),
    ranked_data as(
    select *, row_number() over (partition by program_enrolment_id order by encounter_date_time desc) rank
    from annual_visit_data where encounter_date_time notnull
    )
select i.uuid   as uuid,
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
         inner join ranked_data an on an.individual_id = i.id and rank=1

         left join adsr.address a on a.id = i.address_id
where ia.program_exit_date_time is null
  and an."Menstruation started" ='Yes'
  and i.is_voided = false
  and ia.is_voided = false
   [[ and ia.enrolment_date_time >=(q1 || q4 || quote_literal({{ start_date }}) || q4 || q1  ::DATE)]]
      [[and ia.enrolment_date_time <=q1 || q4 || quote_literal({{end_date}}) || q4 || q1 ::DATE]]
