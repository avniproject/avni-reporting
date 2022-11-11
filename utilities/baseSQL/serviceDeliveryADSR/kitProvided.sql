
WITH individual_program_partitions AS (
    select individual_id, "MHM Kit received", encounter_date_time, earliest_visit_date_time, is_voided
    from adsr.individual_adolescent_annual_visit_baseline baseline
    where is_voided = false
      and encounter_date_time notnull
    union all
    select individual_id, "MHM Kit received", encounter_date_time, earliest_visit_date_time, is_voided
    from adsr.individual_adolescent_annual_visit_endline baseline
    where is_voided = false
      and encounter_date_time notnull
),
     ranked_data as (
         select *,
                row_number() OVER (PARTITION BY individual_id ORDER BY encounter_date_time desc) erank
         from individual_program_partitions
     )
SELECT i.uuid   as uuid,
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
         left join adsr.individual i on i.id = rd.individual_id
         left join adsr.individual_adolescent ia on i.id = ia.individual_id
         left join adsr.address a on a.id = i.address_id
WHERE "MHM Kit received" = 'Yes'
  and ia.program_exit_date_time isnull
  AND erank = 1
  and i.is_voided = false
    and a.is_voided = false
  and ia.is_voided = false
   [[ and ia.enrolment_date_time >=(q1 || q4 || quote_literal({{ start_date }}) || q4 || q1  ::DATE)]]
      [[and ia.enrolment_date_time <=q1 || q4 || quote_literal({{end_date}}) || q4 || q1 ::DATE]]