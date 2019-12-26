-- Generated Report
-- Name: SocioDemographicsRationCard

with filters as (
    select coalesce( [[ {{start_date}} , ]] '1900-01-01'::timestamptz) start_date,
           coalesce( [[ {{end_date}} , ]] current_timestamp) end_date
)

SELECT * FROM crosstab('SELECT
''APL''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''  SELECT
    i.uuid uuid,
    g.name    gender_name,
    a.type    address_type,
    a.title   address_name
FROM individual i
         LEFT OUTER JOIN address_level_type_view a ON i.address_id = a.id
         LEFT OUTER JOIN gender g ON i.gender_id = g.id
         join program_enrolment_view pe on i.id = pe.individual_id
where i.observations @>''''{"476a0b71-485b-4a0a-ba6f-4f3cf13568ca":"36008c2c-7748-426d-9784-ffc5a267db07"}''''
 and pe.enrolment_date_time notnull and pe.program_name=''''Adolescent''''
 and i.is_voided=false
   and pe.program_exit_date_time isnull
  and

    pe.enrolment_date_time between '''''|| (select start_date from filters) ||''''' and '''''|| (select end_date from filters) ||'''''
'', ''SELECT
    DISTINCT
    i.uuid  uuid,
    g.name  gender_name,
    a.type  address_type,
    a.title address_name
FROM
    individual i
    LEFT OUTER JOIN gender g ON g.id = i.gender_id
    LEFT OUTER JOIN address_level_type_view a ON i.address_id = a.id
    [[ and i.registration_date >=(' || '''' || quote_literal({{ start_date }}) || '''' || '  ::DATE)]]
    [[and i.registration_date <=' || '''' || quote_literal({{end_date}}) || '''' || ' ::DATE]]'')
UNION ALL
SELECT
''BPL''                                          rowid,
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
where i.observations @>''''{"476a0b71-485b-4a0a-ba6f-4f3cf13568ca":"5c9f10e3-3e20-4a3b-a971-f43b40dd017c"}''''
 and pe.enrolment_date_time notnull and pe.program_name=''''Adolescent''''
 and i.is_voided=false
 and pe.program_exit_date_time isnull
 and
    pe.enrolment_date_time between '''''|| (select start_date from filters) ||''''' and '''''|| (select end_date from filters) ||''''''', ''SELECT
    DISTINCT
    i.uuid  uuid,
    g.name  gender_name,
    a.type  address_type,
    a.title address_name
FROM
    individual i
    LEFT OUTER JOIN gender g ON g.id = i.gender_id
    LEFT OUTER JOIN address_level_type_view a ON i.address_id = a.id
    [[ and i.registration_date >=(' || '''' || quote_literal({{ start_date }}) || '''' || '  ::DATE)]]
    [[and i.registration_date <=' || '''' || quote_literal({{end_date}}) || '''' || ' ::DATE]]'')
UNION ALL
SELECT
''Antyodaya''                                          rowid,
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
where i.observations @>''''{"476a0b71-485b-4a0a-ba6f-4f3cf13568ca":"eace7aa2-8444-4c43-b5aa-8b5ec0b19a20"}''''
 and pe.enrolment_date_time notnull and pe.program_name=''''Adolescent''''
 and i.is_voided=false
  and pe.program_exit_date_time isnull
  and
    pe.enrolment_date_time between '''''|| (select start_date from filters) ||''''' and '''''|| (select end_date from filters) ||'''''
'', ''SELECT
    DISTINCT
    i.uuid  uuid,
    g.name  gender_name,
    a.type  address_type,
    a.title address_name
FROM
    individual i
    LEFT OUTER JOIN gender g ON g.id = i.gender_id
    LEFT OUTER JOIN address_level_type_view a ON i.address_id = a.id
    [[ and i.registration_date >=(' || '''' || quote_literal({{ start_date }}) || '''' || '  ::DATE)]]
    [[and i.registration_date <=' || '''' || quote_literal({{end_date}}) || '''' || ' ::DATE]]'')
UNION ALL
SELECT
''No''                                          rowid,
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
where i.observations @>''''{"476a0b71-485b-4a0a-ba6f-4f3cf13568ca":"e7b50c78-3d90-484d-a224-9887887780dc"}''''
 and pe.enrolment_date_time notnull and pe.program_name=''''Adolescent''''
 and i.is_voided=false
  and pe.program_exit_date_time isnull
  and
    pe.enrolment_date_time between '''''|| (select start_date from filters) ||''''' and '''''|| (select end_date from filters) ||'''''
'', ''SELECT
    DISTINCT
    i.uuid  uuid,
    g.name  gender_name,
    a.type  address_type,
    a.title address_name
FROM
    individual i
    LEFT OUTER JOIN gender g ON g.id = i.gender_id
    LEFT OUTER JOIN address_level_type_view a ON i.address_id = a.id
    [[ and i.registration_date >=(' || '''' || quote_literal({{ start_date }}) || '''' || '  ::DATE)]]
    [[and i.registration_date <=' || '''' || quote_literal({{end_date}}) || '''' || ' ::DATE]]'')
UNION ALL
SELECT
''Data Not Available''                                          rowid,
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
where i.observations->>''''476a0b71-485b-4a0a-ba6f-4f3cf13568ca'''' isnull and pe.enrolment_date_time notnull and pe.program_name=''''Adolescent''''
  and i.is_voided=false
   and pe.program_exit_date_time isnull
  and
    pe.enrolment_date_time between '''''|| (select start_date from filters) ||''''' and '''''|| (select end_date from filters) ||''''''', ''SELECT
    DISTINCT
    i.uuid  uuid,
    g.name  gender_name,
    a.type  address_type,
    a.title address_name
FROM
    individual i
    LEFT OUTER JOIN gender g ON g.id = i.gender_id
    LEFT OUTER JOIN address_level_type_view a ON i.address_id = a.id
    [[ and i.registration_date >=(' || '''' || quote_literal({{ start_date }}) || '''' || '  ::DATE)]]
    [[and i.registration_date <=' || '''' || quote_literal({{end_date}}) || '''' || ' ::DATE]]'')
UNION ALL
SELECT
''Total''                                          rowid,
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
where pe.enrolment_date_time notnull and pe.program_name=''''Adolescent''''
and i.is_voided=false
 and pe.program_exit_date_time isnull
and
   pe.enrolment_date_time between '''''|| (select start_date from filters) ||''''' and '''''|| (select end_date from filters) ||''''''', ''SELECT
    DISTINCT
    i.uuid  uuid,
    g.name  gender_name,
    a.type  address_type,
    a.title address_name
FROM
    individual i
    LEFT OUTER JOIN gender g ON g.id = i.gender_id
    LEFT OUTER JOIN address_level_type_view a ON i.address_id = a.id
    [[ and i.registration_date >=(' || '''' || quote_literal({{ start_date }}) || '''' || '  ::DATE)]]
    [[and i.registration_date <=' || '''' || quote_literal({{end_date}}) || '''' || ' ::DATE]]'')') AS (
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