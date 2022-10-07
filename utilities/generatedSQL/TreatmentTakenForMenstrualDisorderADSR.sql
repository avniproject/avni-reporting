-- Generated Report
-- Name: TreatmentTakenForMenstrualDisorderADSR

with filters as (
    select coalesce( [[ {{start_date}} , ]] '1900-01-01'::timestamptz) start_date,
           coalesce( [[ {{end_date}} , ]] current_timestamp) end_date
)

SELECT * FROM crosstab('SELECT
''Total girls menstruating''                                          rowid,
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
      and ia.is_voided = false'', ''
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
      and ia.is_voided = false'')
UNION ALL
SELECT
''Disorder''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''
with annual_visit_data as (
    select individual_id, "Menstrual disorder", encounter_date_time, earliest_visit_date_time, is_voided
    from adsr.individual_adolescent_annual_visit_baseline baseline
    where is_voided = false
      and "Menstrual disorder" is not null
    union all
    select individual_id, "Menstrual disorder", encounter_date_time, earliest_visit_date_time, is_voided
    from adsr.individual_adolescent_annual_visit_endline endline
    where is_voided = false
      and "Menstrual disorder" is not null)
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
  and an."Menstrual disorder" <> ''''No problem'''''', ''
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
      and ia.is_voided = false'')
UNION ALL
SELECT
''Treatment Taken''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''with annual_visit_data as (
    select individual_id, "Any treatment taken", encounter_date_time, earliest_visit_date_time, is_voided
    from adsr.individual_adolescent_annual_visit_baseline baseline
    where is_voided = false
      and "Any treatment taken" is not null
    union all
    select individual_id, "Any treatment taken", encounter_date_time, earliest_visit_date_time, is_voided
    from adsr.individual_adolescent_annual_visit_endline endline
    where is_voided = false
      and "Any treatment taken" is not null)
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
  and an."Any treatment taken" <> ''''No treatment taken'''''', ''
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
      and ia.is_voided = false'')
UNION ALL
SELECT
''Home Remedy''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''with annual_visit_data as (
    select individual_id, "Any treatment taken", encounter_date_time, earliest_visit_date_time, is_voided
    from adsr.individual_adolescent_annual_visit_baseline baseline
    where is_voided = false
      and "Any treatment taken" is not null
    union all
    select individual_id, "Any treatment taken", encounter_date_time, earliest_visit_date_time, is_voided
    from adsr.individual_adolescent_annual_visit_endline endline
    where is_voided = false
      and "Any treatment taken" is not null)
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
  and an."Any treatment taken" = ''''Home remedy'''''', ''
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
      and ia.is_voided = false'')
UNION ALL
SELECT
''Consulted Doctor''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''with annual_visit_data as (
    select individual_id, "Any treatment taken", encounter_date_time, earliest_visit_date_time, is_voided
    from adsr.individual_adolescent_annual_visit_baseline baseline
    where is_voided = false
      and "Any treatment taken" is not null
    union all
    select individual_id, "Any treatment taken", encounter_date_time, earliest_visit_date_time, is_voided
    from adsr.individual_adolescent_annual_visit_endline endline
    where is_voided = false
      and "Any treatment taken" is not null)
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
  and an."Any treatment taken" = ''''Consult doctor'''''', ''
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
      and ia.is_voided = false'')
UNION ALL
SELECT
''Tablet From Shop''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''    with annual_visit_data as (
          select individual_id, "Any treatment taken", encounter_date_time, earliest_visit_date_time, is_voided
          from adsr.individual_adolescent_annual_visit_baseline baseline
          where is_voided = false
            and "Any treatment taken" is not null
          union all
          select individual_id, "Any treatment taken", encounter_date_time, earliest_visit_date_time, is_voided
          from adsr.individual_adolescent_annual_visit_endline endline
          where is_voided = false
            and "Any treatment taken" is not null)
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
        and an."Any treatment taken" = ''''Tablet from shop'''''', ''
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
      and ia.is_voided = false'')
UNION ALL
SELECT
''Tablet From Kit''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''    with annual_visit_data as (
          select individual_id, "Any treatment taken", encounter_date_time, earliest_visit_date_time, is_voided
          from adsr.individual_adolescent_annual_visit_baseline baseline
          where is_voided = false
            and "Any treatment taken" is not null
          union all
          select individual_id, "Any treatment taken", encounter_date_time, earliest_visit_date_time, is_voided
          from adsr.individual_adolescent_annual_visit_endline endline
          where is_voided = false
            and "Any treatment taken" is not null)
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
        and an."Any treatment taken" = ''''Table from kit'''''', ''
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
      and ia.is_voided = false'')') AS (
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