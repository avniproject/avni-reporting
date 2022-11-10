-- Generated Report
-- Name: HemoglobinADSR

with filters as (
    select coalesce( [[ {{start_date}} , ]] '1900-01-01'::timestamptz) start_date,
           coalesce( [[ {{end_date}} , ]] current_timestamp) end_date
)

SELECT * FROM crosstab('SELECT
''Total adolescents enrolled''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''SELECT
  DISTINCT
  ind.uuid  uuid,
  ind.gender  gender_name,
  case
      when a."Village" is not null then ''''Village''''
      when a."School" is not null then ''''School''''
      when a."Boarding" is not null then ''''Boarding''''
      end  as address_type,
  case
      when a."Village" is not null then a."Village"
      when a."School" is not null then a."School"
      when a."Boarding" is not null then a."Boarding"
      end  as address_name
FROM
  adsr.individual ind
  inner join adsr.address a on ind.address_id = a.id
  inner join adsr.individual_adolescent enl on ind.id = enl.individual_id
  left join address_level adl on ind.address_id = adl.id
WHERE 1=1
    [[ and enl.enrolment_date_time >=(' || '''' || quote_literal({{ start_date }}) || '''' || '  ::DATE)]]
    [[and enl.enrolment_date_time <=' || '''' || quote_literal({{end_date}}) || '''' || ' ::DATE]]
    [[and adl.title = ' || '''' || quote_literal({{title}}) || '''' || ']];
'', ''select   distinct
  i.uuid      uuid,
         i.gender as gender_name,
         case
             when a."School" notnull then ''''School''''
             when a."Village" notnull then ''''Village''''
             when a."Boarding" notnull then ''''Boarding''''
             end  as address_type,
         case
             when a."School" notnull then a."School"
             when a."Village" notnull then a."Village"
             when a."Boarding" notnull then a."Boarding"
             end  as address_name
  from adsr.individual i
          left join adsr.address a on a.id = i.address_id
  where  i.is_voided = false
    [[ and i.registration_date >=(' || '''' || quote_literal({{ start_date }}) || '''' || '  ::DATE)]]
      [[and i.registration_date <=' || '''' || quote_literal({{end_date}}) || '''' || ' ::DATE]]'')
UNION ALL
SELECT
''HB recorded''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''WITH ind_with_HB AS (
    SELECT ind.uuid          AS                                                           iuuid,
           ind.id            As                                                           id,
           base.uuid         AS                                                           euuid,
           base."Haemoglobin" AS "Haemoglobin",
           base.encounter_date_time
    FROM adsr.individual ind
        inner join adsr.individual_adolescent_annual_visit_baseline base on ind.id = base.individual_id
    WHERE 1 = 1
        AND base."Haemoglobin" notnull
    union all
    SELECT ind.uuid          AS                                                           iuuid,
           ind.id            As                                                           id,
           endline.uuid         AS                                                           euuid,
           endline."Haemoglobin" AS "Haemoglobin",
           endline.encounter_date_time
    FROM adsr.individual ind
        inner join adsr.individual_adolescent_annual_visit_endline endline on ind.id = endline.individual_id
    WHERE 1 = 1
        AND endline."Haemoglobin" notnull
    union all
    SELECT ind.uuid          AS                                                           iuuid,
           ind.id            As                                                           id,
           severe.uuid         AS                                                           euuid,
           severe."Haemoglobin" AS "Haemoglobin",
           severe.encounter_date_time
    FROM adsr.individual ind
        inner join adsr.individual_adolescent_severe_anemia_followup severe on ind.id = severe.individual_id
    WHERE 1 = 1
        AND severe."Haemoglobin" notnull
    union all
    SELECT ind.uuid          AS                                                           iuuid,
           ind.id            As                                                           id,
           moderate.uuid         AS                                                           euuid,
           moderate."Haemoglobin" AS "Haemoglobin",
           moderate.encounter_date_time
    FROM adsr.individual ind
        inner join adsr.individual_adolescent_moderate_anemia_followup moderate on ind.id = moderate.individual_id
    WHERE 1 = 1
        AND moderate."Haemoglobin" notnull
)
SELECT i.uuid              as uuid,
       i.gender            as gender_name,
       case
           when ad."Village" is not null then ''''Village''''
           when ad."School" is not null then ''''School''''
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
    [[ and enl.enrolment_date_time >=(' || '''' || quote_literal({{ start_date }}) || '''' || '  ::DATE)]]
    [[and enl.enrolment_date_time <=' || '''' || quote_literal({{end_date}}) || '''' || ' ::DATE]]
    [[and adl.title = ' || '''' || quote_literal({{title}}) || '''' || ']];
