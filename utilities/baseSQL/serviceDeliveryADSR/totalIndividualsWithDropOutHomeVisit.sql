
with annual_visit_data as (
    select individual_id, "Going to school", encounter_date_time, earliest_visit_date_time, is_voided
    from adsr.individual_adolescent_annual_visit_baseline baseline
    where is_voided = false
      and "Going to school" is not null
    union all
    select individual_id, "Going to school", encounter_date_time, earliest_visit_date_time, is_voided
    from adsr.individual_adolescent_annual_visit_endline endline
    where is_voided = false
      and "Going to school" is not null),

     ranked_data as (
         select *,
                row_number() OVER (PARTITION BY individual_id ORDER BY encounter_date_time desc) erank
         from annual_visit_data
     )
SELECT DISTINCT
i.uuid   as uuid,
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

FROM ranked_data rd
         inner join adsr.individual_adolescent_school_dropout_visit drop
                    on drop.individual_id = rd.individual_id and drop.encounter_date_time notnull
         left join adsr.individual i on i.id = rd.individual_id
         left join adsr.individual_adolescent ia on i.id = ia.individual_id
         left join adsr.address a on a.id = i.address_id
WHERE  erank = 1
  and i.is_voided = false
  and ia.is_voided = false
    and a.is_voided = false
  and rd."Going to school" = 'Dropped out'
  and (ia.enrolment_date_time ISNULL OR ia.enrolment_date_time between 'FILTERS.start_date' and 'FILTERS.end_date')
