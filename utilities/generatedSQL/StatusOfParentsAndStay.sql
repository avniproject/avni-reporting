-- Generated Report
-- Name: StatusOfParentsAndStay

SELECT * FROM crosstab('SELECT
''Either only mother or father alive''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''SELECT i.uuid as uuid,
       i.gender as gender_name,
       i.addresslevel_type as address_type,
       i.addresslevel_name as address_name
FROM non_exited_enrolment_completed_encounters_agg_view lpe
      JOIN individual_gender_address_view i ON i.id = lpe.individual_id
      JOIN non_exited_program_enrolment_view e ON e.individual_id = i.id
WHERE lpe.program_name = ''''Adolescent''''
      AND (lpe.agg_obs @> ''''{"9083aae8-0a78-4b5b-9177-dd993e6d088c":"1645d2d8-9dc8-4a6a-ad6c-50b0cca09190"}''''
      OR lpe.agg_obs @> ''''{"9083aae8-0a78-4b5b-9177-dd993e6d088c":"6b384012-b46d-4397-b17e-a0b4fa2e4469"}'''')
      [[and e.enrolment_date_time >=(' || '''' || quote_literal({{ start_date }}) || '''' || '  ::DATE)]]
      [[and e.enrolment_date_time <=' || '''' || quote_literal({{end_date}}) || '''' || ' ::DATE]]
'', ''SELECT
  DISTINCT
  i.uuid  uuid,
  i.gender  gender_name,
  i.addresslevel_type  address_type,
  i.addresslevel_name address_name
FROM
  non_exited_program_enrolment_view enrolment
    LEFT OUTER JOIN individual_gender_address_view i ON enrolment.individual_id = i.id
WHERE enrolment.program_name = ''''Adolescent''''
      [[and enrolment.enrolment_date_time >=(' || '''' || quote_literal({{ start_date }}) || '''' || '  ::DATE)]]
      [[and enrolment.enrolment_date_time <=' || '''' || quote_literal({{end_date}}) || '''' || ' ::DATE]]'')
UNION ALL
SELECT
''Both parents expired''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''SELECT i.uuid as uuid,
       i.gender as gender_name,
       i.addresslevel_type as address_type,
       i.addresslevel_name as address_name
FROM non_exited_enrolment_completed_encounters_agg_view lpe
      JOIN individual_gender_address_view i ON i.id = lpe.individual_id
      JOIN non_exited_program_enrolment_view e ON e.individual_id = i.id
WHERE lpe.program_name = ''''Adolescent''''
      AND lpe.agg_obs @> ''''{"9083aae8-0a78-4b5b-9177-dd993e6d088c":"0e7d6595-6217-4498-aa97-79c2edbb875a"}''''
      [[and e.enrolment_date_time >=(' || '''' || quote_literal({{ start_date }}) || '''' || '  ::DATE)]]
      [[and e.enrolment_date_time <=' || '''' || quote_literal({{end_date}}) || '''' || ' ::DATE]]
'', ''SELECT
  DISTINCT
  i.uuid  uuid,
  i.gender  gender_name,
  i.addresslevel_type  address_type,
  i.addresslevel_name address_name
FROM
  non_exited_program_enrolment_view enrolment
    LEFT OUTER JOIN individual_gender_address_view i ON enrolment.individual_id = i.id
WHERE enrolment.program_name = ''''Adolescent''''
      [[and enrolment.enrolment_date_time >=(' || '''' || quote_literal({{ start_date }}) || '''' || '  ::DATE)]]
      [[and enrolment.enrolment_date_time <=' || '''' || quote_literal({{end_date}}) || '''' || ' ::DATE]]'')
UNION ALL
SELECT
''Staying With Parents''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''SELECT i.uuid as uuid,
       i.gender as gender_name,
       i.addresslevel_type as address_type,
       i.addresslevel_name as address_name
FROM non_exited_enrolment_completed_encounters_agg_view lpe
      JOIN individual_gender_address_view i ON i.id = lpe.individual_id
      JOIN non_exited_program_enrolment_view e ON e.individual_id = i.id
