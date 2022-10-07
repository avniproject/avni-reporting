
with annual_visit_data as (
    select individual_id, "Menstruation started", encounter_date_time, earliest_visit_date_time, is_voided
    from adsr.individual_adolescent_annual_visit_baseline baseline
    where is_voided = false
      and "Menstruation started" is not null
    union all
    select individual_id, "Menstruation started", encounter_date_time, earliest_visit_date_time, is_voided
    from adsr.individual_adolescent_annual_visit_endline endline
    where is_voided = false
      and "Menstruation started" is not null)
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
         left join individual_adolescent ia on i.id = ia.individual_id
         inner join annual_visit_data an on an.individual_id = i.id
         left join adsr.address a on a.id = i.address_id
where ia.program_exit_date_time is null
  and an."Menstruation started" ='Yes'
  and i.is_voided = false
      and ia.is_voided = false