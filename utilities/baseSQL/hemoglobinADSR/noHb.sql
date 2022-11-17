WITH ind_without_HB AS (
    SELECT ind.uuid          AS                                                           iuuid,
           ind.id            As                                                           id,
           base.uuid         AS                                                           euuid,
           base."Haemoglobin" AS "Haemoglobin",
           base.encounter_date_time
    from adsr.individual ind
    inner join adsr.individual_adolescent_annual_visit_baseline base on ind.id = base.individual_id
    WHERE 1 = 1
          AND base."Haemoglobin test" = 'Not done'
)
SELECT i.uuid              as uuid,
       i.gender            as gender_name,
       case
            when a."Village" is not null then 'Village'
            when a."School" is not null then 'School'
            when a."Boarding" is not null then 'Boarding'
       end as address_type,
       case
            when a."Village" is not null then a."Village"
            when a."School" is not null then a."School"
            when a."Boarding" is not null then a."Boarding"
       end as address_name
FROM adsr.individual i
     inner join ind_without_HB withoutHb on i.id = withoutHb.id
     inner join adsr.address a on i.address_id = a.id
     left join address_level adl on i.address_id = adl.id
     inner join adsr.individual_adolescent enl on enl.individual_id = i.id

WHERE 1=1
and i.is_voided is false
and a.is_voided is false
    [[and enl.enrolment_date_time >=(q1 || q4 || quote_literal({{ start_date }}) || q4 || q1  ::DATE)]]
    [[and enl.enrolment_date_time <=q1 || q4 || quote_literal({{end_date}}) || q4 || q1 ::DATE]]
    [[and adl.title = q1 || q4 || quote_literal({{title}}) || q4 || q1]];