WHERE lpe.program_name = ''''Adolescent''''
      AND lpe.agg_obs @> ''''{"eb47f6b7-1f64-4008-87f3-a781c7c342cd":"fdad6445-316c-4cb7-a327-332e25469dc7"}''''
      [[and e.enrolment_date_time >=(' || '''' || quote_literal({{ start_date }}) || '''' || '  ::DATE)]]
      [[and e.enrolment_date_time <=' || '''' || quote_literal({{end_date}}) || '''' || ' ::DATE]]'', ''SELECT
  DISTINCT
  i.uuid  uuid,
  i.gender  gender_name,
  i.addresslevel_type  address_type,
  i.addresslevel_name address_name
FROM
  non_exited_program_enrolment_view enrolment
    LEFT OUTER JOIN individual_gender_address_view i ON enrolment.individual_id = i.id
WHERE enrolment.program_name = ''''Adolescent''''
      [[and enrolment.enrolment_date_time >=(' || '''' || quote_literal({{ start_date }}) || '''' || '  ::DATE)]]
      [[and enrolment.enrolment_date_time <=' || '''' || quote_literal({{end_date}}) || '''' || ' ::DATE]]'')
UNION ALL
SELECT
''Staying In Hostel''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''SELECT i.uuid as uuid,
       i.gender as gender_name,
       i.addresslevel_type as address_type,
       i.addresslevel_name as address_name
FROM non_exited_enrolment_completed_encounters_agg_view lpe
      JOIN individual_gender_address_view i ON i.id = lpe.individual_id
      JOIN non_exited_program_enrolment_view e ON e.individual_id = i.id
WHERE lpe.program_name = ''''Adolescent''''
      AND lpe.agg_obs @> ''''{"eb47f6b7-1f64-4008-87f3-a781c7c342cd":"b14dc6d9-c724-4005-b407-77b365e8241d"}''''
      [[and e.enrolment_date_time >=(' || '''' || quote_literal({{ start_date }}) || '''' || '  ::DATE)]]
      [[and e.enrolment_date_time <=' || '''' || quote_literal({{end_date}}) || '''' || ' ::DATE]]'', ''SELECT
  DISTINCT
  i.uuid  uuid,
  i.gender  gender_name,
  i.addresslevel_type  address_type,
  i.addresslevel_name address_name
FROM
  non_exited_program_enrolment_view enrolment
    LEFT OUTER JOIN individual_gender_address_view i ON enrolment.individual_id = i.id
WHERE enrolment.program_name = ''''Adolescent''''
      [[and enrolment.enrolment_date_time >=(' || '''' || quote_literal({{ start_date }}) || '''' || '  ::DATE)]]
      [[and enrolment.enrolment_date_time <=' || '''' || quote_literal({{end_date}}) || '''' || ' ::DATE]]'')
UNION ALL
SELECT
''Staying With Relatives''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''SELECT i.uuid as uuid,
       i.gender as gender_name,
       i.addresslevel_type as address_type,
       i.addresslevel_name as address_name
FROM non_exited_enrolment_completed_encounters_agg_view lpe
      JOIN individual_gender_address_view i ON i.id = lpe.individual_id
      JOIN non_exited_program_enrolment_view e ON e.individual_id = i.id
WHERE lpe.program_name = ''''Adolescent''''
      AND lpe.agg_obs @> ''''{"eb47f6b7-1f64-4008-87f3-a781c7c342cd":"bf99bcf7-5046-4835-9eb3-6fc5d558d60b"}''''
      [[and e.enrolment_date_time >=(' || '''' || quote_literal({{ start_date }}) || '''' || '  ::DATE)]]
      [[and e.enrolment_date_time <=' || '''' || quote_literal({{end_date}}) || '''' || ' ::DATE]]'', ''SELECT
  DISTINCT
  i.uuid  uuid,
  i.gender  gender_name,
  i.addresslevel_type  address_type,
  i.addresslevel_name address_name
FROM
  non_exited_program_enrolment_view enrolment
    LEFT OUTER JOIN individual_gender_address_view i ON enrolment.individual_id = i.id
WHERE enrolment.program_name = ''''Adolescent''''
      [[and enrolment.enrolment_date_time >=(' || '''' || quote_literal({{ start_date }}) || '''' || '  ::DATE)]]
      [[and enrolment.enrolment_date_time <=' || '''' || quote_literal({{end_date}}) || '''' || ' ::DATE]]'')') AS (
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