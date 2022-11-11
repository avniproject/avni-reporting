
with all_data as (
    select individual_id,
           encounter_date_time,
           earliest_visit_date_time,
           is_voided,
           "Have you been referred"
    from adsr.individual_adolescent_severe_malnutrition_followup
    union all
    select individual_id,
           encounter_date_time,
           earliest_visit_date_time,
           is_voided,
           "Have you been referred"
    from adsr.individual_adolescent_sickle_cell_disease_followup
    union all
    select individual_id,
           encounter_date_time,
           earliest_visit_date_time,
           is_voided,
           "Have you been referred"
    from adsr.individual_adolescent_addiction_followup
    union all
    select individual_id,
           encounter_date_time,
           earliest_visit_date_time,
           is_voided,
           "Have you been referred"
    from adsr.individual_adolescent_menstrual_absenteeism_followup
    union all
    select individual_id,
           encounter_date_time,
           earliest_visit_date_time,
           is_voided,
           "Have you been referred"

    from adsr.individual_adolescent_chronic_sickness_follow_up),
     ranked_data as (
         select *,
                row_number() OVER (PARTITION BY individual_id ORDER BY encounter_date_time desc) erank
         from all_data
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

FROM ranked_data rd
         left join adsr.individual i on i.id = rd.individual_id
         left join adsr.individual_adolescent ia on i.id = ia.individual_id
         left join adsr.address a on a.id = i.address_id
WHERE ia.program_exit_date_time isnull
  and erank = 1
  and i.is_voided = false
  and ia.is_voided = false
    and a.is_voided = false
  and "Have you been referred" = 'Yes'
  [[ and ia.enrolment_date_time >=(q1 || q4 || quote_literal({{ start_date }}) || q4 || q1  ::DATE)]]
      [[and ia.enrolment_date_time <=q1 || q4 || quote_literal({{end_date}}) || q4 || q1 ::DATE]]
