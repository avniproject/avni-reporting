-- Generated Report
-- Name: AddictionADSR

with filters as (
    select coalesce( [[ {{start_date}} , ]] '1900-01-01'::timestamptz) start_date,
           coalesce( [[ {{end_date}} , ]] current_timestamp) end_date
)

SELECT * FROM crosstab('SELECT
''Adolescents Addicted to Tobacco''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''WITH agg_data as (
  select uuid,
         individual_id,
         program_enrolment_id,
         encounter_date_time,
         "Do you have any addiction"
  from adsr.individual_adolescent_annual_visit_baseline
  where  encounter_date_time is not null
  union all
  select uuid,
         individual_id,
         program_enrolment_id,
         encounter_date_time,
         "Do you have any addiction"
  from adsr.individual_adolescent_annual_visit_endline
  where  encounter_date_time is not null
  union all
  select uuid,
         individual_id,
         program_enrolment_id,
         encounter_date_time,
         "Do you have any addiction"
  from adsr.individual_adolescent_severe_malnutrition_followup
  where  encounter_date_time is not null
),
  individual_program_partitions AS (
  SELECT i.uuid          AS                                                           iuuid,
           row_number() OVER (PARTITION BY i.uuid ORDER BY pe.encounter_date_time desc) erank,
           pe.uuid         AS                                                           euuid,
pe."Do you have any addiction" AS                                                           obs,
pe.encounter_date_time
FROM agg_data pe
INNER JOIN adsr.individual_adolescent e ON pe.program_enrolment_id = e.id
INNER JOIN adsr.individual i ON e.individual_id = i.id
INNER JOIN address_level a ON a.id = i.address_id
WHERE pe."Do you have any addiction" is not null
and e.program_exit_date_time is null
[[ and e.enrolment_date_time >=(' || '''' || quote_literal({{ start_date }}) || '''' || '  ::DATE)]]
[[and e.enrolment_date_time <=' || '''' || quote_literal({{end_date}}) || '''' || ' ::DATE]]
[[and a.title = ' || '''' || quote_literal({{title}}) || '''' || ']]
)
SELECT ip.iuuid            uuid,
       i.gender            gender_name,
       alt.name address_type,
       a.title address_name,
       obs
       FROM individual_program_partitions ip
LEFT OUTER JOIN adsr.individual i ON i.uuid = ip.iuuid
LEFT OUTER JOIN address_level a on a.id = i.address_id
LEFT OUTER JOIN address_level_type alt on alt.id = a.type_id
WHERE obs = ''''Tobacco''''
AND erank = 1'', ''SELECT DISTINCT i.uuid uuid, i.gender gender_name, alt.name address_type, a.title address_name
FROM program_enrolment enrolment
LEFT OUTER JOIN adsr.individual i
ON enrolment.individual_id = i.id
JOIN address_level a
ON a.id = i.address_id
JOIN address_level_type alt
ON alt.id = a.type_id
WHERE program_exit_date_time is null  AND i.is_voided = false and a.is_voided = false
[[ and enrolment.enrolment_date_time >=(' || '''' || quote_literal({{ start_date }}) || '''' || '  ::DATE)]]
[[and enrolment.enrolment_date_time <=' || '''' || quote_literal({{end_date}}) || '''' || ' ::DATE]]
[[and a.title  = ' || '''' || quote_literal({{title}}) || '''' || ']]'')
UNION ALL
SELECT
''Adolescents Addicted to Alcohol''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''WITH agg_data as (
  select uuid,
         individual_id,
         program_enrolment_id,
         encounter_date_time,
         "Do you have any addiction"
  from adsr.individual_adolescent_annual_visit_baseline
  where  encounter_date_time is not null
  union all
  select uuid,
         individual_id,
         program_enrolment_id,
         encounter_date_time,
         "Do you have any addiction"
  from adsr.individual_adolescent_annual_visit_endline
  where  encounter_date_time is not null
  union all
  select uuid,
         individual_id,
         program_enrolment_id,
         encounter_date_time,
         "Do you have any addiction"
  from adsr.individual_adolescent_severe_malnutrition_followup
  where  encounter_date_time is not null
),
  individual_program_partitions AS (
  SELECT i.uuid          AS                                                           iuuid,
           row_number() OVER (PARTITION BY i.uuid ORDER BY pe.encounter_date_time desc) erank,
           pe.uuid         AS                                                           euuid,
pe."Do you have any addiction" AS                                                           obs,
pe.encounter_date_time
FROM agg_data pe
INNER JOIN adsr.individual_adolescent e ON pe.program_enrolment_id = e.id
INNER JOIN adsr.individual i ON e.individual_id = i.id
INNER JOIN address_level a ON a.id = i.address_id
WHERE pe."Do you have any addiction" is not null
and e.program_exit_date_time is null
[[ and e.enrolment_date_time >=(' || '''' || quote_literal({{ start_date }}) || '''' || '  ::DATE)]]
[[and e.enrolment_date_time <=' || '''' || quote_literal({{end_date}}) || '''' || ' ::DATE]]
[[and a.title = ' || '''' || quote_literal({{title}}) || '''' || ']]
)
SELECT ip.iuuid            uuid,
       i.gender            gender_name,
       alt.name address_type,
       a.title address_name,
       obs
       FROM individual_program_partitions ip
