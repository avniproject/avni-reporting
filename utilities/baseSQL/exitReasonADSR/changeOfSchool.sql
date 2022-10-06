
select i.uuid      uuid,
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
         inner join adsr.individual_adolescent_exit exit on i.id = exit.individual_id
         left join adsr.address a on a.id = i.address_id
where ia.program_exit_date_time notnull
  and exit."Reason for exit" = 'Change of school out of intervention area'