-- Generated Report
-- Name: SchoolDropoutAndReadmission

SELECT * FROM crosstab('SELECT
''Adolescents who came back after one visit''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''with latest_visit as (
  select max(encounter_date_time) encounter_date_time, individual_id
  from completed_program_encounter_view pe
         INNER JOIN non_exited_program_enrolment_view e ON pe.program_enrolment_id = e.id
  WHERE e.program_name = ''''Adolescent''''
    and (pe.encounter_type_name = ''''Annual Visit'''' or pe.encounter_type_name = ''''Quarterly Visit'''')
  group by e.individual_id
),
     all_dropout_visits_after_latest_visit as (
       select i.uuid                                                                  uuid,
              i.gender                                                                gender_name,
              i.addresslevel_type                                                     address_type,
              i.addresslevel_name                                                     address_name,
              row_number()
                  OVER (PARTITION BY i.uuid ORDER BY pe.encounter_date_time ASC)      visit_number,
              single_select_coded(
                    pe.observations ->> ''''dcfc771a-0785-43be-bcb1-0d2755793e0e'''') :: TEXT joined_school,
              pe.encounter_date_time
       from completed_program_encounter_view pe
              INNER JOIN non_exited_program_enrolment_view e ON pe.program_enrolment_id = e.id
              INNER JOIN latest_visit v ON v.individual_id = e.individual_id
              LEFT OUTER JOIN individual_gender_address_view i ON i.id = e.individual_id
       WHERE e.program_name = ''''Adolescent''''
         and pe.encounter_type_name = ''''Dropout Followup Visit''''
         and pe.encounter_date_time >= v.encounter_date_time
     )
select uuid,
       gender_name,
       address_type,
       address_name
from all_dropout_visits_after_latest_visit
where joined_school = ''''Yes, started''''
  and visit_number = 1;
'', ''WITH individual_program_partitions AS (
  SELECT i.uuid          AS                                                                                   iuuid,
         row_number() OVER (PARTITION BY i.uuid ORDER BY pe.encounter_date_time desc) erank,
         pe.uuid         AS                                                                                   euuid,
         pe.observations AS                                                                                   obs,
         pe.encounter_date_time
  FROM completed_program_encounter_view pe
         INNER JOIN non_exited_program_enrolment_view e ON pe.program_enrolment_id = e.id
         INNER JOIN individual_view i ON e.individual_id = i.id
  WHERE e.program_name = ''''Adolescent''''
    and (pe.encounter_type_name = ''''Annual Visit'''' or pe.encounter_type_name = ''''Quarterly Visit'''')
)
SELECT
  ip.iuuid            uuid,
  i.gender            gender_name,
  i.addresslevel_type address_type,
  i.addresslevel_name address_name
FROM individual_program_partitions ip
       LEFT OUTER JOIN individual_gender_address_view i ON i.uuid = ip.iuuid
WHERE ip.obs @> ''''{"575a29c3-a070-4c7d-ac96-fe58b6bddca3": "58f789aa-6570-4aea-87a7-1f7651729c5a"}''''
  AND erank = 1
'')
UNION ALL
SELECT
''Adolescents who came back after two visit''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''with latest_visit as (
  select max(encounter_date_time) encounter_date_time, individual_id
  from completed_program_encounter_view pe
         INNER JOIN non_exited_program_enrolment_view e ON pe.program_enrolment_id = e.id
  WHERE e.program_name = ''''Adolescent''''
    and (pe.encounter_type_name = ''''Annual Visit'''' or pe.encounter_type_name = ''''Quarterly Visit'''')
  group by e.individual_id
),
     all_dropout_visits_after_latest_visit as (
       select i.uuid                                                                  uuid,
              i.gender                                                                gender_name,
              i.addresslevel_type                                                     address_type,
              i.addresslevel_name                                                     address_name,
              row_number()
                  OVER (PARTITION BY i.uuid ORDER BY pe.encounter_date_time ASC)      visit_number,
              single_select_coded(
                    pe.observations ->> ''''dcfc771a-0785-43be-bcb1-0d2755793e0e'''') :: TEXT joined_school,
              pe.encounter_date_time
       from completed_program_encounter_view pe
              INNER JOIN non_exited_program_enrolment_view e ON pe.program_enrolment_id = e.id
              INNER JOIN latest_visit v ON v.individual_id = e.individual_id
              LEFT OUTER JOIN individual_gender_address_view i ON i.id = e.individual_id
       WHERE e.program_name = ''''Adolescent''''
         and pe.encounter_type_name = ''''Dropout Followup Visit''''
         and pe.encounter_date_time >= v.encounter_date_time
     )
select uuid,
       gender_name,
       address_type,
       address_name
from all_dropout_visits_after_latest_visit
where joined_school = ''''Yes, started''''
  and visit_number = 2;
'', ''WITH individual_program_partitions AS (
  SELECT i.uuid          AS                                                                                   iuuid,
         row_number() OVER (PARTITION BY i.uuid ORDER BY pe.encounter_date_time desc) erank,
         pe.uuid         AS                                                                                   euuid,
         pe.observations AS                                                                                   obs,
         pe.encounter_date_time
  FROM completed_program_encounter_view pe
         INNER JOIN non_exited_program_enrolment_view e ON pe.program_enrolment_id = e.id
         INNER JOIN individual_view i ON e.individual_id = i.id
  WHERE e.program_name = ''''Adolescent''''
    and (pe.encounter_type_name = ''''Annual Visit'''' or pe.encounter_type_name = ''''Quarterly Visit'''')
)
SELECT
  ip.iuuid            uuid,
  i.gender            gender_name,
  i.addresslevel_type address_type,
  i.addresslevel_name address_name
FROM individual_program_partitions ip
       LEFT OUTER JOIN individual_gender_address_view i ON i.uuid = ip.iuuid
WHERE ip.obs @> ''''{"575a29c3-a070-4c7d-ac96-fe58b6bddca3": "58f789aa-6570-4aea-87a7-1f7651729c5a"}''''
  AND erank = 1
'')
UNION ALL
SELECT
''Adolescents who came back after three visit''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''with latest_visit as (
  select max(encounter_date_time) encounter_date_time, individual_id
  from completed_program_encounter_view pe
         INNER JOIN non_exited_program_enrolment_view e ON pe.program_enrolment_id = e.id
  WHERE e.program_name = ''''Adolescent''''
    and (pe.encounter_type_name = ''''Annual Visit'''' or pe.encounter_type_name = ''''Quarterly Visit'''')
  group by e.individual_id
),
     all_dropout_visits_after_latest_visit as (
       select i.uuid                                                                  uuid,
              i.gender                                                                gender_name,
              i.addresslevel_type                                                     address_type,
              i.addresslevel_name                                                     address_name,
              row_number()
                  OVER (PARTITION BY i.uuid ORDER BY pe.encounter_date_time ASC)      visit_number,
              single_select_coded(
                    pe.observations ->> ''''dcfc771a-0785-43be-bcb1-0d2755793e0e'''') :: TEXT joined_school,
              pe.encounter_date_time
       from completed_program_encounter_view pe
              INNER JOIN non_exited_program_enrolment_view e ON pe.program_enrolment_id = e.id
              INNER JOIN latest_visit v ON v.individual_id = e.individual_id
              LEFT OUTER JOIN individual_gender_address_view i ON i.id = e.individual_id
       WHERE e.program_name = ''''Adolescent''''
         and pe.encounter_type_name = ''''Dropout Followup Visit''''
         and pe.encounter_date_time >= v.encounter_date_time
     )
select uuid,
       gender_name,
       address_type,
       address_name
from all_dropout_visits_after_latest_visit
where joined_school = ''''Yes, started''''
  and visit_number = 3;
'', ''WITH individual_program_partitions AS (
  SELECT i.uuid          AS                                                                                   iuuid,
         row_number() OVER (PARTITION BY i.uuid ORDER BY pe.encounter_date_time desc) erank,
         pe.uuid         AS                                                                                   euuid,
         pe.observations AS                                                                                   obs,
         pe.encounter_date_time
  FROM completed_program_encounter_view pe
         INNER JOIN non_exited_program_enrolment_view e ON pe.program_enrolment_id = e.id
         INNER JOIN individual_view i ON e.individual_id = i.id
  WHERE e.program_name = ''''Adolescent''''
    and (pe.encounter_type_name = ''''Annual Visit'''' or pe.encounter_type_name = ''''Quarterly Visit'''')
)
SELECT
  ip.iuuid            uuid,
  i.gender            gender_name,
  i.addresslevel_type address_type,
  i.addresslevel_name address_name
FROM individual_program_partitions ip
       LEFT OUTER JOIN individual_gender_address_view i ON i.uuid = ip.iuuid
WHERE ip.obs @> ''''{"575a29c3-a070-4c7d-ac96-fe58b6bddca3": "58f789aa-6570-4aea-87a7-1f7651729c5a"}''''
  AND erank = 1
'')
UNION ALL
SELECT
''Adolescents who came back after 4 visits''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''with latest_visit as (
  select max(encounter_date_time) encounter_date_time, individual_id
  from completed_program_encounter_view pe
         INNER JOIN non_exited_program_enrolment_view e ON pe.program_enrolment_id = e.id
  WHERE e.program_name = ''''Adolescent''''
    and (pe.encounter_type_name = ''''Annual Visit'''' or pe.encounter_type_name = ''''Quarterly Visit'''')
  group by e.individual_id
),
     all_dropout_visits_after_latest_visit as (
       select i.uuid                                                                  uuid,
              i.gender                                                                gender_name,
              i.addresslevel_type                                                     address_type,
              i.addresslevel_name                                                     address_name,
              row_number()
                  OVER (PARTITION BY i.uuid ORDER BY pe.encounter_date_time ASC)      visit_number,
              single_select_coded(
                    pe.observations ->> ''''dcfc771a-0785-43be-bcb1-0d2755793e0e'''') :: TEXT joined_school,
              pe.encounter_date_time
       from completed_program_encounter_view pe
              INNER JOIN non_exited_program_enrolment_view e ON pe.program_enrolment_id = e.id
              INNER JOIN latest_visit v ON v.individual_id = e.individual_id
              LEFT OUTER JOIN individual_gender_address_view i ON i.id = e.individual_id
       WHERE e.program_name = ''''Adolescent''''
         and pe.encounter_type_name = ''''Dropout Followup Visit''''
         and pe.encounter_date_time >= v.encounter_date_time
     )
select uuid,
       gender_name,
       address_type,
       address_name
from all_dropout_visits_after_latest_visit
where joined_school = ''''Yes, started''''
  and visit_number = 4;
'', ''WITH individual_program_partitions AS (
  SELECT i.uuid          AS                                                                                   iuuid,
         row_number() OVER (PARTITION BY i.uuid ORDER BY pe.encounter_date_time desc) erank,
         pe.uuid         AS                                                                                   euuid,
         pe.observations AS                                                                                   obs,
         pe.encounter_date_time
  FROM completed_program_encounter_view pe
         INNER JOIN non_exited_program_enrolment_view e ON pe.program_enrolment_id = e.id
         INNER JOIN individual_view i ON e.individual_id = i.id
  WHERE e.program_name = ''''Adolescent''''
    and (pe.encounter_type_name = ''''Annual Visit'''' or pe.encounter_type_name = ''''Quarterly Visit'''')
)
SELECT
  ip.iuuid            uuid,
  i.gender            gender_name,
  i.addresslevel_type address_type,
  i.addresslevel_name address_name
FROM individual_program_partitions ip
       LEFT OUTER JOIN individual_gender_address_view i ON i.uuid = ip.iuuid
WHERE ip.obs @> ''''{"575a29c3-a070-4c7d-ac96-fe58b6bddca3": "58f789aa-6570-4aea-87a7-1f7651729c5a"}''''
  AND erank = 1
'')
UNION ALL
SELECT
''Adolescents who came back after 5 visits''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''with latest_visit as (
  select max(encounter_date_time) encounter_date_time, individual_id
  from completed_program_encounter_view pe
         INNER JOIN non_exited_program_enrolment_view e ON pe.program_enrolment_id = e.id
  WHERE e.program_name = ''''Adolescent''''
    and (pe.encounter_type_name = ''''Annual Visit'''' or pe.encounter_type_name = ''''Quarterly Visit'''')
  group by e.individual_id
),
     all_dropout_visits_after_latest_visit as (
       select i.uuid                                                                  uuid,
              i.gender                                                                gender_name,
              i.addresslevel_type                                                     address_type,
              i.addresslevel_name                                                     address_name,
              row_number()
                  OVER (PARTITION BY i.uuid ORDER BY pe.encounter_date_time ASC)      visit_number,
              single_select_coded(
                    pe.observations ->> ''''dcfc771a-0785-43be-bcb1-0d2755793e0e'''') :: TEXT joined_school,
              pe.encounter_date_time
       from completed_program_encounter_view pe
              INNER JOIN non_exited_program_enrolment_view e ON pe.program_enrolment_id = e.id
              INNER JOIN latest_visit v ON v.individual_id = e.individual_id
              LEFT OUTER JOIN individual_gender_address_view i ON i.id = e.individual_id
       WHERE e.program_name = ''''Adolescent''''
         and pe.encounter_type_name = ''''Dropout Followup Visit''''
         and pe.encounter_date_time >= v.encounter_date_time
     )
select uuid,
       gender_name,
       address_type,
       address_name
from all_dropout_visits_after_latest_visit
where joined_school = ''''Yes, started''''
  and visit_number = 5;
'', ''WITH individual_program_partitions AS (
  SELECT i.uuid          AS                                                                                   iuuid,
         row_number() OVER (PARTITION BY i.uuid ORDER BY pe.encounter_date_time desc) erank,
         pe.uuid         AS                                                                                   euuid,
         pe.observations AS                                                                                   obs,
         pe.encounter_date_time
  FROM completed_program_encounter_view pe
         INNER JOIN non_exited_program_enrolment_view e ON pe.program_enrolment_id = e.id
         INNER JOIN individual_view i ON e.individual_id = i.id
  WHERE e.program_name = ''''Adolescent''''
    and (pe.encounter_type_name = ''''Annual Visit'''' or pe.encounter_type_name = ''''Quarterly Visit'''')
)
SELECT
  ip.iuuid            uuid,
  i.gender            gender_name,
  i.addresslevel_type address_type,
  i.addresslevel_name address_name
FROM individual_program_partitions ip
       LEFT OUTER JOIN individual_gender_address_view i ON i.uuid = ip.iuuid
WHERE ip.obs @> ''''{"575a29c3-a070-4c7d-ac96-fe58b6bddca3": "58f789aa-6570-4aea-87a7-1f7651729c5a"}''''
  AND erank = 1
'')
UNION ALL
SELECT
''Did not come back''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''with latest_visit as (
  select max(encounter_date_time) encounter_date_time, individual_id
  from completed_program_encounter_view pe
         INNER JOIN non_exited_program_enrolment_view e ON pe.program_enrolment_id = e.id
  WHERE e.program_name = ''''Adolescent''''
    and (pe.encounter_type_name = ''''Annual Visit'''' or pe.encounter_type_name = ''''Quarterly Visit'''')
  group by e.individual_id
),
     all_dropout_visits_after_latest_visit as (
       select i.uuid                                                                  uuid,
              i.gender                                                                gender_name,
              i.addresslevel_type                                                     address_type,
              i.addresslevel_name                                                     address_name,
              row_number()
                  OVER (PARTITION BY i.uuid ORDER BY pe.encounter_date_time DESC)     rank,
              single_select_coded(
                    pe.observations ->> ''''dcfc771a-0785-43be-bcb1-0d2755793e0e'''') :: TEXT joined_school,
              pe.encounter_date_time
       from completed_program_encounter_view pe
              INNER JOIN non_exited_program_enrolment_view e ON pe.program_enrolment_id = e.id
              INNER JOIN latest_visit v ON v.individual_id = e.individual_id
              LEFT OUTER JOIN individual_gender_address_view i ON i.id = e.individual_id
       WHERE e.program_name = ''''Adolescent''''
         and pe.encounter_type_name = ''''Dropout Followup Visit''''
         and pe.encounter_date_time >= v.encounter_date_time
     )
select uuid,
       gender_name,
       address_type,
       address_name
from all_dropout_visits_after_latest_visit
where joined_school <> ''''Yes, started''''
  and rank = 1;
'', ''WITH individual_program_partitions AS (
  SELECT i.uuid          AS                                                                                   iuuid,
         row_number() OVER (PARTITION BY i.uuid ORDER BY pe.encounter_date_time desc) erank,
         pe.uuid         AS                                                                                   euuid,
         pe.observations AS                                                                                   obs,
         pe.encounter_date_time
  FROM completed_program_encounter_view pe
         INNER JOIN non_exited_program_enrolment_view e ON pe.program_enrolment_id = e.id
         INNER JOIN individual_view i ON e.individual_id = i.id
  WHERE e.program_name = ''''Adolescent''''
    and (pe.encounter_type_name = ''''Annual Visit'''' or pe.encounter_type_name = ''''Quarterly Visit'''')
)
SELECT
  ip.iuuid            uuid,
  i.gender            gender_name,
  i.addresslevel_type address_type,
  i.addresslevel_name address_name
FROM individual_program_partitions ip
       LEFT OUTER JOIN individual_gender_address_view i ON i.uuid = ip.iuuid
WHERE ip.obs @> ''''{"575a29c3-a070-4c7d-ac96-fe58b6bddca3": "58f789aa-6570-4aea-87a7-1f7651729c5a"}''''
  AND erank = 1
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