'', ''SELECT
  DISTINCT
  ind.uuid  uuid,
  ind.gender  gender_name,
  case
      when a."Village" is not null then ''''Village''''
      when a."School" is not null then ''''School''''
      when a."Boarding" is not null then ''''Boarding''''
      end  as address_type,
  case
      when a."Village" is not null then a."Village"
      when a."School" is not null then a."School"
      when a."Boarding" is not null then a."Boarding"
      end  as address_name
FROM
  adsr.individual ind
  inner join adsr.address a on ind.address_id = a.id
  inner join adsr.individual_adolescent enl on ind.id = enl.individual_id
  left join address_level adl on ind.address_id = adl.id
WHERE 1=1
    [[ and enl.enrolment_date_time >=(' || '''' || quote_literal({{ start_date }}) || '''' || '  ::DATE)]]
    [[and enl.enrolment_date_time <=' || '''' || quote_literal({{end_date}}) || '''' || ' ::DATE]]
    [[and adl.title = ' || '''' || quote_literal({{title}}) || '''' || ']];
'')
UNION ALL
SELECT
''<= 7.9''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''WITH all_enc_data AS (
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
    from all_enc_data
    )
SELECT ind_uuid as uuid,
       i.gender as gender_name,
       case
           when a."Village" is not null then ''''Village''''
           when a."School" is not null then ''''School''''
           when a."Boarding" is not null then ''''Boarding''''
           end  as address_type,
       case
           when a."Village" is not null then a."Village"
           when a."School" is not null then a."School"
           when a."Boarding" is not null then a."Boarding"
           end  as address_name
FROM adsr.individual i
         left join ranked_data enc on enc.ind_uuid = i.uuid
         inner join adsr.address a on i.address_id = a.id
         left join address_level adl on i.address_id = adl.id
         inner join adsr.individual_adolescent enl on i.id = enl.individual_id
WHERE enc."Haemoglobin" <= 7.9
        [[and enl.enrolment_date_time >=(' || '''' || quote_literal({{ start_date }}) || '''' || '  ::DATE)]]
        [[and enl.enrolment_date_time <=' || '''' || quote_literal({{end_date}}) || '''' || ' ::DATE]]
        [[and adl.title = ' || '''' || quote_literal({{title}}) || '''' || ']]
        AND rank = 1;'', ''SELECT
  DISTINCT
  ind.uuid  uuid,
  ind.gender  gender_name,
  case
      when a."Village" is not null then ''''Village''''
      when a."School" is not null then ''''School''''
      when a."Boarding" is not null then ''''Boarding''''
      end  as address_type,
  case
      when a."Village" is not null then a."Village"
      when a."School" is not null then a."School"
      when a."Boarding" is not null then a."Boarding"
      end  as address_name
FROM
  adsr.individual ind
  inner join adsr.address a on ind.address_id = a.id
  inner join adsr.individual_adolescent enl on ind.id = enl.individual_id
  left join address_level adl on ind.address_id = adl.id
WHERE 1=1
    [[ and enl.enrolment_date_time >=(' || '''' || quote_literal({{ start_date }}) || '''' || '  ::DATE)]]
    [[and enl.enrolment_date_time <=' || '''' || quote_literal({{end_date}}) || '''' || ' ::DATE]]
    [[and adl.title = ' || '''' || quote_literal({{title}}) || '''' || ']];
