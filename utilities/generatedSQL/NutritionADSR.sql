-- Generated Report
-- Name: NutritionADSR

with filters as (
    select coalesce( [[ {{start_date}} , ]] '1900-01-01'::timestamptz) start_date,
           coalesce( [[ {{end_date}} , ]] current_timestamp) end_date
)

SELECT * FROM crosstab('SELECT
''Total adolescents enrolled''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''SELECT DISTINCT i.uuid uuid, i.gender gender_name, alt.name address_type, a.title address_name
FROM adsr.individual i
LEFT OUTER JOIN adsr.individual_adolescent_annual_visit_baseline baseline
ON baseline.individual_id = i.id
JOIN address_level a
ON a.id = i.address_id
JOIN address_level_type alt
ON alt.id = a.type_id
WHERE baseline.is_voided is false AND i.is_voided = false and a.is_voided = false
[[ and baseline.enrolment_date_time >=(' || '''' || quote_literal({{ start_date }}) || '''' || '  ::DATE)]]
[[and baseline.enrolment_date_time <=' || '''' || quote_literal({{end_date}}) || '''' || ' ::DATE]]
[[and a.title  = ' || '''' || quote_literal({{title}}) || '''' || ']]'', ''SELECT DISTINCT i.uuid uuid, i.gender gender_name, alt.name address_type, a.title address_name
FROM adsr.individual i
LEFT OUTER JOIN adsr.individual_adolescent_annual_visit_baseline baseline
ON baseline.individual_id = i.id
JOIN address_level a
ON a.id = i.address_id
JOIN address_level_type alt
ON alt.id = a.type_id
WHERE baseline.is_voided is false AND i.is_voided = false and a.is_voided = false
[[ and baseline.enrolment_date_time >=(' || '''' || quote_literal({{ start_date }}) || '''' || '  ::DATE)]]
[[and baseline.enrolment_date_time <=' || '''' || quote_literal({{end_date}}) || '''' || ' ::DATE]]
[[and a.title  = ' || '''' || quote_literal({{title}}) || '''' || ']]'')
UNION ALL
SELECT
''BMI done''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''WITH agg_data as (
  select uuid,
         individual_id,
         program_enrolment_id,
         encounter_date_time,
         "Height (cm)",
         "Weight (kg)"
  from adsr.individual_adolescent_annual_visit_baseline
  where  encounter_date_time is not null
  and ("Height (cm)" is not null or "Weight (kg)" is not null)
  union all
  select uuid,
         individual_id,
         program_enrolment_id,
         encounter_date_time,
         "Height (cm)",
         "Weight (kg)"
  from adsr.individual_adolescent_annual_visit_endline
  where  encounter_date_time is not null
  and ("Height (cm)" is not null or "Weight (kg)" is not null)

),
  individual_program_partitions AS (
  SELECT i.uuid          AS                                                           iuuid,
           row_number() OVER (PARTITION BY i.uuid ORDER BY pe.encounter_date_time desc) erank,
           pe.uuid         AS                                                           euuid,
pe."Height (cm)" AS                                                           "Height (cm)",
pe."Weight (kg)" AS                                                           "Weight (kg)",
pe.encounter_date_time
FROM agg_data pe
INNER JOIN adsr.individual_adolescent e ON pe.program_enrolment_id = e.id
INNER JOIN adsr.individual i ON e.individual_id = i.id
WHERE e.program_exit_date_time is null
and i.is_voided = false
and (pe."Height (cm)" is not null
or pe."Weight (kg)" is not null)

)
SELECT  i.uuid              as uuid,
        i.gender            as gender_name,
        alt.name as address_type,
        a.title as address_name
