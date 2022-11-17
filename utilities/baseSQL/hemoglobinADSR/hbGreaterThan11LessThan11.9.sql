WITH all_enc_data AS (
    SELECT ind.uuid             AS ind_uuid,
           base.uuid          AS euuid,
           base."Haemoglobin" AS "Haemoglobin",
           base.encounter_date_time
    FROM adsr.individual ind
             inner join adsr.individual_adolescent_annual_visit_baseline base on ind.id = base.individual_id
    WHERE 1 = 1
      AND base."Haemoglobin" notnull
    union all
    SELECT ind.uuid                AS ind_uuid,
           endline.uuid          AS euuid,
           endline."Haemoglobin" AS "Haemoglobin",
           endline.encounter_date_time
    FROM adsr.individual ind
             inner join adsr.individual_adolescent_annual_visit_endline endline on ind.id = endline.individual_id
    WHERE 1 = 1
      and endline."Haemoglobin" notnull
    union all
    SELECT ind.uuid               AS ind_uuid,
           severe.uuid          AS euuid,
           severe."Haemoglobin" AS "Haemoglobin",
           severe.encounter_date_time
    FROM adsr.individual ind
             inner join adsr.individual_adolescent_severe_anemia_followup severe on ind.id = severe.individual_id
    WHERE 1 = 1
      and severe."Haemoglobin" notnull
    union all
    SELECT ind.uuid                 AS ind_uuid,
           moderate.uuid          AS euuid,
           moderate."Haemoglobin" AS "Haemoglobin",
           moderate.encounter_date_time
    FROM adsr.individual ind
             inner join adsr.individual_adolescent_moderate_anemia_followup moderate on ind.id = moderate.individual_id
    WHERE 1 = 1
      and moderate."Haemoglobin" notnull
)
   , ranked_data as (
    select row_number() over (partition by ind_uuid order by encounter_date_time desc ) rank, *
    from all_enc_data)
SELECT ind_uuid as uuid,
       i.gender as gender_name,
       case
           when a."Village" is not null then 'Village'
           when a."School" is not null then 'School'
           when a."Boarding" is not null then 'Boarding'
           end  as address_type,
       case
           when a."Village" is not null then a."Village"
           when a."School" is not null then a."School"
           when a."Boarding" is not null then a."Boarding"
           end  as address_name
FROM adsr.individual i
         left join ranked_data enc on enc.ind_uuid = i.uuid
         inner join adsr.address a on i.address_id = a.id
         inner join adsr.individual_adolescent enl on i.id = enl.individual_id
         left join address_level adl on i.address_id = adl.id
WHERE enc."Haemoglobin" >= 11
  and enc."Haemoglobin" < 12
and   i.is_voided is false
and   a.is_voided is false
    [[and enl.enrolment_date_time >=(q1 || q4 || quote_literal({{ start_date }}) || q4 || q1  ::DATE)]]
    [[and enl.enrolment_date_time <=q1 || q4 || quote_literal({{end_date}}) || q4 || q1 ::DATE]]
    [[and adl.title = q1 || q4 || quote_literal({{title}}) || q4 || q1]]
  AND rank = 1;