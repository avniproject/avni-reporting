-- Generated Report
-- Name: ServiceDeliveryADSR

with filters as (
    select coalesce( [[ {{start_date}} , ]] '1900-01-01'::timestamptz) start_date,
           coalesce( [[ {{end_date}} , ]] current_timestamp) end_date
)

SELECT * FROM crosstab('SELECT
  ''Total Adolescents Registered''                                          rowid,
  address_type || '' '' || gender AS                             attribute,
  total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''  select   distinct
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
      [[and i.registration_date <=' || '''' || quote_literal({{end_date}}) || '''' || ' ::DATE]]
'')
UNION ALL
SELECT
''Total Adolescents Enrolled''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''  select   distinct
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
           left join adsr.individual_adolescent ia on i.id = ia.individual_id
           left join adsr.address a on a.id = i.address_id
  where  i.is_voided = false
    and ia.is_voided = false
 [[ and ia.enrolment_date_time >=(' || '''' || quote_literal({{ start_date }}) || '''' || '  ::DATE)]]
   [[and ia.enrolment_date_time <=' || '''' || quote_literal({{end_date}}) || '''' || ' ::DATE]]
'', ''  select   distinct
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
      [[and i.registration_date <=' || '''' || quote_literal({{end_date}}) || '''' || ' ::DATE]]
'')
UNION ALL
SELECT
''Total Adolescents With Problems''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''
WITH individual_program_partitions AS (
    select individual_id,
           encounter_date_time,
           earliest_visit_date_time,
           is_voided,
           "Is there a swelling at lower back",
           "Does she remain absent during menstruation",
           "Is there any physical defect",
           "Do you suffer from ulcer over genitalia",
           "Is he/she slower than others in learning and unde (1127345045)",
           "Does he/she have difficulty in breathing while playing",
           "Are there dental carries",
           "Is his/her behaviour different from others",
           "Does he/she have impaired hearing",
           "Is there a white patch in her eyes",
           "Do you have multiple sexual partners",
           "Do you suffer from burning micturition",
           "Has he/she ever suffered from convulsions",
           "Is there pus coming from ear",
           "Is his/her nails/tongue pale",
           "Is there any developmental delay or disability seen",
           "Is there any problem in leg bone",
           "Do you suffer from yellowish discharge from vagina / penis",
           "Does he/she have impaired vision",
           "Is there a swelling over throat",
           "Do you perform unprotected sexual intercourse",
           "Sickling test result",
           "Do you have any addiction",
           "Does he/she have skin problems",
           "BMI (kg/m²)",
           "Haemoglobin",
           "Menstrual disorder"
    from adsr.individual_adolescent_annual_visit_baseline baseline
    where is_voided = false
      and encounter_date_time notnull
    union all
    select individual_id,
           encounter_date_time,
           earliest_visit_date_time,
           is_voided,
           "Is there a swelling at lower back",
           "Does she remain absent during menstruation",
           "Is there any physical defect",
           "Do you suffer from ulcer over genitalia",
           "Is he/she slower than others in learning and unde (1127345045)",
           "Does he/she have difficulty in breathing while playing",
           "Are there dental carries",
           "Is his/her behaviour different from others",
           "Does he/she have impaired hearing",
           "Is there a white patch in her eyes",
           "Do you have multiple sexual partners",
           "Do you suffer from burning micturition",
           "Has he/she ever suffered from convulsions",
           "Is there pus coming from ear",
           "Is his/her nails/tongue pale",
           "Is there any developmental delay or disability seen",
           "Is there any problem in leg bone",
           "Do you suffer from yellowish discharge from vagina / penis",
           "Does he/she have impaired vision",
           "Is there a swelling over throat",
           "Do you perform unprotected sexual intercourse",
           "Sickling test result",
           "Do you have any addiction",
           "Does he/she have skin problems",
           "BMI (kg/m²)",
           "Haemoglobin",
           "Menstrual disorder"
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
           when a."School" notnull then ''''School''''
           when a."Village" notnull then ''''Village''''
           when a."Boarding" notnull then ''''Boarding''''
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
  AND erank = 1
  and i.is_voided = false
  and ia.is_voided = false
   [[ and ia.enrolment_date_time >=(' || '''' || quote_literal({{ start_date }}) || '''' || '  ::DATE)]]
    [[and ia.enrolment_date_time <=' || '''' || quote_literal({{end_date}}) || '''' || ' ::DATE]]
  and (
            "Is there a swelling at lower back" = ''''Yes''''
        or "Does she remain absent during menstruation" = ''''Yes''''
        or "Is there any physical defect" = ''''Yes''''
        or "Do you suffer from ulcer over genitalia" = ''''Yes''''
        or "Is he/she slower than others in learning and unde (1127345045)" = ''''Yes''''
        or "Does he/she have difficulty in breathing while playing" = ''''Yes''''
        or "Are there dental carries" = ''''Yes''''
        or "Is his/her behaviour different from others" = ''''Yes''''
        or "Does he/she have impaired hearing" = ''''Yes''''
        or "Is there a white patch in her eyes" = ''''Yes''''
        or "Do you have multiple sexual partners" = ''''Yes''''
        or "Do you suffer from burning micturition" = ''''Yes''''
        or "Has he/she ever suffered from convulsions" = ''''Yes''''
        or "Is there pus coming from ear" = ''''Yes''''
        or "Is his/her nails/tongue pale" = ''''Yes''''
        or "Is there any developmental delay or disability seen" = ''''Yes''''
        or "Is there any problem in leg bone" = ''''Yes''''
        or "Do you suffer from yellowish discharge from vagina / penis" = ''''Yes''''
        or "Does he/she have impaired vision" = ''''Yes''''
        or "Is there a swelling over throat" = ''''Yes''''
        or "Do you perform unprotected sexual intercourse" = ''''Yes''''
        or "Sickling test result" = ''''Disease''''
        or "Do you have any addiction" <> ''''None''''
        or "Does he/she have skin problems" = ''''Yes''''
        or "BMI (kg/m²)"::float < 14.5
        or "Haemoglobin"::float <= 7
        or "Menstrual disorder" <> ''''No problem''''
    )
;'', ''  select   distinct
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
           left join adsr.individual_adolescent ia on i.id = ia.individual_id
           left join adsr.address a on a.id = i.address_id
  where  i.is_voided = false
    and ia.is_voided = false
 [[ and ia.enrolment_date_time >=(' || '''' || quote_literal({{ start_date }}) || '''' || '  ::DATE)]]
   [[and ia.enrolment_date_time <=' || '''' || quote_literal({{end_date}}) || '''' || ' ::DATE]]
'')
UNION ALL
SELECT
''Total Adolescents Referred''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''
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
           when a."School" notnull then ''''School''''
           when a."Village" notnull then ''''Village''''
           when a."Boarding" notnull then ''''Boarding''''
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
  and "Have you been referred" = ''''Yes''''
  [[ and ia.enrolment_date_time >=(' || '''' || quote_literal({{ start_date }}) || '''' || '  ::DATE)]]
      [[and ia.enrolment_date_time <=' || '''' || quote_literal({{end_date}}) || '''' || ' ::DATE]]