FROM individual_program_partitions ip
JOIN adsr.individual i ON i.uuid = ip.iuuid
JOIN address_level a on a.id = i.address_id
JOIN address_level_type alt on alt.id = a.type_id
WHERE erank = 1 and a.is_voided = false'', ''SELECT DISTINCT i.uuid uuid, i.gender gender_name, alt.name address_type, a.title address_name
FROM adsr.individual i
LEFT OUTER JOIN adsr.individual_adolescent_annual_visit_baseline baseline
ON baseline.individual_id = i.id
JOIN address_level a
ON a.id = i.address_id
JOIN address_level_type alt
ON alt.id = a.type_id
WHERE baseline.is_voided is false AND i.is_voided = false and a.is_voided = false
[[ and baseline.enrolment_date_time >=(' || '''' || quote_literal({{ start_date }}) || '''' || '  ::DATE)]]
[[and baseline.enrolment_date_time <=' || '''' || quote_literal({{end_date}}) || '''' || ' ::DATE]]
[[and a.title  = ' || '''' || quote_literal({{title}}) || '''' || ']]'')
UNION ALL
SELECT
''Severely Malnourished''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''WITH agg_data as (
  select uuid,
         individual_id,
         program_enrolment_id,
         encounter_date_time,
         "BMI (kg/m²)"
  from adsr.individual_adolescent_annual_visit_baseline
  where  encounter_date_time is not null
  and "BMI (kg/m²)" is not null
  union all
  select uuid,
         individual_id,
         program_enrolment_id,
         encounter_date_time,
         "BMI (kg/m²)"
  from adsr.individual_adolescent_annual_visit_endline
  where  encounter_date_time is not null
  and "BMI (kg/m²)" is not null

),
  individual_program_partitions AS (
  SELECT i.uuid          AS                                                           iuuid,
           row_number() OVER (PARTITION BY i.uuid ORDER BY pe.encounter_date_time desc) erank,
           pe.uuid         AS                                                           euuid,
pe."BMI (kg/m²)"                                                             obs,
pe.encounter_date_time
FROM agg_data pe
INNER JOIN adsr.individual_adolescent e ON pe.program_enrolment_id = e.id
INNER JOIN adsr.individual i ON e.individual_id = i.id
WHERE e.program_exit_date_time is null
and i.is_voided = false
and pe."BMI (kg/m²)" is not null

)
SELECT  i.uuid              as uuid,
        i.gender            as gender_name,
        alt.name as address_type,
        a.title as address_name,
        obs
        FROM individual_program_partitions ip
JOIN adsr.individual i ON i.uuid = ip.iuuid
JOIN address_level a on a.id = i.address_id
JOIN address_level_type alt on alt.id = a.type_id
WHERE erank = 1 and a.is_voided = false
and obs < 14.5
'', ''SELECT DISTINCT i.uuid uuid, i.gender gender_name, alt.name address_type, a.title address_name
FROM adsr.individual i
LEFT OUTER JOIN adsr.individual_adolescent_annual_visit_baseline baseline
ON baseline.individual_id = i.id
JOIN address_level a
ON a.id = i.address_id
JOIN address_level_type alt
ON alt.id = a.type_id
WHERE baseline.is_voided is false AND i.is_voided = false and a.is_voided = false
[[ and baseline.enrolment_date_time >=(' || '''' || quote_literal({{ start_date }}) || '''' || '  ::DATE)]]
[[and baseline.enrolment_date_time <=' || '''' || quote_literal({{end_date}}) || '''' || ' ::DATE]]
[[and a.title  = ' || '''' || quote_literal({{title}}) || '''' || ']]'')
UNION ALL
SELECT
''Malnourished''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''WITH agg_data as (
  select uuid,
         individual_id,
         program_enrolment_id,
         encounter_date_time,
         "BMI (kg/m²)"
  from adsr.individual_adolescent_annual_visit_baseline
  where  encounter_date_time is not null
  and "BMI (kg/m²)" is not null
  union all
  select uuid,
         individual_id,
         program_enrolment_id,
         encounter_date_time,
         "BMI (kg/m²)"
  from adsr.individual_adolescent_annual_visit_endline
  where  encounter_date_time is not null
  and "BMI (kg/m²)" is not null

),
  individual_program_partitions AS (
  SELECT i.uuid          AS                                                           iuuid,
           row_number() OVER (PARTITION BY i.uuid ORDER BY pe.encounter_date_time desc) erank,
           pe.uuid         AS                                                           euuid,
pe."BMI (kg/m²)"                                                             obs,
pe.encounter_date_time
FROM agg_data pe
INNER JOIN adsr.individual_adolescent e ON pe.program_enrolment_id = e.id
INNER JOIN adsr.individual i ON e.individual_id = i.id
WHERE e.program_exit_date_time is null
and i.is_voided = false
and pe."BMI (kg/m²)" is not null

)
SELECT  i.uuid              as uuid,
        i.gender            as gender_name,
        alt.name as address_type,
        a.title as address_name,
        obs
        FROM individual_program_partitions ip
