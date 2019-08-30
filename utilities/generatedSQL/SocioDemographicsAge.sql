-- Generated Report
-- Name: SocioDemographicsAge

SELECT * FROM crosstab('SELECT
''Age 10-14''                                          rowid,
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
WHERE extract(YEAR FROM age(i.date_of_birth)) >= 10 AND extract(YEAR FROM age(i.date_of_birth)) <= 14
[[ and i.registration_date >=(' || '''' || quote_literal({{ start_date }}) || '''' || '  ::DATE)]]
  [[and i.registration_date <=' || '''' || quote_literal({{end_date}}) || '''' || ' ::DATE]]'', ''SELECT
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
''Age 15-19''                                          rowid,
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
WHERE extract(YEAR FROM age(i.date_of_birth)) > 14 AND extract(YEAR FROM age(i.date_of_birth)) <= 19
[[ and i.registration_date >=(' || '''' || quote_literal({{ start_date }}) || '''' || '  ::DATE)]]
  [[and i.registration_date <=' || '''' || quote_literal({{end_date}}) || '''' || ' ::DATE]]'', ''SELECT
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