'', ''  select   distinct
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
           left join adsr.individual_adolescent ia on i.id = ia.individual_id
           left join adsr.address a on a.id = i.address_id
  where  i.is_voided = false
    and ia.is_voided = false
 [[ and ia.enrolment_date_time >=(' || '''' || quote_literal({{ start_date }}) || '''' || '  ::DATE)]]
   [[and ia.enrolment_date_time <=' || '''' || quote_literal({{end_date}}) || '''' || ' ::DATE]]
'')
UNION ALL
SELECT
''Total Adolescents Dropped Out''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''WITH individual_program_partitions AS (
    select individual_id, "Going to school", encounter_date_time, earliest_visit_date_time, is_voided
    from adsr.individual_adolescent_annual_visit_baseline baseline
    where is_voided = false
      and encounter_date_time notnull
    union all
    select individual_id, "Going to school", encounter_date_time, earliest_visit_date_time, is_voided
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
           when a."School" notnull then ''''School''''
           when a."Village" notnull then ''''Village''''
           when a."Boarding" notnull then ''''Boarding''''
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
WHERE "Going to school" = ''''Dropped out''''
  and ia.program_exit_date_time isnull
  AND erank = 1
  and i.is_voided = false
  and ia.is_voided = false
  and (ia.enrolment_date_time ISNULL OR ia.enrolment_date_time between '''''|| (select start_date from filters) ||''''' and '''''|| (select end_date from filters) ||''''')'', ''  select   distinct
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
           left join adsr.individual_adolescent ia on i.id = ia.individual_id
           left join adsr.address a on a.id = i.address_id
  where  i.is_voided = false
    and ia.is_voided = false
 [[ and ia.enrolment_date_time >=(' || '''' || quote_literal({{ start_date }}) || '''' || '  ::DATE)]]
   [[and ia.enrolment_date_time <=' || '''' || quote_literal({{end_date}}) || '''' || ' ::DATE]]
'')
UNION ALL
SELECT
''Total Adolescents With a Dropout Home Visit''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''
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
           when a."School" notnull then ''''School''''
           when a."Village" notnull then ''''Village''''
           when a."Boarding" notnull then ''''Boarding''''
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
  and rd."Going to school" = ''''Dropped out''''
  and (ia.enrolment_date_time ISNULL OR ia.enrolment_date_time between '''''|| (select start_date from filters) ||''''' and '''''|| (select end_date from filters) ||''''')
