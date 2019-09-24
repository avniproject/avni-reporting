-- Generated Report
-- Name: EnrolledExited

with filters as (
    select coalesce( [[ {{start_date}} , ]] '1900-01-01'::timestamptz) start_date,
           coalesce( [[ {{end_date}} , ]] current_timestamp) end_date
)

SELECT * FROM crosstab('SELECT
''In program''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''SELECT
  DISTINCT
  i.uuid  uuid,
  i.gender  gender_name,
  i.addresslevel_type  address_type,
  i.addresslevel_name address_name
FROM
  program_enrolment_view enrolment
  LEFT OUTER JOIN individual_gender_address_view i ON enrolment.individual_id = i.id
WHERE enrolment.program_name = ''''Adolescent''''
AND (program_exit_date_time ISNULL
  [[ OR enrolment.program_exit_date_time < (' || '''' || quote_literal({{ start_date }}) || '''' || '  ::DATE) ]]
  [[ OR enrolment.program_exit_date_time > ' || '''' || quote_literal({{ end_date }}) || '''' || ' ::DATE ]])'', ''SELECT
  DISTINCT
  i.uuid  uuid,
  i.gender as gender_name,
  i.addresslevel_type as address_type,
  i.addresslevel_name as address_name
FROM individual_gender_address_view i
'')
UNION ALL
SELECT
''Exited in this period''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''SELECT
  DISTINCT
  i.uuid  uuid,
  i.gender  gender_name,
  i.addresslevel_type  address_type,
  i.addresslevel_name address_name
FROM
  program_enrolment_view enrolment
  LEFT OUTER JOIN individual_gender_address_view i ON enrolment.individual_id = i.id
WHERE enrolment.program_name = ''''Adolescent''''
  AND program_exit_date_time NOTNULL
  [[ and enrolment.program_exit_date_time >= (' || '''' || quote_literal({{ start_date }}) || '''' || '  ::DATE) ]]
  [[ and enrolment.program_exit_date_time <= ' || '''' || quote_literal({{ end_date }}) || '''' || ' ::DATE ]]'', ''SELECT
  DISTINCT
  i.uuid  uuid,
  i.gender  gender_name,
  i.addresslevel_type  address_type,
  i.addresslevel_name address_name
FROM
  program_enrolment_view enrolment
  LEFT OUTER JOIN individual_gender_address_view i ON enrolment.individual_id = i.id
WHERE enrolment.program_name = ''''Adolescent''''
AND (program_exit_date_time ISNULL
  [[ OR enrolment.program_exit_date_time < (' || '''' || quote_literal({{ start_date }}) || '''' || '  ::DATE) ]]
  [[ OR enrolment.program_exit_date_time > ' || '''' || quote_literal({{ end_date }}) || '''' || ' ::DATE ]])'')') AS (
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