LEFT OUTER JOIN adsr.individual i ON i.uuid = ip.iuuid
LEFT OUTER JOIN address_level a on a.id = i.address_id
LEFT OUTER JOIN address_level_type alt on alt.id = a.type_id
WHERE obs = ''''Alcohol''''
AND erank = 1'', ''SELECT DISTINCT i.uuid uuid, i.gender gender_name, alt.name address_type, a.title address_name
FROM program_enrolment enrolment
LEFT OUTER JOIN adsr.individual i
ON enrolment.individual_id = i.id
JOIN address_level a
ON a.id = i.address_id
JOIN address_level_type alt
ON alt.id = a.type_id
WHERE program_exit_date_time is null  AND i.is_voided = false and a.is_voided = false
[[ and enrolment.enrolment_date_time >=(' || '''' || quote_literal({{ start_date }}) || '''' || '  ::DATE)]]
[[and enrolment.enrolment_date_time <=' || '''' || quote_literal({{end_date}}) || '''' || ' ::DATE]]
[[and a.title  = ' || '''' || quote_literal({{title}}) || '''' || ']]'')
UNION ALL
SELECT
''Adolescents quited Tobacco''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''WITH agg_data as (
  select uuid,
         individual_id,
         program_enrolment_id,
         encounter_date_time,
         "Do you have any addiction"
  from adsr.individual_adolescent_annual_visit_baseline
  where  encounter_date_time is not null
  union all
  select uuid,
         individual_id,
         program_enrolment_id,
         encounter_date_time,
         "Do you have any addiction"
  from adsr.individual_adolescent_annual_visit_endline
  where  encounter_date_time is not null
  union all
  select uuid,
         individual_id,
         program_enrolment_id,
         encounter_date_time,
         "Do you have any addiction"
  from adsr.individual_adolescent_severe_malnutrition_followup
  where  encounter_date_time is not null
),
  individual_program_partitions AS (
  SELECT i.uuid          AS                                                           iuuid,
           row_number() OVER (PARTITION BY i.uuid ORDER BY pe.encounter_date_time desc) erank,
           pe.uuid         AS                                                           euuid,
pe."Do you have any addiction" AS                                                           obs,
pe.encounter_date_time
FROM agg_data pe
INNER JOIN adsr.individual_adolescent e ON pe.program_enrolment_id = e.id
INNER JOIN adsr.individual i ON e.individual_id = i.id
INNER JOIN address_level a ON a.id = i.address_id
WHERE pe."Do you have any addiction" is not null
and e.program_exit_date_time is null
[[ and e.enrolment_date_time >=(' || '''' || quote_literal({{ start_date }}) || '''' || '  ::DATE)]]
[[and e.enrolment_date_time <=' || '''' || quote_literal({{end_date}}) || '''' || ' ::DATE]]
[[and a.title = ' || '''' || quote_literal({{title}}) || '''' || ']]
),
tobacco_takers as (SELECT ip.iuuid               iuuid,
                               ip.encounter_date_time encounter_date_time
                        FROM individual_program_partitions ip
                                 LEFT OUTER JOIN adsr.individual i ON i.uuid = ip.iuuid
                        WHERE obs = ''''Tobacco''''
                          AND erank = 1)