'', ''WITH individual_program_partitions AS (
    select individual_id, "Going to school", encounter_date_time, earliest_visit_date_time, is_voided
    from adsr.individual_adolescent_annual_visit_baseline baseline
    where is_voided = false
      and encounter_date_time notnull
    union all
    select individual_id, "Going to school", encounter_date_time, earliest_visit_date_time, is_voided
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
           when a."School" notnull then ''''School''''
           when a."Village" notnull then ''''Village''''
           when a."Boarding" notnull then ''''Boarding''''
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
WHERE "Going to school" = ''''Dropped out''''
  and ia.program_exit_date_time isnull
  AND erank = 1
  and i.is_voided = false
  and ia.is_voided = false
  and (ia.enrolment_date_time ISNULL OR ia.enrolment_date_time between '''''|| (select start_date from filters) ||''''' and '''''|| (select end_date from filters) ||''''')'')
UNION ALL
SELECT
''Total Adolescents Started Going to School Again''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''
select i.uuid   as uuid,
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
         left join adsr.individual_adolescent ia on i.id = ia.individual_id
         inner join adsr.individual_adolescent_school_dropout_visit an on an.individual_id = i.id
         left join adsr.address a on a.id = i.address_id
where ia.program_exit_date_time isnull
  and i.is_voided = false
  and ia.is_voided = false
  and an.is_voided = false
  and "Are you ready to readmit in school" = ''''yes''''
  [[ and ia.enrolment_date_time >=(' || '''' || quote_literal({{ start_date }}) || '''' || '  ::DATE)]]
  [[and ia.enrolment_date_time <=' || '''' || quote_literal({{end_date}}) || '''' || ' ::DATE]]
'', ''WITH individual_program_partitions AS (
    select individual_id, "Going to school", encounter_date_time, earliest_visit_date_time, is_voided
    from adsr.individual_adolescent_annual_visit_baseline baseline
    where is_voided = false
      and encounter_date_time notnull
    union all
    select individual_id, "Going to school", encounter_date_time, earliest_visit_date_time, is_voided
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
           when a."School" notnull then ''''School''''
           when a."Village" notnull then ''''Village''''
           when a."Boarding" notnull then ''''Boarding''''
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
WHERE "Going to school" = ''''Dropped out''''
  and ia.program_exit_date_time isnull
  AND erank = 1
  and i.is_voided = false
  and ia.is_voided = false
  and (ia.enrolment_date_time ISNULL OR ia.enrolment_date_time between '''''|| (select start_date from filters) ||''''' and '''''|| (select end_date from filters) ||''''')'')
UNION ALL
SELECT
''Exited''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''
  select   distinct
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
           left join adsr.individual_adolescent ia on i.id = ia.individual_id
           inner join adsr.individual_adolescent_exit exit on i.id = exit.individual_id
           left join adsr.address a on a.id = i.address_id
  where ia.program_exit_date_time notnull
   and i.is_voided = false
    and ia.is_voided = false
  [[ and ia.program_exit_date_time >= (' || '''' || quote_literal({{ start_date }}) || '''' || '  ::DATE) ]]
    [[ and ia.program_exit_date_time <= ' || '''' || quote_literal({{ end_date }}) || '''' || ' ::DATE ]]'', ''  select   distinct
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
           left join adsr.individual_adolescent ia on i.id = ia.individual_id
           left join adsr.address a on a.id = i.address_id
  where  i.is_voided = false
    and ia.is_voided = false
 AND (program_exit_date_time ISNULL
   [[ OR ia.program_exit_date_time < (' || '''' || quote_literal({{ start_date }}) || '''' || '  ::DATE) ]]
   [[ OR ia.program_exit_date_time > ' || '''' || quote_literal({{ end_date }}) || '''' || ' ::DATE ]])
'')
UNION ALL
SELECT
''All menstruating girls''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''
with annual_visit_data as (
    select individual_id, "Menstruation started", encounter_date_time, earliest_visit_date_time, is_voided
    from adsr.individual_adolescent_annual_visit_baseline baseline
    where is_voided = false
      and "Menstruation started" is not null
    union all
    select individual_id, "Menstruation started", encounter_date_time, earliest_visit_date_time, is_voided
    from adsr.individual_adolescent_annual_visit_endline endline
    where is_voided = false
      and "Menstruation started" is not null)