JOIN adsr.individual i ON i.uuid = ip.iuuid
JOIN address_level a on a.id = i.address_id
JOIN address_level_type alt on alt.id = a.type_id
WHERE erank = 1 and a.is_voided = false
and obs >= 14.5  AND obs <= 18.5

'', ''SELECT DISTINCT i.uuid uuid, i.gender gender_name, alt.name address_type, a.title address_name
FROM adsr.individual i
LEFT OUTER JOIN adsr.individual_adolescent_annual_visit_baseline baseline
ON baseline.individual_id = i.id
JOIN address_level a
ON a.id = i.address_id
JOIN address_level_type alt
ON alt.id = a.type_id
WHERE baseline.is_voided is false AND i.is_voided = false and a.is_voided = false
[[ and baseline.enrolment_date_time >=(' || '''' || quote_literal({{ start_date }}) || '''' || '  ::DATE)]]
[[and baseline.enrolment_date_time <=' || '''' || quote_literal({{end_date}}) || '''' || ' ::DATE]]
[[and a.title  = ' || '''' || quote_literal({{title}}) || '''' || ']]'')
UNION ALL
SELECT
''Normal''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''WITH agg_data as (
  select uuid,
         individual_id,
         program_enrolment_id,
         encounter_date_time,
         "BMI (kg/m²)"
  from adsr.individual_adolescent_annual_visit_baseline
  where  encounter_date_time is not null
  and "BMI (kg/m²)" is not null
  union all
  select uuid,
         individual_id,
         program_enrolment_id,
         encounter_date_time,
         "BMI (kg/m²)"
  from adsr.individual_adolescent_annual_visit_endline
  where  encounter_date_time is not null
  and "BMI (kg/m²)" is not null

),
  individual_program_partitions AS (
  SELECT i.uuid          AS                                                           iuuid,
           row_number() OVER (PARTITION BY i.uuid ORDER BY pe.encounter_date_time desc) erank,
           pe.uuid         AS                                                           euuid,
pe."BMI (kg/m²)"                                                             obs,
pe.encounter_date_time
FROM agg_data pe
INNER JOIN adsr.individual_adolescent e ON pe.program_enrolment_id = e.id
INNER JOIN adsr.individual i ON e.individual_id = i.id
WHERE e.program_exit_date_time is null
and i.is_voided = false
and pe."BMI (kg/m²)" is not null

)
SELECT  i.uuid              as uuid,
        i.gender            as gender_name,
        alt.name as address_type,
        a.title as address_name,
        obs
        FROM individual_program_partitions ip
