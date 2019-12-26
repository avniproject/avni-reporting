-- Generated Report
-- Name: SocioDemographicsAge

with filters as (
    select coalesce( [[ {{start_date}} , ]] '1900-01-01'::timestamptz) start_date,
           coalesce( [[ {{end_date}} , ]] current_timestamp) end_date
)

SELECT * FROM crosstab('SELECT
''Age Less Than 10 ''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''

SELECT
    i.uuid uuid,
    g.name    gender_name,
    a.type    address_type,
    a.title   address_name
FROM individual i
         LEFT OUTER JOIN address_level_type_view a ON i.address_id = a.id
         LEFT OUTER JOIN gender g ON i.gender_id = g.id
         join program_enrolment_view pe on i.id = pe.individual_id
where extract(YEAR FROM age(i.date_of_birth)) < 10 and enrolment_date_time notnull and program_name=''''Adolescent''''
  and i.is_voided=false
  and pe.program_exit_date_time isnull
  and
    pe.enrolment_date_time between '''''|| (select start_date from filters) ||''''' and '''''|| (select end_date from filters) ||''''''', ''SELECT i.uuid                 uuid,
       i.gender            as gender_name,
       i.addresslevel_type as address_type,
       i.addresslevel_name as address_name
FROM individual_gender_address_view i
         join program_enrolment_view pev on i.id = pev.individual_id
where program_name = ''''Adolescent''''
  and enrolment_date_time notnull
  and pev.program_exit_date_time isnull

  and pev.enrolment_date_time between '''''|| (select start_date from filters) ||''''' and '''''|| (select end_date from filters) ||'''''
'')
UNION ALL
SELECT
''Age From 10 To 13 ''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''



SELECT
    i.uuid uuid,
    g.name    gender_name,
    a.type    address_type,
    a.title   address_name
FROM individual i
         LEFT OUTER JOIN address_level_type_view a ON i.address_id = a.id
         LEFT OUTER JOIN gender g ON i.gender_id = g.id
         join program_enrolment_view pe on i.id = pe.individual_id
where extract(YEAR FROM age(i.date_of_birth)) >= 10 AND extract(YEAR FROM age(i.date_of_birth)) <= 13 and enrolment_date_time notnull and program_name=''''Adolescent''''
  and i.is_voided=false
and pe.program_exit_date_time isnull
  and
    pe.enrolment_date_time between '''''|| (select start_date from filters) ||''''' and '''''|| (select end_date from filters) ||''''''', ''SELECT i.uuid                 uuid,
       i.gender            as gender_name,
       i.addresslevel_type as address_type,
       i.addresslevel_name as address_name
FROM individual_gender_address_view i
         join program_enrolment_view pev on i.id = pev.individual_id
where program_name = ''''Adolescent''''
  and enrolment_date_time notnull
  and pev.program_exit_date_time isnull

  and pev.enrolment_date_time between '''''|| (select start_date from filters) ||''''' and '''''|| (select end_date from filters) ||'''''
'')
UNION ALL
SELECT
''Age From 14 To 17 ''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''SELECT
    i.uuid uuid,
    g.name    gender_name,
    a.type    address_type,
    a.title   address_name
FROM individual i
         LEFT OUTER JOIN address_level_type_view a ON i.address_id = a.id
         LEFT OUTER JOIN gender g ON i.gender_id = g.id
         join program_enrolment_view pe on i.id = pe.individual_id
