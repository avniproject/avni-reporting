-- Generated Report
-- Name: SocioDemographicsCaste

with filters as (
    select coalesce( [[ {{start_date}} , ]] '1900-01-01'::timestamptz) start_date,
           coalesce( [[ {{end_date}} , ]] current_timestamp) end_date
)

SELECT * FROM crosstab('SELECT
''Caste ST''                                          rowid,
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
  join program_enrolment pe on i.id = pe.individual_id
WHERE i.observations @> ''''{"61ab6413-5c6a-4512-ab6e-7d5cd1439569":"dd076e03-68ae-4b53-adf6-641c69b9a518"}''''
and i.is_voided=false
 and pe.program_exit_date_time isnull
and pe.enrolment_date_time between '''''|| (select start_date from filters) ||''''' and '''''|| (select end_date from filters) ||'''''
'', ''SELECT
    i.uuid uuid,
    g.name    gender_name,
    a.type    address_type,
    a.title   address_name
FROM individual i
         LEFT OUTER JOIN address_level_type_view a ON i.address_id = a.id
         LEFT OUTER JOIN gender g ON i.gender_id = g.id
         join program_enrolment_view pe on i.id = pe.individual_id
where pe.enrolment_date_time notnull and pe.program_name=''''Adolescent''''

  and pe.program_exit_date_time isnull
and i.is_voided=false and

   pe.enrolment_date_time between '''''|| (select start_date from filters) ||''''' and '''''|| (select end_date from filters) ||''''''')
UNION ALL
SELECT
''Caste SC''                                          rowid,
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
  join program_enrolment pe on i.id = pe.individual_id
WHERE i.observations @> ''''{"61ab6413-5c6a-4512-ab6e-7d5cd1439569":"a3519a96-350e-4da4-90d9-827c0ff15538"}''''
and i.is_voided=false
 and pe.program_exit_date_time isnull
and pe.enrolment_date_time between '''''|| (select start_date from filters) ||''''' and '''''|| (select end_date from filters) ||'''''
'', ''SELECT
    i.uuid uuid,
    g.name    gender_name,
    a.type    address_type,
    a.title   address_name
FROM individual i
         LEFT OUTER JOIN address_level_type_view a ON i.address_id = a.id
         LEFT OUTER JOIN gender g ON i.gender_id = g.id
         join program_enrolment_view pe on i.id = pe.individual_id
where pe.enrolment_date_time notnull and pe.program_name=''''Adolescent''''

  and pe.program_exit_date_time isnull
and i.is_voided=false and

   pe.enrolment_date_time between '''''|| (select start_date from filters) ||''''' and '''''|| (select end_date from filters) ||''''''')
UNION ALL
SELECT
''Caste OBC''                                          rowid,
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
  join program_enrolment pe on i.id = pe.individual_id
WHERE i.observations @> ''''{"61ab6413-5c6a-4512-ab6e-7d5cd1439569":"e92925ed-4a15-40c0-a0a7-a21c965dad48"}''''
and i.is_voided=false
 and pe.program_exit_date_time isnull
and pe.enrolment_date_time between '''''|| (select start_date from filters) ||''''' and '''''|| (select end_date from filters) ||'''''
'', ''SELECT
    i.uuid uuid,
    g.name    gender_name,
    a.type    address_type,
    a.title   address_name
FROM individual i
         LEFT OUTER JOIN address_level_type_view a ON i.address_id = a.id
         LEFT OUTER JOIN gender g ON i.gender_id = g.id
         join program_enrolment_view pe on i.id = pe.individual_id
where pe.enrolment_date_time notnull and pe.program_name=''''Adolescent''''

  and pe.program_exit_date_time isnull
and i.is_voided=false and

   pe.enrolment_date_time between '''''|| (select start_date from filters) ||''''' and '''''|| (select end_date from filters) ||''''''')
UNION ALL
SELECT
''Caste General''                                          rowid,
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
  join program_enrolment pe on i.id = pe.individual_id
WHERE i.observations @> ''''{"61ab6413-5c6a-4512-ab6e-7d5cd1439569":"cae99772-b389-4baf-849b-9c7c2b06c951"}''''
and i.is_voided=false
 and pe.program_exit_date_time isnull
and pe.enrolment_date_time between '''''|| (select start_date from filters) ||''''' and '''''|| (select end_date from filters) ||'''''
'', ''SELECT
    i.uuid uuid,
    g.name    gender_name,
    a.type    address_type,
    a.title   address_name
FROM individual i
         LEFT OUTER JOIN address_level_type_view a ON i.address_id = a.id
         LEFT OUTER JOIN gender g ON i.gender_id = g.id
         join program_enrolment_view pe on i.id = pe.individual_id
where pe.enrolment_date_time notnull and pe.program_name=''''Adolescent''''

  and pe.program_exit_date_time isnull
and i.is_voided=false and

   pe.enrolment_date_time between '''''|| (select start_date from filters) ||''''' and '''''|| (select end_date from filters) ||''''''')
UNION ALL
SELECT
''Total''                                          rowid,
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
'', ''SELECT
    i.uuid uuid,
    g.name    gender_name,
    a.type    address_type,
    a.title   address_name
FROM individual i
         LEFT OUTER JOIN address_level_type_view a ON i.address_id = a.id
         LEFT OUTER JOIN gender g ON i.gender_id = g.id
         join program_enrolment_view pe on i.id = pe.individual_id
where pe.enrolment_date_time notnull and pe.program_name=''''Adolescent''''

  and pe.program_exit_date_time isnull
and i.is_voided=false and

   pe.enrolment_date_time between '''''|| (select start_date from filters) ||''''' and '''''|| (select end_date from filters) ||''''''')') AS (
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