JOIN adsr.individual i ON i.uuid = ip.iuuid
JOIN address_level a on a.id = i.address_id
JOIN address_level_type alt on alt.id = a.type_id
WHERE erank = 1 and a.is_voided = false
and obs > 18.5  AND obs <= 25
'', ''SELECT DISTINCT i.uuid uuid, i.gender gender_name, alt.name address_type, a.title address_name
FROM adsr.individual i
LEFT OUTER JOIN adsr.individual_adolescent_annual_visit_baseline baseline
ON baseline.individual_id = i.id
JOIN address_level a
ON a.id = i.address_id
JOIN address_level_type alt
ON alt.id = a.type_id
WHERE baseline.is_voided is false AND i.is_voided = false and a.is_voided = false
[[ and baseline.enrolment_date_time >=(' || '''' || quote_literal({{ start_date }}) || '''' || '  ::DATE)]]
[[and baseline.enrolment_date_time <=' || '''' || quote_literal({{end_date}}) || '''' || ' ::DATE]]
[[and a.title  = ' || '''' || quote_literal({{title}}) || '''' || ']]'')
UNION ALL
SELECT
''Overweight''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''WITH agg_data as (
  select uuid,
         individual_id,
         program_enrolment_id,
         encounter_date_time,
         "BMI (kg/m²)"
  from adsr.individual_adolescent_annual_visit_baseline
  where  encounter_date_time is not null
  and "BMI (kg/m²)" is not null
  union all
  select uuid,
         individual_id,
         program_enrolment_id,
         encounter_date_time,
         "BMI (kg/m²)"
  from adsr.individual_adolescent_annual_visit_endline
  where  encounter_date_time is not null
  and "BMI (kg/m²)" is not null

),
  individual_program_partitions AS (
  SELECT i.uuid          AS                                                           iuuid,
           row_number() OVER (PARTITION BY i.uuid ORDER BY pe.encounter_date_time desc) erank,
           pe.uuid         AS                                                           euuid,
pe."BMI (kg/m²)"                                                             obs,
pe.encounter_date_time
FROM agg_data pe
INNER JOIN adsr.individual_adolescent e ON pe.program_enrolment_id = e.id
INNER JOIN adsr.individual i ON e.individual_id = i.id
WHERE e.program_exit_date_time is null
and i.is_voided = false
and pe."BMI (kg/m²)" is not null

)
SELECT  i.uuid              as uuid,
        i.gender            as gender_name,
        alt.name as address_type,
        a.title as address_name,
        obs
        FROM individual_program_partitions ip
JOIN adsr.individual i ON i.uuid = ip.iuuid
JOIN address_level a on a.id = i.address_id
JOIN address_level_type alt on alt.id = a.type_id
WHERE erank = 1 and a.is_voided = false
and obs > 25 and obs < 30

'', ''SELECT DISTINCT i.uuid uuid, i.gender gender_name, alt.name address_type, a.title address_name
FROM adsr.individual i
LEFT OUTER JOIN adsr.individual_adolescent_annual_visit_baseline baseline
ON baseline.individual_id = i.id
JOIN address_level a
ON a.id = i.address_id
JOIN address_level_type alt
ON alt.id = a.type_id
WHERE baseline.is_voided is false AND i.is_voided = false and a.is_voided = false
[[ and baseline.enrolment_date_time >=(' || '''' || quote_literal({{ start_date }}) || '''' || '  ::DATE)]]
[[and baseline.enrolment_date_time <=' || '''' || quote_literal({{end_date}}) || '''' || ' ::DATE]]
[[and a.title  = ' || '''' || quote_literal({{title}}) || '''' || ']]'')
UNION ALL
SELECT
''Obese''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''WITH agg_data as (
  select uuid,
         individual_id,
         program_enrolment_id,
         encounter_date_time,
         "BMI (kg/m²)"
  from adsr.individual_adolescent_annual_visit_baseline
  where  encounter_date_time is not null
  and "BMI (kg/m²)" is not null
  union all
  select uuid,
         individual_id,
         program_enrolment_id,
         encounter_date_time,
         "BMI (kg/m²)"
  from adsr.individual_adolescent_annual_visit_endline
  where  encounter_date_time is not null
  and "BMI (kg/m²)" is not null

),
  individual_program_partitions AS (
  SELECT i.uuid          AS                                                           iuuid,
           row_number() OVER (PARTITION BY i.uuid ORDER BY pe.encounter_date_time desc) erank,
           pe.uuid         AS                                                           euuid,
pe."BMI (kg/m²)"                                                             obs,
pe.encounter_date_time
FROM agg_data pe
INNER JOIN adsr.individual_adolescent e ON pe.program_enrolment_id = e.id
INNER JOIN adsr.individual i ON e.individual_id = i.id
WHERE e.program_exit_date_time is null
and i.is_voided = false
and pe."BMI (kg/m²)" is not null

)
SELECT  i.uuid              as uuid,
        i.gender            as gender_name,
        alt.name as address_type,
        a.title as address_name,
        obs
        FROM individual_program_partitions ip