select i.uuid   as uuid,
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
         left join individual_adolescent ia on i.id = ia.individual_id
         inner join annual_visit_data an on an.individual_id = i.id
         left join adsr.address a on a.id = i.address_id
where ia.program_exit_date_time is null
  and an."Menstruation started" =''''Yes''''
  and i.is_voided = false
    and ia.is_voided = false
   [[ and ia.enrolment_date_time >=(' || '''' || quote_literal({{ start_date }}) || '''' || '  ::DATE)]]
      [[and ia.enrolment_date_time <=' || '''' || quote_literal({{end_date}}) || '''' || ' ::DATE]]
'', ''
  select   distinct
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
           left join adsr.individual_adolescent ia on i.id = ia.individual_id
           left join adsr.address a on a.id = i.address_id
  where ia.program_exit_date_time isnull
   and i.is_voided = false
    and ia.is_voided = false
    and  i.gender =''''Female''''
 [[ and ia.enrolment_date_time >=(' || '''' || quote_literal({{ start_date }}) || '''' || '  ::DATE)]]
     [[and ia.enrolment_date_time <=' || '''' || quote_literal({{end_date}}) || '''' || ' ::DATE]]
'')
UNION ALL
SELECT
''MHM Kit Provided?''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''
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
           when a."School" notnull then ''''School''''
           when a."Village" notnull then ''''Village''''
           when a."Boarding" notnull then ''''Boarding''''
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
WHERE "MHM Kit received" = ''''Yes''''
  and ia.program_exit_date_time isnull
  AND erank = 1
  and i.is_voided = false
  and ia.is_voided = false
   [[ and ia.enrolment_date_time >=(' || '''' || quote_literal({{ start_date }}) || '''' || '  ::DATE)]]
      [[and ia.enrolment_date_time <=' || '''' || quote_literal({{end_date}}) || '''' || ' ::DATE]]'', ''
  select   distinct
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
           left join adsr.individual_adolescent ia on i.id = ia.individual_id
           left join adsr.address a on a.id = i.address_id
  where ia.program_exit_date_time isnull
   and i.is_voided = false
    and ia.is_voided = false
    and  i.gender =''''Female''''
 [[ and ia.enrolment_date_time >=(' || '''' || quote_literal({{ start_date }}) || '''' || '  ::DATE)]]
     [[and ia.enrolment_date_time <=' || '''' || quote_literal({{end_date}}) || '''' || ' ::DATE]]
'')
UNION ALL
SELECT
''MHM Kit Used''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''
WITH individual_program_partitions AS (
    select individual_id, "MHM Kit used", encounter_date_time, earliest_visit_date_time, is_voided
    from adsr.individual_adolescent_annual_visit_baseline baseline
    where is_voided = false
      and encounter_date_time notnull
    union all
    select individual_id, "MHM Kit used", encounter_date_time, earliest_visit_date_time, is_voided
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
           when a."School" notnull then ''''School''''
           when a."Village" notnull then ''''Village''''
           when a."Boarding" notnull then ''''Boarding''''
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
WHERE "MHM Kit used" = ''''Yes''''
  and ia.program_exit_date_time isnull
  AND erank = 1
  and i.is_voided = false
  and ia.is_voided = false
  [[ and ia.enrolment_date_time >=(' || '''' || quote_literal({{ start_date }}) || '''' || '  ::DATE)]]
        [[and ia.enrolment_date_time <=' || '''' || quote_literal({{end_date}}) || '''' || ' ::DATE]]'', ''
with annual_visit_data as (
    select individual_id, "Menstruation started", encounter_date_time, earliest_visit_date_time, is_voided
    from adsr.individual_adolescent_annual_visit_baseline baseline
    where is_voided = false
      and "Menstruation started" is not null
    union all
    select individual_id, "Menstruation started", encounter_date_time, earliest_visit_date_time, is_voided
    from adsr.individual_adolescent_annual_visit_endline endline
    where is_voided = false
      and "Menstruation started" is not null)
select i.uuid   as uuid,
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
         left join individual_adolescent ia on i.id = ia.individual_id
         inner join annual_visit_data an on an.individual_id = i.id
         left join adsr.address a on a.id = i.address_id
where ia.program_exit_date_time is null
  and an."Menstruation started" =''''Yes''''
  and i.is_voided = false
    and ia.is_voided = false
   [[ and ia.enrolment_date_time >=(' || '''' || quote_literal({{ start_date }}) || '''' || '  ::DATE)]]
      [[and ia.enrolment_date_time <=' || '''' || quote_literal({{end_date}}) || '''' || ' ::DATE]]
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