where extract(YEAR FROM age(i.date_of_birth)) >= 14 AND extract(YEAR FROM age(i.date_of_birth)) <= 17 and enrolment_date_time notnull and program_name=''''Adolescent''''

  and i.is_voided=false
  and pe.program_exit_date_time isnull

  and
    pe.enrolment_date_time between '''''|| (select start_date from filters) ||''''' and '''''|| (select end_date from filters) ||''''''', ''SELECT i.uuid                 uuid,
       i.gender            as gender_name,
       i.addresslevel_type as address_type,
       i.addresslevel_name as address_name
FROM individual_gender_address_view i
         join program_enrolment_view pev on i.id = pev.individual_id
where program_name = ''''Adolescent''''
  and enrolment_date_time notnull
  and pev.program_exit_date_time isnull

  and pev.enrolment_date_time between '''''|| (select start_date from filters) ||''''' and '''''|| (select end_date from filters) ||'''''
'')
UNION ALL
SELECT
''Age From 18 To 21 ''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''
SELECT
    i.uuid uuid,
    g.name    gender_name,
    a.type    address_type,
    a.title   address_name
FROM individual i
         LEFT OUTER JOIN address_level_type_view a ON i.address_id = a.id
         LEFT OUTER JOIN gender g ON i.gender_id = g.id
         join program_enrolment_view pe on i.id = pe.individual_id
where extract(YEAR FROM age(i.date_of_birth)) >= 18 AND extract(YEAR FROM age(i.date_of_birth)) <= 21 and enrolment_date_time notnull and program_name=''''Adolescent''''
  and i.is_voided=false
 and pe.program_exit_date_time isnull
  and    pe.enrolment_date_time between '''''|| (select start_date from filters) ||''''' and '''''|| (select end_date from filters) ||''''''', ''SELECT i.uuid                 uuid,
       i.gender            as gender_name,
       i.addresslevel_type as address_type,
       i.addresslevel_name as address_name
FROM individual_gender_address_view i
         join program_enrolment_view pev on i.id = pev.individual_id
where program_name = ''''Adolescent''''
  and enrolment_date_time notnull
  and pev.program_exit_date_time isnull

  and pev.enrolment_date_time between '''''|| (select start_date from filters) ||''''' and '''''|| (select end_date from filters) ||'''''
'')
UNION ALL
SELECT
''Age Above 21 ''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''

SELECT
    i.uuid uuid,
    g.name    gender_name,
    a.type    address_type,
    a.title   address_name
FROM individual i
         LEFT OUTER JOIN address_level_type_view a ON i.address_id = a.id
         LEFT OUTER JOIN gender g ON i.gender_id = g.id
         join program_enrolment_view pe on i.id = pe.individual_id
where extract(YEAR FROM age(i.date_of_birth))>21 and enrolment_date_time notnull and program_name=''''Adolescent''''
and i.is_voided=false
and pe.program_exit_date_time isnull

  and
    pe.enrolment_date_time between '''''|| (select start_date from filters) ||''''' and '''''|| (select end_date from filters) ||''''''', ''SELECT i.uuid                 uuid,
       i.gender            as gender_name,
       i.addresslevel_type as address_type,
       i.addresslevel_name as address_name
FROM individual_gender_address_view i
         join program_enrolment_view pev on i.id = pev.individual_id
where program_name = ''''Adolescent''''
  and enrolment_date_time notnull
  and pev.program_exit_date_time isnull

  and pev.enrolment_date_time between '''''|| (select start_date from filters) ||''''' and '''''|| (select end_date from filters) ||'''''
'')
UNION ALL
SELECT
''Total ''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''SELECT i.uuid                 uuid,
       i.gender            as gender_name,
       i.addresslevel_type as address_type,
       i.addresslevel_name as address_name
FROM individual_gender_address_view i
         join program_enrolment_view pev on i.id = pev.individual_id
where program_name = ''''Adolescent''''
  and enrolment_date_time notnull
  and pev.program_exit_date_time isnull

  and pev.enrolment_date_time between '''''|| (select start_date from filters) ||''''' and '''''|| (select end_date from filters) ||'''''
'', ''SELECT i.uuid                 uuid,
       i.gender            as gender_name,
       i.addresslevel_type as address_type,
       i.addresslevel_name as address_name
FROM individual_gender_address_view i
         join program_enrolment_view pev on i.id = pev.individual_id
where program_name = ''''Adolescent''''
  and enrolment_date_time notnull
  and pev.program_exit_date_time isnull

  and pev.enrolment_date_time between '''''|| (select start_date from filters) ||''''' and '''''|| (select end_date from filters) ||'''''
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