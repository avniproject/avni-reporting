-- Generated Report
-- Name: SocioDemographicsCaste

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
WHERE i.observations @> ''''{"61ab6413-5c6a-4512-ab6e-7d5cd1439569":"dd076e03-68ae-4b53-adf6-641c69b9a518"}''''
[[ and i.registration_date >=(' || '''' || quote_literal({{ start_date }}) || '''' || '  ::DATE)]]
  [[and i.registration_date <=' || '''' || quote_literal({{end_date}}) || '''' || ' ::DATE]]
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
WHERE i.observations @> ''''{"61ab6413-5c6a-4512-ab6e-7d5cd1439569":"a3519a96-350e-4da4-90d9-827c0ff15538"}''''
[[ and i.registration_date >=(' || '''' || quote_literal({{ start_date }}) || '''' || '  ::DATE)]]
  [[and i.registration_date <=' || '''' || quote_literal({{end_date}}) || '''' || ' ::DATE]]
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
WHERE i.observations @> ''''{"61ab6413-5c6a-4512-ab6e-7d5cd1439569":"e92925ed-4a15-40c0-a0a7-a21c965dad48"}''''
[[ and i.registration_date >=(' || '''' || quote_literal({{ start_date }}) || '''' || '  ::DATE)]]
  [[and i.registration_date <=' || '''' || quote_literal({{end_date}}) || '''' || ' ::DATE]]
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
WHERE i.observations @> ''''{"61ab6413-5c6a-4512-ab6e-7d5cd1439569":"cae99772-b389-4baf-849b-9c7c2b06c951"}''''
[[ and i.registration_date >=(' || '''' || quote_literal({{ start_date }}) || '''' || '  ::DATE)]]
  [[and i.registration_date <=' || '''' || quote_literal({{end_date}}) || '''' || ' ::DATE]]
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