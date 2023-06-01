
WITH ind_with_HB AS (
    SELECT ind.uuid           AS                                                             iuuid,
           ind.id             As                                                             id,
           base.uuid          AS                                                             euuid,
           base."Haemoglobin" AS                                                             "Haemoglobin",
           base.encounter_date_time,
           row_number() over (partition by individual_id order by encounter_date_time desc ) rank

    FROM adsr.individual ind
             inner join adsr.individual_adolescent_annual_visit_baseline base on ind.id = base.individual_id
    WHERE 1 = 1
      AND base."Haemoglobin" notnull
      and encounter_date_time notnull
)
SELECT i.uuid   as uuid,
       i.gender as gender_name,
       case
           when ad."Village" is not null then 'Village'
           when ad."School" is not null then 'School'
           when ad."Boarding" is not null then 'Boarding'
           end  as address_type,
       case
           when ad."Village" is not null then ad."Village"
           when ad."School" is not null then ad."School"
           when ad."Boarding" is not null then ad."Boarding"
           end  as address_name
FROM adsr.individual i
         left join adsr.individual_adolescent enl on i.id = enl.individual_id
         join ind_with_HB hb on i.id = hb.id and rank = 1
         left join adsr.address ad on i.address_id = ad.id
         left join address_level adl on i.address_id = adl.id

WHERE  i.is_voided = false
  and enl.program_exit_date_time isnull
  and enl.is_voided = false

    [[ and enl.enrolment_date_time >=(q1 || q4 || quote_literal({{ start_date }}) || q4 || q1  ::DATE)]]
    [[and enl.enrolment_date_time <=q1 || q4 || quote_literal({{end_date}}) || q4 || q1 ::DATE]]
    [[and adl.title = q1 || q4 || quote_literal({{title}}) || q4 || q1]];
