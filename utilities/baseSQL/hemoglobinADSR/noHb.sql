WITH ind_without_HB AS (
    SELECT ind.uuid          AS                                                           iuuid,
           ind.id            As                                                           id,
           base.uuid         AS                                                           euuid,
           base."Haemoglobin" AS "Haemoglobin",
           base.encounter_date_time
    from adsr.individual ind
    inner join adsr.individual_adolescent_annual_visit_baseline base on ind.id = base.individual_id
    WHERE 1 = 1
          AND base."Haemoglobin" is null
    union all
    SELECT ind.uuid          AS                                                           iuuid,
           ind.id            As                                                           id,
           endline.uuid         AS                                                           euuid,
           endline."Haemoglobin" AS "Haemoglobin",
           endline.encounter_date_time
    from adsr.individual ind
    inner join adsr.individual_adolescent_annual_visit_endline endline on ind.id = endline.individual_id
    WHERE 1 = 1
          AND endline."Haemoglobin" is null
    union all
    SELECT ind.uuid          AS                                                           iuuid,
           ind.id            As                                                           id,
           severe.uuid         AS                                                           euuid,
           severe."Haemoglobin" AS "Haemoglobin",
           severe.encounter_date_time
    from adsr.individual ind
    inner join adsr.individual_adolescent_severe_anemia_followup severe on ind.id = severe.individual_id
    WHERE 1 = 1
          AND severe."Haemoglobin" is null
    union all
    SELECT ind.uuid          AS                                                           iuuid,
           ind.id            As                                                           id,
           moderate.uuid         AS                                                           euuid,
           moderate."Haemoglobin" AS "Haemoglobin",
           moderate.encounter_date_time
    from adsr.individual ind
    inner join adsr.individual_adolescent_moderate_anemia_followup moderate on ind.id = moderate.individual_id
    WHERE 1 = 1
          AND moderate."Haemoglobin" is null
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
     left join ind_without_HB withoutHb on i.id = withoutHb.id
     left join adsr.address a on i.address_id = a.id
     left join address_level adl on i.address_id = adl.id
     left join adsr.individual_adolescent enl on enl.individual_id = i.id

WHERE 1=1
    [[and enl.enrolment_date_time >=(q1 || q4 || quote_literal({{ start_date }}) || q4 || q1  ::DATE)]]
    [[and enl.enrolment_date_time <=q1 || q4 || quote_literal({{end_date}}) || q4 || q1 ::DATE]]
    [[and adl.title = q1 || q4 || quote_literal({{title}}) || q4 || q1]];