JOIN adsr.individual i ON i.uuid = ip.iuuid
JOIN address_level a on a.id = i.address_id
JOIN address_level_type alt on alt.id = a.type_id
WHERE erank = 1 and a.is_voided = false
and obs >= 30
'', ''SELECT DISTINCT i.uuid uuid, i.gender gender_name, alt.name address_type, a.title address_name
FROM adsr.individual i
LEFT OUTER JOIN adsr.individual_adolescent_annual_visit_baseline baseline
ON baseline.individual_id = i.id
JOIN address_level a
ON a.id = i.address_id
JOIN address_level_type alt
ON alt.id = a.type_id
WHERE baseline.is_voided is false AND i.is_voided = false and a.is_voided = false
[[ and baseline.enrolment_date_time >=(' || '''' || quote_literal({{ start_date }}) || '''' || '  ::DATE)]]
[[and baseline.enrolment_date_time <=' || '''' || quote_literal({{end_date}}) || '''' || ' ::DATE]]
[[and a.title  = ' || '''' || quote_literal({{title}}) || '''' || ']]'')
UNION ALL
SELECT
''BMI not done''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''WITH agg_data as (
  select uuid,
         individual_id,
         program_enrolment_id,
         encounter_date_time,
         "BMI (kg/m²)"
  from adsr.individual_adolescent_annual_visit_baseline
  where  encounter_date_time is not null
  union all
  select uuid,
         individual_id,
         program_enrolment_id,
         encounter_date_time,
         "BMI (kg/m²)"
  from adsr.individual_adolescent_annual_visit_endline
  where  encounter_date_time is not null
),individual_program_partitions AS (
SELECT i.uuid          AS                                                           iuuid,
           row_number() OVER (PARTITION BY i.uuid ORDER BY pe.encounter_date_time desc) erank,
           pe.uuid         AS                                                           euuid,
pe."BMI (kg/m²)" AS                                                           obs,
pe.encounter_date_time
FROM agg_data pe
INNER JOIN adsr.individual_adolescent e ON pe.program_enrolment_id = e.id
INNER JOIN adsr.individual i ON e.individual_id = i.id
WHERE e.program_exit_date_time is null and i.is_voided = false


)
SELECT i.uuid              as uuid,
       i.gender            as gender_name,
       alt.name as address_type,
       a.title as address_name
FROM individual_program_partitions ip
JOIN adsr.individual i ON i.uuid = ip.iuuid
JOIN address_level a on i.address_id = a.id
JOIN address_level_type alt on alt.id = a.type_id
WHERE ip.obs is null and erank = 1 and a.is_voided = false and i.is_voided = false'', ''SELECT DISTINCT i.uuid uuid, i.gender gender_name, alt.name address_type, a.title address_name
FROM adsr.individual i
LEFT OUTER JOIN adsr.individual_adolescent_annual_visit_baseline baseline
ON baseline.individual_id = i.id
JOIN address_level a
ON a.id = i.address_id
JOIN address_level_type alt
ON alt.id = a.type_id
WHERE baseline.is_voided is false AND i.is_voided = false and a.is_voided = false
[[ and baseline.enrolment_date_time >=(' || '''' || quote_literal({{ start_date }}) || '''' || '  ::DATE)]]
[[and baseline.enrolment_date_time <=' || '''' || quote_literal({{end_date}}) || '''' || ' ::DATE]]
[[and a.title  = ' || '''' || quote_literal({{title}}) || '''' || ']]'')') AS (
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