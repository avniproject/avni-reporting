-- Generated Report
-- Name: ExitReason

SELECT * FROM crosstab('SELECT
''Age more than 20 years''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''SELECT DISTINCT i.uuid              uuid,
                i.gender            gender_name,
                i.addresslevel_type address_type,
                i.addresslevel_name address_name
FROM program_enrolment_view enrolment
       LEFT OUTER JOIN individual_gender_address_view i ON enrolment.individual_id = i.id
WHERE program_exit_date_time NOTNULL
  AND enrolment.program_name = ''''Adolescent''''
  AND enrolment.program_exit_observations @>
      ''''{"04d33465-0cd3-4755-8329-b057a3d8f707":"569a0841-46a8-4397-b179-4a1c27a54ea0"}''''
'', ''SELECT DISTINCT i.uuid              uuid,
                i.gender            gender_name,
                i.addresslevel_type address_type,
                i.addresslevel_name address_name
FROM program_enrolment_view enrolment
       LEFT OUTER JOIN individual_gender_address_view i ON enrolment.individual_id = i.id
WHERE program_exit_date_time NOTNULL AND enrolment.program_name = ''''Adolescent''''
'')
UNION ALL
SELECT
''Death''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''SELECT DISTINCT i.uuid              uuid,
                i.gender            gender_name,
                i.addresslevel_type address_type,
                i.addresslevel_name address_name
FROM program_enrolment_view enrolment
       LEFT OUTER JOIN individual_gender_address_view i ON enrolment.individual_id = i.id
WHERE program_exit_date_time NOTNULL
  AND enrolment.program_name = ''''Adolescent''''
  AND enrolment.program_exit_observations @>
      ''''{"04d33465-0cd3-4755-8329-b057a3d8f707":"afff87d7-4c40-4dd4-9bf7-8e5d9adb3b83"}''''
'', ''SELECT DISTINCT i.uuid              uuid,
                i.gender            gender_name,
                i.addresslevel_type address_type,
                i.addresslevel_name address_name
FROM program_enrolment_view enrolment
       LEFT OUTER JOIN individual_gender_address_view i ON enrolment.individual_id = i.id
WHERE program_exit_date_time NOTNULL AND enrolment.program_name = ''''Adolescent''''
'')
UNION ALL
SELECT
''Migration''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''SELECT DISTINCT i.uuid              uuid,
                i.gender            gender_name,
                i.addresslevel_type address_type,
                i.addresslevel_name address_name
FROM program_enrolment_view enrolment
       LEFT OUTER JOIN individual_gender_address_view i ON enrolment.individual_id = i.id
WHERE program_exit_date_time NOTNULL
  AND enrolment.program_name = ''''Adolescent''''
  AND enrolment.program_exit_observations @>
      ''''{"04d33465-0cd3-4755-8329-b057a3d8f707":"229fac5f-468e-46f0-b812-bdcc56840b6c"}''''
'', ''SELECT DISTINCT i.uuid              uuid,
                i.gender            gender_name,
                i.addresslevel_type address_type,
                i.addresslevel_name address_name
FROM program_enrolment_view enrolment
       LEFT OUTER JOIN individual_gender_address_view i ON enrolment.individual_id = i.id
WHERE program_exit_date_time NOTNULL AND enrolment.program_name = ''''Adolescent''''
'')
UNION ALL
SELECT
''Marriage''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''SELECT DISTINCT i.uuid              uuid,
                i.gender            gender_name,
                i.addresslevel_type address_type,
                i.addresslevel_name address_name
FROM program_enrolment_view enrolment
       LEFT OUTER JOIN individual_gender_address_view i ON enrolment.individual_id = i.id
WHERE program_exit_date_time NOTNULL
  AND enrolment.program_name = ''''Adolescent''''
  AND enrolment.program_exit_observations @>
      ''''{"04d33465-0cd3-4755-8329-b057a3d8f707":"104c7ffb-fb43-45a0-876b-77fba9ee7759"}''''
'', ''SELECT DISTINCT i.uuid              uuid,
                i.gender            gender_name,
                i.addresslevel_type address_type,
                i.addresslevel_name address_name
FROM program_enrolment_view enrolment
       LEFT OUTER JOIN individual_gender_address_view i ON enrolment.individual_id = i.id
WHERE program_exit_date_time NOTNULL AND enrolment.program_name = ''''Adolescent''''
'')
UNION ALL
SELECT
''Pregnancy''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''SELECT DISTINCT i.uuid              uuid,
                i.gender            gender_name,
                i.addresslevel_type address_type,
                i.addresslevel_name address_name
FROM program_enrolment_view enrolment
       LEFT OUTER JOIN individual_gender_address_view i ON enrolment.individual_id = i.id
WHERE program_exit_date_time NOTNULL
  AND enrolment.program_name = ''''Adolescent''''
  AND enrolment.program_exit_observations @>
      ''''{"04d33465-0cd3-4755-8329-b057a3d8f707":"adc37af2-06c1-4adf-9f10-0e121b8a49b8"}''''
'', ''SELECT DISTINCT i.uuid              uuid,
                i.gender            gender_name,
                i.addresslevel_type address_type,
                i.addresslevel_name address_name
FROM program_enrolment_view enrolment
       LEFT OUTER JOIN individual_gender_address_view i ON enrolment.individual_id = i.id
WHERE program_exit_date_time NOTNULL AND enrolment.program_name = ''''Adolescent''''
'')
UNION ALL
SELECT
''Lost to follow-up''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''SELECT DISTINCT i.uuid              uuid,
                i.gender            gender_name,
                i.addresslevel_type address_type,
                i.addresslevel_name address_name
FROM program_enrolment_view enrolment
       LEFT OUTER JOIN individual_gender_address_view i ON enrolment.individual_id = i.id
WHERE program_exit_date_time NOTNULL
  AND enrolment.program_name = ''''Adolescent''''
  AND enrolment.program_exit_observations @>
      ''''{"04d33465-0cd3-4755-8329-b057a3d8f707":"d55d0635-c101-466f-a624-e72d7223eeb2"}''''
'', ''SELECT DISTINCT i.uuid              uuid,
                i.gender            gender_name,
                i.addresslevel_type address_type,
                i.addresslevel_name address_name
FROM program_enrolment_view enrolment
       LEFT OUTER JOIN individual_gender_address_view i ON enrolment.individual_id = i.id
WHERE program_exit_date_time NOTNULL AND enrolment.program_name = ''''Adolescent''''
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