SELECT tt.iuuid            uuid,
       i.gender            gender_name,
       alt.name address_type,
       a.title address_name
FROM adsr.individual_adolescent_addiction_followup pe
INNER JOIN adsr.individual_adolescent e ON pe.program_enrolment_id = e.id
INNER JOIN adsr.individual i ON i.id = e.individual_id
INNER JOIN address_level a on a.id = i.address_id
INNER JOIN address_level_type alt on alt.id = a.type_id
INNER JOIN tobacco_takers tt ON tt.iuuid = i.uuid
Where e.program_exit_date_time is null and i.is_voided = false and a.is_voided = false
AND pe.encounter_date_time >= tt.encounter_date_time
AND  "Knowing about hazards of tobacco, have you quit tobacco/alcohol" = ''''Yes'''''', ''WITH agg_data as (
  select uuid,
         individual_id,
         program_enrolment_id,
         encounter_date_time,
         "Do you have any addiction"
  from adsr.individual_adolescent_annual_visit_baseline
  where  encounter_date_time is not null
  union all
  select uuid,
         individual_id,
         program_enrolment_id,
         encounter_date_time,
         "Do you have any addiction"
  from adsr.individual_adolescent_annual_visit_endline
  where  encounter_date_time is not null
  union all
  select uuid,
         individual_id,
         program_enrolment_id,
         encounter_date_time,
         "Do you have any addiction"
  from adsr.individual_adolescent_severe_malnutrition_followup
  where  encounter_date_time is not null
),
  individual_program_partitions AS (
  SELECT i.uuid          AS                                                           iuuid,
           row_number() OVER (PARTITION BY i.uuid ORDER BY pe.encounter_date_time desc) erank,
           pe.uuid         AS                                                           euuid,
pe."Do you have any addiction" AS                                                           obs,
pe.encounter_date_time
FROM agg_data pe
INNER JOIN adsr.individual_adolescent e ON pe.program_enrolment_id = e.id
INNER JOIN adsr.individual i ON e.individual_id = i.id
INNER JOIN address_level a ON a.id = i.address_id
WHERE pe."Do you have any addiction" is not null
and e.program_exit_date_time is null
[[ and e.enrolment_date_time >=(' || '''' || quote_literal({{ start_date }}) || '''' || '  ::DATE)]]
[[and e.enrolment_date_time <=' || '''' || quote_literal({{end_date}}) || '''' || ' ::DATE]]
[[and a.title = ' || '''' || quote_literal({{title}}) || '''' || ']]
)
SELECT ip.iuuid            uuid,
       i.gender            gender_name,
       alt.name address_type,
       a.title address_name,
       obs
       FROM individual_program_partitions ip
LEFT OUTER JOIN adsr.individual i ON i.uuid = ip.iuuid
LEFT OUTER JOIN address_level a on a.id = i.address_id
LEFT OUTER JOIN address_level_type alt on alt.id = a.type_id
WHERE obs = ''''Tobacco''''
AND erank = 1'')
UNION ALL
SELECT
''Adolescents quited Alcohol''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''WITH agg_data as (
  select uuid,
         individual_id,
         program_enrolment_id,
         encounter_date_time,
         "Do you have any addiction"
  from adsr.individual_adolescent_annual_visit_baseline
  where  encounter_date_time is not null
  union all
  select uuid,
         individual_id,
         program_enrolment_id,
         encounter_date_time,
         "Do you have any addiction"
  from adsr.individual_adolescent_annual_visit_endline
  where  encounter_date_time is not null
  union all
  select uuid,
         individual_id,
         program_enrolment_id,
         encounter_date_time,
         "Do you have any addiction"
  from adsr.individual_adolescent_severe_malnutrition_followup
  where  encounter_date_time is not null
),
  individual_program_partitions AS (
  SELECT i.uuid          AS                                                           iuuid,
           row_number() OVER (PARTITION BY i.uuid ORDER BY pe.encounter_date_time desc) erank,
           pe.uuid         AS                                                           euuid,
pe."Do you have any addiction" AS                                                           obs,
pe.encounter_date_time
FROM agg_data pe
INNER JOIN adsr.individual_adolescent e ON pe.program_enrolment_id = e.id
INNER JOIN adsr.individual i ON e.individual_id = i.id
INNER JOIN address_level a ON a.id = i.address_id
WHERE pe."Do you have any addiction" is not null
and e.program_exit_date_time is null
[[ and e.enrolment_date_time >=(' || '''' || quote_literal({{ start_date }}) || '''' || '  ::DATE)]]
[[and e.enrolment_date_time <=' || '''' || quote_literal({{end_date}}) || '''' || ' ::DATE]]
[[and a.title = ' || '''' || quote_literal({{title}}) || '''' || ']]
),
alcohol_takers as (SELECT ip.iuuid               iuuid,
                               ip.encounter_date_time encounter_date_time
                        FROM individual_program_partitions ip
                                 LEFT OUTER JOIN adsr.individual i ON i.uuid = ip.iuuid
                        WHERE obs = ''''Alcohol''''
                          AND erank = 1)

SELECT tt.iuuid            uuid,
       i.gender            gender_name,
       alt.name address_type,
       a.title address_name
FROM adsr.individual_adolescent_addiction_followup pe
INNER JOIN adsr.individual_adolescent e ON pe.program_enrolment_id = e.id
INNER JOIN adsr.individual i ON i.id = e.individual_id
INNER JOIN address_level a on a.id = i.address_id
INNER JOIN address_level_type alt on alt.id = a.type_id
INNER JOIN alcohol_takers tt ON tt.iuuid = i.uuid
Where e.program_exit_date_time is null and i.is_voided = false and a.is_voided = false
AND pe.encounter_date_time >= tt.encounter_date_time
AND  "Knowing about hazards of tobacco, have you quit tobacco/alcohol" = ''''Yes'''''', ''WITH agg_data as (
  select uuid,
         individual_id,
         program_enrolment_id,
         encounter_date_time,
         "Do you have any addiction"
  from adsr.individual_adolescent_annual_visit_baseline
  where  encounter_date_time is not null
  union all
  select uuid,
         individual_id,
         program_enrolment_id,
         encounter_date_time,
         "Do you have any addiction"
  from adsr.individual_adolescent_annual_visit_endline
  where  encounter_date_time is not null
  union all
  select uuid,
         individual_id,
         program_enrolment_id,
         encounter_date_time,
         "Do you have any addiction"
  from adsr.individual_adolescent_severe_malnutrition_followup
  where  encounter_date_time is not null
),
  individual_program_partitions AS (
  SELECT i.uuid          AS                                                           iuuid,
           row_number() OVER (PARTITION BY i.uuid ORDER BY pe.encounter_date_time desc) erank,
           pe.uuid         AS                                                           euuid,
pe."Do you have any addiction" AS                                                           obs,
pe.encounter_date_time
FROM agg_data pe
INNER JOIN adsr.individual_adolescent e ON pe.program_enrolment_id = e.id
INNER JOIN adsr.individual i ON e.individual_id = i.id
INNER JOIN address_level a ON a.id = i.address_id
WHERE pe."Do you have any addiction" is not null
and e.program_exit_date_time is null
[[ and e.enrolment_date_time >=(' || '''' || quote_literal({{ start_date }}) || '''' || '  ::DATE)]]
[[and e.enrolment_date_time <=' || '''' || quote_literal({{end_date}}) || '''' || ' ::DATE]]
[[and a.title = ' || '''' || quote_literal({{title}}) || '''' || ']]
)
SELECT ip.iuuid            uuid,
       i.gender            gender_name,
       alt.name address_type,
       a.title address_name,
       obs
       FROM individual_program_partitions ip
LEFT OUTER JOIN adsr.individual i ON i.uuid = ip.iuuid
LEFT OUTER JOIN address_level a on a.id = i.address_id
LEFT OUTER JOIN address_level_type alt on alt.id = a.type_id
WHERE obs = ''''Alcohol''''
AND erank = 1'')') AS (
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