'')
UNION ALL
SELECT
''8 - 10.9''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''WITH all_enc_data AS (
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
           when a."Village" is not null then ''''Village''''
           when a."School" is not null then ''''School''''
           when a."Boarding" is not null then ''''Boarding''''
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
WHERE enc."Haemoglobin" >= 8
  and enc."Haemoglobin" < 11
  [[and enl.enrolment_date_time >=(' || '''' || quote_literal({{ start_date }}) || '''' || '  ::DATE)]]
  [[and enl.enrolment_date_time <=' || '''' || quote_literal({{end_date}}) || '''' || ' ::DATE]]
  [[and adl.title = ' || '''' || quote_literal({{title}}) || '''' || ']]
  AND rank = 1;'', ''SELECT
  DISTINCT
  ind.uuid  uuid,
  ind.gender  gender_name,
  case
      when a."Village" is not null then ''''Village''''
      when a."School" is not null then ''''School''''
      when a."Boarding" is not null then ''''Boarding''''
      end  as address_type,
  case
      when a."Village" is not null then a."Village"
      when a."School" is not null then a."School"
      when a."Boarding" is not null then a."Boarding"
      end  as address_name
FROM
  adsr.individual ind
  inner join adsr.address a on ind.address_id = a.id
  inner join adsr.individual_adolescent enl on ind.id = enl.individual_id
  left join address_level adl on ind.address_id = adl.id
WHERE 1=1
    [[ and enl.enrolment_date_time >=(' || '''' || quote_literal({{ start_date }}) || '''' || '  ::DATE)]]
    [[and enl.enrolment_date_time <=' || '''' || quote_literal({{end_date}}) || '''' || ' ::DATE]]
    [[and adl.title = ' || '''' || quote_literal({{title}}) || '''' || ']];
'')
UNION ALL
SELECT
''11 - 11.9''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''WITH all_enc_data AS (
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
           when a."Village" is not null then ''''Village''''
           when a."School" is not null then ''''School''''
           when a."Boarding" is not null then ''''Boarding''''
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
    [[and enl.enrolment_date_time >=(' || '''' || quote_literal({{ start_date }}) || '''' || '  ::DATE)]]
    [[and enl.enrolment_date_time <=' || '''' || quote_literal({{end_date}}) || '''' || ' ::DATE]]
    [[and adl.title = ' || '''' || quote_literal({{title}}) || '''' || ']]
  AND rank = 1;'', ''SELECT
  DISTINCT
  ind.uuid  uuid,
  ind.gender  gender_name,
  case
      when a."Village" is not null then ''''Village''''
      when a."School" is not null then ''''School''''
      when a."Boarding" is not null then ''''Boarding''''
      end  as address_type,
  case
      when a."Village" is not null then a."Village"
      when a."School" is not null then a."School"
      when a."Boarding" is not null then a."Boarding"
      end  as address_name
FROM
  adsr.individual ind
  inner join adsr.address a on ind.address_id = a.id
  inner join adsr.individual_adolescent enl on ind.id = enl.individual_id
  left join address_level adl on ind.address_id = adl.id
WHERE 1=1
    [[ and enl.enrolment_date_time >=(' || '''' || quote_literal({{ start_date }}) || '''' || '  ::DATE)]]
    [[and enl.enrolment_date_time <=' || '''' || quote_literal({{end_date}}) || '''' || ' ::DATE]]
    [[and adl.title = ' || '''' || quote_literal({{title}}) || '''' || ']];
'')
UNION ALL
SELECT
''12 - 12.9''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''WITH all_enc_data AS (
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
           when a."Village" is not null then ''''Village''''
           when a."School" is not null then ''''School''''
           when a."Boarding" is not null then ''''Boarding''''
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
WHERE enc."Haemoglobin" >= 12
  and enc."Haemoglobin" < 13
      [[and enl.enrolment_date_time >=(' || '''' || quote_literal({{ start_date }}) || '''' || '  ::DATE)]]
      [[and enl.enrolment_date_time <=' || '''' || quote_literal({{end_date}}) || '''' || ' ::DATE]]
      [[and adl.title = ' || '''' || quote_literal({{title}}) || '''' || ']]
  AND rank = 1;'', ''SELECT
  DISTINCT
  ind.uuid  uuid,
  ind.gender  gender_name,
  case
      when a."Village" is not null then ''''Village''''
      when a."School" is not null then ''''School''''
      when a."Boarding" is not null then ''''Boarding''''
      end  as address_type,
  case
      when a."Village" is not null then a."Village"
      when a."School" is not null then a."School"
      when a."Boarding" is not null then a."Boarding"
      end  as address_name
FROM
  adsr.individual ind
  inner join adsr.address a on ind.address_id = a.id
  inner join adsr.individual_adolescent enl on ind.id = enl.individual_id
  left join address_level adl on ind.address_id = adl.id
WHERE 1=1
    [[ and enl.enrolment_date_time >=(' || '''' || quote_literal({{ start_date }}) || '''' || '  ::DATE)]]
    [[and enl.enrolment_date_time <=' || '''' || quote_literal({{end_date}}) || '''' || ' ::DATE]]
    [[and adl.title = ' || '''' || quote_literal({{title}}) || '''' || ']];
'')
UNION ALL
SELECT
''> 13''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''WITH all_enc_data AS (
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
           when a."Village" is not null then ''''Village''''
           when a."School" is not null then ''''School''''
           when a."Boarding" is not null then ''''Boarding''''
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
WHERE enc."Haemoglobin" > 13
    [[and enl.enrolment_date_time >=(' || '''' || quote_literal({{ start_date }}) || '''' || '  ::DATE)]]
    [[and enl.enrolment_date_time <=' || '''' || quote_literal({{end_date}}) || '''' || ' ::DATE]]
    [[and adl.title = ' || '''' || quote_literal({{title}}) || '''' || ']]
  AND rank = 1;'', ''SELECT
  DISTINCT
  ind.uuid  uuid,
  ind.gender  gender_name,
  case
      when a."Village" is not null then ''''Village''''
      when a."School" is not null then ''''School''''
      when a."Boarding" is not null then ''''Boarding''''
      end  as address_type,
  case
      when a."Village" is not null then a."Village"
      when a."School" is not null then a."School"
      when a."Boarding" is not null then a."Boarding"
      end  as address_name
FROM
  adsr.individual ind
  inner join adsr.address a on ind.address_id = a.id
  inner join adsr.individual_adolescent enl on ind.id = enl.individual_id
  left join address_level adl on ind.address_id = adl.id
WHERE 1=1
    [[ and enl.enrolment_date_time >=(' || '''' || quote_literal({{ start_date }}) || '''' || '  ::DATE)]]
    [[and enl.enrolment_date_time <=' || '''' || quote_literal({{end_date}}) || '''' || ' ::DATE]]
    [[and adl.title = ' || '''' || quote_literal({{title}}) || '''' || ']];
'')
UNION ALL
SELECT
''HB not recorded''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''WITH ind_without_HB AS (
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
            when a."Village" is not null then ''''Village''''
            when a."School" is not null then ''''School''''
            when a."Boarding" is not null then ''''Boarding''''
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
    [[and enl.enrolment_date_time >=(' || '''' || quote_literal({{ start_date }}) || '''' || '  ::DATE)]]
    [[and enl.enrolment_date_time <=' || '''' || quote_literal({{end_date}}) || '''' || ' ::DATE]]
    [[and adl.title = ' || '''' || quote_literal({{title}}) || '''' || ']];
'', ''SELECT
  DISTINCT
  ind.uuid  uuid,
  ind.gender  gender_name,
  case
      when a."Village" is not null then ''''Village''''
      when a."School" is not null then ''''School''''
      when a."Boarding" is not null then ''''Boarding''''
      end  as address_type,
  case
      when a."Village" is not null then a."Village"
      when a."School" is not null then a."School"
      when a."Boarding" is not null then a."Boarding"
      end  as address_name
FROM
  adsr.individual ind
  inner join adsr.address a on ind.address_id = a.id
  inner join adsr.individual_adolescent enl on ind.id = enl.individual_id
  left join address_level adl on ind.address_id = adl.id
WHERE 1=1
    [[ and enl.enrolment_date_time >=(' || '''' || quote_literal({{ start_date }}) || '''' || '  ::DATE)]]
    [[and enl.enrolment_date_time <=' || '''' || quote_literal({{end_date}}) || '''' || ' ::DATE]]
    [[and adl.title = ' || '''' || quote_literal({{title}}) || '''' || ']];
'')') AS (
rowid TEXT,
"All Female" TEXT,
"All Male" TEXT,
"All Other" TEXT,
"All Total" TEXT,
"Boarding Female" TEXT,
"Boarding Male" TEXT,
"Boarding Other" TEXT,
"Boarding Total" TEXT,
"School Female" TEXT,
"School Male" TEXT,
"School Other" TEXT,
"School Total" TEXT,
"Village Female" TEXT,
"Village Male" TEXT,
"Village Other" TEXT,
"Village Total" TEXT);