WITH ind_with_HB AS (
    SELECT ind.uuid          AS                                                           iuuid,
           ind.id            As                                                           id,
           base.uuid         AS                                                           euuid,
           base."Haemoglobin" AS "Haemoglobin",
           base.encounter_date_time
    FROM adsr.individual ind
        inner join adsr.individual_adolescent_annual_visit_baseline base on ind.id = base.individual_id
    WHERE 1 = 1
        AND base."Haemoglobin" notnull
    -- union all
    -- SELECT ind.uuid          AS                                                           iuuid,
    --        ind.id            As                                                           id,
    --        endline.uuid         AS                                                           euuid,
    --        endline."Haemoglobin" AS "Haemoglobin",
    --        endline.encounter_date_time
    -- FROM adsr.individual ind
    --     inner join adsr.individual_adolescent_annual_visit_endline endline on ind.id = endline.individual_id
    -- WHERE 1 = 1
    --     AND endline."Haemoglobin" notnull
    -- union all
    -- SELECT ind.uuid          AS                                                           iuuid,
    --        ind.id            As                                                           id,
    --        severe.uuid         AS                                                           euuid,
    --        severe."Haemoglobin" AS "Haemoglobin",
    --        severe.encounter_date_time
    -- FROM adsr.individual ind
    --     inner join adsr.individual_adolescent_severe_anemia_followup severe on ind.id = severe.individual_id
    -- WHERE 1 = 1
    --     AND severe."Haemoglobin" notnull
    -- union all
    -- SELECT ind.uuid          AS                                                           iuuid,
    --        ind.id            As                                                           id,
    --        moderate.uuid         AS                                                           euuid,
    --        moderate."Haemoglobin" AS "Haemoglobin",
    --        moderate.encounter_date_time
    -- FROM adsr.individual ind
    --     inner join adsr.individual_adolescent_moderate_anemia_followup moderate on ind.id = moderate.individual_id
    -- WHERE 1 = 1
    --     AND moderate."Haemoglobin" notnull
)
SELECT i.uuid              as uuid,
       i.gender            as gender_name,
       case
           when ad."Village" is not null then 'Village'
           when ad."School" is not null then 'School'
           when ad."Boarding" is not null then "Boarding"
       end as address_type,
       case
           when ad."Village" is not null then ad."Village"
           when ad."School" is not null then ad."School"
           when ad."Boarding" is not null then ad."Boarding"
       end as address_name
FROM adsr.individual i
     left join adsr.individual_adolescent enl on i.id = enl.individual_id
     left join ind_with_HB hb on i.id = hb.id
     left join adsr.address ad on i.address_id = ad.id
     left join address_level adl on i.address_id = adl.id

WHERE i.id in (select id from ind_with_HB)
and i.is_voided is false
and ad.is_voided is false
    [[ and enl.enrolment_date_time >=(q1 || q4 || quote_literal({{ start_date }}) || q4 || q1  ::DATE)]]
    [[and enl.enrolment_date_time <=q1 || q4 || quote_literal({{end_date}}) || q4 || q1 ::DATE]]
    [[and adl.title = q1 || q4 || quote_literal({{title}}) || q4 || q1]];
