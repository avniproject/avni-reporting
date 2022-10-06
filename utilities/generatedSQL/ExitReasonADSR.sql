-- Generated Report
-- Name: ExitReasonADSR

with filters as (
    select coalesce( [[ {{start_date}} , ]] '1900-01-01'::timestamptz) start_date,
           coalesce( [[ {{end_date}} , ]] current_timestamp) end_date
)

SELECT * FROM crosstab('SELECT
''Age more than 20 years''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''select i.uuid      uuid,
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
  and exit."Reason for exit" = ''''Age more than 20 years''''
'', ''
select i.uuid      uuid,
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
where ia.program_exit_date_time notnull'')
UNION ALL
SELECT
''Death''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''
select i.uuid      uuid,
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
  and exit."Reason for exit" = ''''Death'''''', ''
select i.uuid      uuid,
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
where ia.program_exit_date_time notnull'')
UNION ALL
SELECT
''Migration''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''
select i.uuid      uuid,
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
  and exit."Reason for exit" = ''''Migration'''''', ''
select i.uuid      uuid,
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
where ia.program_exit_date_time notnull'')
UNION ALL
SELECT
''Marriage''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''
select i.uuid      uuid,
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
  and exit."Reason for exit" = ''''Marriage'''''', ''
select i.uuid      uuid,
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
where ia.program_exit_date_time notnull'')
UNION ALL
SELECT
''Pregnancy''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''
select i.uuid      uuid,
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
  and exit."Reason for exit" =''''Pregnancy'''''', ''
select i.uuid      uuid,
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
where ia.program_exit_date_time notnull'')
UNION ALL
SELECT
''Lost to follow-up''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''
select i.uuid      uuid,
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
  and exit."Reason for exit" = ''''Lost of follow up'''''', ''
select i.uuid      uuid,
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
where ia.program_exit_date_time notnull'')
UNION ALL
SELECT
''Change of school outside intervention area''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''
select i.uuid      uuid,
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
  and exit."Reason for exit" = ''''Change of school out of intervention area'''''', ''
select i.uuid      uuid,
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
where ia.program_exit_date_time notnull'')
UNION ALL
SELECT
''Exit reason not captured''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''
select i.uuid      uuid,
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
  and exit."Reason for exit" isnull'', ''
select i.uuid      uuid,
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
where ia.program_exit_date_time notnull'')
UNION ALL
SELECT
''Total adolescents exited''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''
select i.uuid      uuid,
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
where ia.program_exit_date_time notnull'', ''
select i.uuid      uuid,
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
where ia.program_exit_date_time notnull'')') AS (
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