-- Generated Report
-- Name: MenstruationADSR

with filters as (
    select coalesce( [[ {{start_date}} , ]] '1900-01-01'::timestamptz) start_date,
           coalesce( [[ {{end_date}} , ]] current_timestamp) end_date
)

SELECT * FROM crosstab('SELECT
''Menstruation Started''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''with agg_data as (
  select individual_id,
         "Menstruation started"
  from adsr.individual_adolescent_annual_visit_baseline
  where  encounter_date_time is not null
  union all
  select individual_id,
         "Menstruation started"
  from adsr.individual_adolescent_annual_visit_endline
  where  encounter_date_time is not null
)

SELECT DISTINCT i.uuid   as uuid,
                gender   as gender_name,
                alt.name as address_type,
                a.title  as address_name
FROM agg_data lpe
JOIN adsr.individual i ON i.id = lpe.individual_id
JOIN address_level a ON a.id = i.address_id
JOIN address_level_type alt ON alt.id = a.type_id
JOIN program_enrolment e ON e.individual_id = i.id
WHERE program_exit_date_time is null
AND "Menstruation started" = ''''Yes''''
AND i.is_voided = false and a.is_voided = false
     [[ and e.enrolment_date_time >=(' || '''' || quote_literal({{ start_date }}) || '''' || '  ::DATE)]]
     [[and e.enrolment_date_time <=' || '''' || quote_literal({{end_date}}) || '''' || ' ::DATE]]
     [[and a.title = ' || '''' || quote_literal({{title}}) || '''' || ']]'', ''SELECT DISTINCT i.uuid uuid, i.gender gender_name, alt.name address_type, a.title address_name
FROM program_enrolment enrolment
LEFT OUTER JOIN adsr.individual i
ON enrolment.individual_id = i.id
JOIN address_level a
ON a.id = i.address_id
JOIN address_level_type alt
ON alt.id = a.type_id
WHERE program_exit_date_time is null AND i.gender = ''''Female'''' AND i.is_voided = false and a.is_voided = false
     [[ and enrolment.enrolment_date_time >=(' || '''' || quote_literal({{ start_date }}) || '''' || '  ::DATE)]]
     [[and enrolment.enrolment_date_time <=' || '''' || quote_literal({{end_date}}) || '''' || ' ::DATE]]
     [[and a.title  = ' || '''' || quote_literal({{title}}) || '''' || ']]'')
UNION ALL
SELECT
''Menstrual Disorder''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''with agg_data as (
  select uuid,
         individual_id,
         program_enrolment_id,
         encounter_date_time,
         "Menstrual disorder"
  from adsr.individual_adolescent_annual_visit_baseline
  where  encounter_date_time is not null
  union all
  select uuid,
         individual_id,
         program_enrolment_id,
         encounter_date_time,
         "Menstrual disorder"
  from adsr.individual_adolescent_annual_visit_endline
  where  encounter_date_time is not null
), individual_program_partitions AS (
SELECT i.uuid          AS                                                           iuuid,
           row_number() OVER (PARTITION BY i.uuid ORDER BY pe.encounter_date_time desc) erank,
           pe.uuid         AS                                                           euuid,
pe."Menstrual disorder" AS                                                           observations,
pe.encounter_date_time
FROM agg_data pe
INNER JOIN adsr.individual_adolescent e ON pe.program_enrolment_id = e.id
INNER JOIN adsr.individual i ON e.individual_id = i.id
INNER JOIN address_level a ON a.id = i.address_id
WHERE program_exit_date_time isnull
[[ and e.enrolment_date_time >=(' || '''' || quote_literal({{ start_date }}) || '''' || '  ::DATE)]]
[[and e.enrolment_date_time <=' || '''' || quote_literal({{end_date}}) || '''' || ' ::DATE]]

)
SELECT i.uuid              uuid,
       i.gender            gender_name,
       alt.name address_type,
       a.title address_name
FROM individual_program_partitions ip
LEFT OUTER JOIN adsr.individual i ON i.uuid = ip.iuuid
LEFT OUTER JOIN address_level a on i.address_id = a.id
LEFT OUTER JOIN address_level_type alt on alt.id = a.type_id
WHERE ip.observations IS NOT NULL
AND ip.observations not like ''''%No problem%''''
AND erank = 1
AND a.is_voided = false and i.is_voided = false
[[and a.title = ' || '''' || quote_literal({{title}}) || '''' || ']]'', ''with agg_data as (
  select individual_id,
         "Menstruation started"
  from adsr.individual_adolescent_annual_visit_baseline
  where  encounter_date_time is not null
  union all
  select individual_id,
         "Menstruation started"
  from adsr.individual_adolescent_annual_visit_endline
  where  encounter_date_time is not null
)

SELECT DISTINCT i.uuid   as uuid,
                gender   as gender_name,
                alt.name as address_type,
                a.title  as address_name
FROM agg_data lpe
JOIN adsr.individual i ON i.id = lpe.individual_id
JOIN address_level a ON a.id = i.address_id
JOIN address_level_type alt ON alt.id = a.type_id
JOIN program_enrolment e ON e.individual_id = i.id
WHERE program_exit_date_time is null
AND "Menstruation started" = ''''Yes''''
AND i.is_voided = false and a.is_voided = false
     [[ and e.enrolment_date_time >=(' || '''' || quote_literal({{ start_date }}) || '''' || '  ::DATE)]]
     [[and e.enrolment_date_time <=' || '''' || quote_literal({{end_date}}) || '''' || ' ::DATE]]
     [[and a.title = ' || '''' || quote_literal({{title}}) || '''' || ']]'')
UNION ALL
SELECT
''Headache''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''with agg_data as (
  select uuid,
         individual_id,
         program_enrolment_id,
         encounter_date_time,
         "Menstrual disorder"
  from adsr.individual_adolescent_annual_visit_baseline
  where  encounter_date_time is not null
  union all
  select uuid,
         individual_id,
         program_enrolment_id,
         encounter_date_time,
         "Menstrual disorder"
  from adsr.individual_adolescent_annual_visit_endline
  where  encounter_date_time is not null
), individual_program_partitions AS (
SELECT i.uuid          AS                                                           iuuid,
           row_number() OVER (PARTITION BY i.uuid ORDER BY pe.encounter_date_time desc) erank,
           pe.uuid         AS                                                           euuid,
pe."Menstrual disorder" AS                                                           observations,
pe.encounter_date_time
FROM agg_data pe
INNER JOIN adsr.individual_adolescent e ON pe.program_enrolment_id = e.id
INNER JOIN adsr.individual i ON e.individual_id = i.id
INNER JOIN address_level a ON a.id = i.address_id
WHERE program_exit_date_time isnull
[[ and e.enrolment_date_time >=(' || '''' || quote_literal({{ start_date }}) || '''' || '  ::DATE)]]
[[and e.enrolment_date_time <=' || '''' || quote_literal({{end_date}}) || '''' || ' ::DATE]]

)
SELECT i.uuid              uuid,
       i.gender            gender_name,
       alt.name address_type,
       a.title address_name
FROM individual_program_partitions ip
LEFT OUTER JOIN adsr.individual i ON i.uuid = ip.iuuid
LEFT OUTER JOIN address_level a on i.address_id = a.id
LEFT OUTER JOIN address_level_type alt on alt.id = a.type_id
WHERE ip.observations IS NOT NULL
AND ip.observations like ''''%Headache%''''
AND erank = 1
AND a.is_voided = false and i.is_voided = false
[[and a.title = ' || '''' || quote_literal({{title}}) || '''' || ']]'', ''with agg_data as (
  select uuid,
         individual_id,
         program_enrolment_id,
         encounter_date_time,
         "Menstrual disorder"
  from adsr.individual_adolescent_annual_visit_baseline
  where  encounter_date_time is not null
  union all
  select uuid,
         individual_id,
         program_enrolment_id,
         encounter_date_time,
         "Menstrual disorder"
  from adsr.individual_adolescent_annual_visit_endline
  where  encounter_date_time is not null
), individual_program_partitions AS (
SELECT i.uuid          AS                                                           iuuid,
           row_number() OVER (PARTITION BY i.uuid ORDER BY pe.encounter_date_time desc) erank,
           pe.uuid         AS                                                           euuid,
pe."Menstrual disorder" AS                                                           observations,
pe.encounter_date_time
FROM agg_data pe
INNER JOIN adsr.individual_adolescent e ON pe.program_enrolment_id = e.id
INNER JOIN adsr.individual i ON e.individual_id = i.id
INNER JOIN address_level a ON a.id = i.address_id
WHERE program_exit_date_time isnull
[[ and e.enrolment_date_time >=(' || '''' || quote_literal({{ start_date }}) || '''' || '  ::DATE)]]
[[and e.enrolment_date_time <=' || '''' || quote_literal({{end_date}}) || '''' || ' ::DATE]]

)
SELECT i.uuid              uuid,
       i.gender            gender_name,
       alt.name address_type,
       a.title address_name
FROM individual_program_partitions ip
LEFT OUTER JOIN adsr.individual i ON i.uuid = ip.iuuid
LEFT OUTER JOIN address_level a on i.address_id = a.id
LEFT OUTER JOIN address_level_type alt on alt.id = a.type_id
WHERE ip.observations IS NOT NULL
AND ip.observations not like ''''%No problem%''''
AND erank = 1
AND a.is_voided = false and i.is_voided = false
[[and a.title = ' || '''' || quote_literal({{title}}) || '''' || ']]'')
UNION ALL
SELECT
''Heavy Bleeding''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''with agg_data as (
  select uuid,
         individual_id,
         program_enrolment_id,
         encounter_date_time,
         "Menstrual disorder"
  from adsr.individual_adolescent_annual_visit_baseline
  where  encounter_date_time is not null
  union all
  select uuid,
         individual_id,
         program_enrolment_id,
         encounter_date_time,
         "Menstrual disorder"
  from adsr.individual_adolescent_annual_visit_endline
  where  encounter_date_time is not null
), individual_program_partitions AS (
SELECT i.uuid          AS                                                           iuuid,
           row_number() OVER (PARTITION BY i.uuid ORDER BY pe.encounter_date_time desc) erank,
           pe.uuid         AS                                                           euuid,
pe."Menstrual disorder" AS                                                           observations,
pe.encounter_date_time
FROM agg_data pe
INNER JOIN adsr.individual_adolescent e ON pe.program_enrolment_id = e.id
INNER JOIN adsr.individual i ON e.individual_id = i.id
INNER JOIN address_level a ON a.id = i.address_id
WHERE program_exit_date_time isnull
[[ and e.enrolment_date_time >=(' || '''' || quote_literal({{ start_date }}) || '''' || '  ::DATE)]]
[[and e.enrolment_date_time <=' || '''' || quote_literal({{end_date}}) || '''' || ' ::DATE]]

)
SELECT i.uuid              uuid,
       i.gender            gender_name,
       alt.name address_type,
       a.title address_name
FROM individual_program_partitions ip
LEFT OUTER JOIN adsr.individual i ON i.uuid = ip.iuuid
LEFT OUTER JOIN address_level a on i.address_id = a.id
LEFT OUTER JOIN address_level_type alt on alt.id = a.type_id
WHERE ip.observations IS NOT NULL
AND ip.observations like ''''%Heavy bleeding%''''
AND erank = 1
AND a.is_voided = false and i.is_voided = false
[[and a.title = ' || '''' || quote_literal({{title}}) || '''' || ']]'', ''with agg_data as (
  select uuid,
         individual_id,
         program_enrolment_id,
         encounter_date_time,
         "Menstrual disorder"
  from adsr.individual_adolescent_annual_visit_baseline
  where  encounter_date_time is not null
  union all
  select uuid,
         individual_id,
         program_enrolment_id,
         encounter_date_time,
         "Menstrual disorder"
  from adsr.individual_adolescent_annual_visit_endline
  where  encounter_date_time is not null
), individual_program_partitions AS (
SELECT i.uuid          AS                                                           iuuid,
           row_number() OVER (PARTITION BY i.uuid ORDER BY pe.encounter_date_time desc) erank,
           pe.uuid         AS                                                           euuid,
pe."Menstrual disorder" AS                                                           observations,
pe.encounter_date_time
FROM agg_data pe
INNER JOIN adsr.individual_adolescent e ON pe.program_enrolment_id = e.id
INNER JOIN adsr.individual i ON e.individual_id = i.id
INNER JOIN address_level a ON a.id = i.address_id
WHERE program_exit_date_time isnull
[[ and e.enrolment_date_time >=(' || '''' || quote_literal({{ start_date }}) || '''' || '  ::DATE)]]
[[and e.enrolment_date_time <=' || '''' || quote_literal({{end_date}}) || '''' || ' ::DATE]]

)
SELECT i.uuid              uuid,
       i.gender            gender_name,
       alt.name address_type,
       a.title address_name
FROM individual_program_partitions ip
LEFT OUTER JOIN adsr.individual i ON i.uuid = ip.iuuid
LEFT OUTER JOIN address_level a on i.address_id = a.id
LEFT OUTER JOIN address_level_type alt on alt.id = a.type_id
WHERE ip.observations IS NOT NULL
AND ip.observations not like ''''%No problem%''''
AND erank = 1
AND a.is_voided = false and i.is_voided = false
[[and a.title = ' || '''' || quote_literal({{title}}) || '''' || ']]'')
UNION ALL
SELECT
''Lower Abdominal Pain''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''with agg_data as (
  select uuid,
         individual_id,
         program_enrolment_id,
         encounter_date_time,
         "Menstrual disorder"
  from adsr.individual_adolescent_annual_visit_baseline
  where  encounter_date_time is not null
  union all
  select uuid,
         individual_id,
         program_enrolment_id,
         encounter_date_time,
         "Menstrual disorder"
  from adsr.individual_adolescent_annual_visit_endline
  where  encounter_date_time is not null
), individual_program_partitions AS (
SELECT i.uuid          AS                                                           iuuid,
           row_number() OVER (PARTITION BY i.uuid ORDER BY pe.encounter_date_time desc) erank,
           pe.uuid         AS                                                           euuid,
pe."Menstrual disorder" AS                                                           observations,
pe.encounter_date_time
FROM agg_data pe
INNER JOIN adsr.individual_adolescent e ON pe.program_enrolment_id = e.id
INNER JOIN adsr.individual i ON e.individual_id = i.id
INNER JOIN address_level a ON a.id = i.address_id
WHERE program_exit_date_time isnull
[[ and e.enrolment_date_time >=(' || '''' || quote_literal({{ start_date }}) || '''' || '  ::DATE)]]
[[and e.enrolment_date_time <=' || '''' || quote_literal({{end_date}}) || '''' || ' ::DATE]]

)
SELECT i.uuid              uuid,
       i.gender            gender_name,
       alt.name address_type,
       a.title address_name
FROM individual_program_partitions ip
LEFT OUTER JOIN adsr.individual i ON i.uuid = ip.iuuid
LEFT OUTER JOIN address_level a on i.address_id = a.id
LEFT OUTER JOIN address_level_type alt on alt.id = a.type_id
WHERE ip.observations IS NOT NULL
AND ip.observations like ''''%Lower abdominal pain%''''
AND erank = 1
AND a.is_voided = false and i.is_voided = false
[[and a.title = ' || '''' || quote_literal({{title}}) || '''' || ']]'', ''with agg_data as (
  select uuid,
         individual_id,
         program_enrolment_id,
         encounter_date_time,
         "Menstrual disorder"
  from adsr.individual_adolescent_annual_visit_baseline
  where  encounter_date_time is not null
  union all
  select uuid,
         individual_id,
         program_enrolment_id,
         encounter_date_time,
         "Menstrual disorder"
  from adsr.individual_adolescent_annual_visit_endline
  where  encounter_date_time is not null
), individual_program_partitions AS (
SELECT i.uuid          AS                                                           iuuid,
           row_number() OVER (PARTITION BY i.uuid ORDER BY pe.encounter_date_time desc) erank,
           pe.uuid         AS                                                           euuid,
pe."Menstrual disorder" AS                                                           observations,
pe.encounter_date_time
FROM agg_data pe
INNER JOIN adsr.individual_adolescent e ON pe.program_enrolment_id = e.id
INNER JOIN adsr.individual i ON e.individual_id = i.id
INNER JOIN address_level a ON a.id = i.address_id
WHERE program_exit_date_time isnull
[[ and e.enrolment_date_time >=(' || '''' || quote_literal({{ start_date }}) || '''' || '  ::DATE)]]
[[and e.enrolment_date_time <=' || '''' || quote_literal({{end_date}}) || '''' || ' ::DATE]]

)
SELECT i.uuid              uuid,
       i.gender            gender_name,
       alt.name address_type,
       a.title address_name
FROM individual_program_partitions ip
LEFT OUTER JOIN adsr.individual i ON i.uuid = ip.iuuid
LEFT OUTER JOIN address_level a on i.address_id = a.id
LEFT OUTER JOIN address_level_type alt on alt.id = a.type_id
WHERE ip.observations IS NOT NULL
AND ip.observations not like ''''%No problem%''''
AND erank = 1
AND a.is_voided = false and i.is_voided = false
[[and a.title = ' || '''' || quote_literal({{title}}) || '''' || ']]'')
UNION ALL
SELECT
''Abnormal Discharge''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''with agg_data as (
  select uuid,
         individual_id,
         program_enrolment_id,
         encounter_date_time,
         "Menstrual disorder"
  from adsr.individual_adolescent_annual_visit_baseline
  where  encounter_date_time is not null
  union all
  select uuid,
         individual_id,
         program_enrolment_id,
         encounter_date_time,
         "Menstrual disorder"
  from adsr.individual_adolescent_annual_visit_endline
  where  encounter_date_time is not null
), individual_program_partitions AS (
SELECT i.uuid          AS                                                           iuuid,
           row_number() OVER (PARTITION BY i.uuid ORDER BY pe.encounter_date_time desc) erank,
           pe.uuid         AS                                                           euuid,
pe."Menstrual disorder" AS                                                           observations,
pe.encounter_date_time
FROM agg_data pe
INNER JOIN adsr.individual_adolescent e ON pe.program_enrolment_id = e.id
INNER JOIN adsr.individual i ON e.individual_id = i.id
INNER JOIN address_level a ON a.id = i.address_id
WHERE program_exit_date_time isnull
[[ and e.enrolment_date_time >=(' || '''' || quote_literal({{ start_date }}) || '''' || '  ::DATE)]]
[[and e.enrolment_date_time <=' || '''' || quote_literal({{end_date}}) || '''' || ' ::DATE]]

)
SELECT i.uuid              uuid,
       i.gender            gender_name,
       alt.name address_type,
       a.title address_name
FROM individual_program_partitions ip
LEFT OUTER JOIN adsr.individual i ON i.uuid = ip.iuuid
LEFT OUTER JOIN address_level a on i.address_id = a.id
LEFT OUTER JOIN address_level_type alt on alt.id = a.type_id
WHERE ip.observations IS NOT NULL
AND ip.observations like ''''%Abnormal vaginal discharge%''''
AND erank = 1
AND a.is_voided = false and i.is_voided = false
[[and a.title = ' || '''' || quote_literal({{title}}) || '''' || ']]'', ''with agg_data as (
  select uuid,
         individual_id,
         program_enrolment_id,
         encounter_date_time,
         "Menstrual disorder"
  from adsr.individual_adolescent_annual_visit_baseline
  where  encounter_date_time is not null
  union all
  select uuid,
         individual_id,
         program_enrolment_id,
         encounter_date_time,
         "Menstrual disorder"
  from adsr.individual_adolescent_annual_visit_endline
  where  encounter_date_time is not null
), individual_program_partitions AS (
SELECT i.uuid          AS                                                           iuuid,
           row_number() OVER (PARTITION BY i.uuid ORDER BY pe.encounter_date_time desc) erank,
           pe.uuid         AS                                                           euuid,
pe."Menstrual disorder" AS                                                           observations,
pe.encounter_date_time
FROM agg_data pe
INNER JOIN adsr.individual_adolescent e ON pe.program_enrolment_id = e.id
INNER JOIN adsr.individual i ON e.individual_id = i.id
INNER JOIN address_level a ON a.id = i.address_id
WHERE program_exit_date_time isnull
[[ and e.enrolment_date_time >=(' || '''' || quote_literal({{ start_date }}) || '''' || '  ::DATE)]]
[[and e.enrolment_date_time <=' || '''' || quote_literal({{end_date}}) || '''' || ' ::DATE]]

)
SELECT i.uuid              uuid,
       i.gender            gender_name,
       alt.name address_type,
       a.title address_name
FROM individual_program_partitions ip
LEFT OUTER JOIN adsr.individual i ON i.uuid = ip.iuuid
LEFT OUTER JOIN address_level a on i.address_id = a.id
LEFT OUTER JOIN address_level_type alt on alt.id = a.type_id
WHERE ip.observations IS NOT NULL
AND ip.observations not like ''''%No problem%''''
AND erank = 1
AND a.is_voided = false and i.is_voided = false
[[and a.title = ' || '''' || quote_literal({{title}}) || '''' || ']]'')
UNION ALL
SELECT
''Backache''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''with agg_data as (
  select uuid,
         individual_id,
         program_enrolment_id,
         encounter_date_time,
         "Menstrual disorder"
  from adsr.individual_adolescent_annual_visit_baseline
  where  encounter_date_time is not null
  union all
  select uuid,
         individual_id,
         program_enrolment_id,
         encounter_date_time,
         "Menstrual disorder"
  from adsr.individual_adolescent_annual_visit_endline
  where  encounter_date_time is not null
), individual_program_partitions AS (
SELECT i.uuid          AS                                                           iuuid,
           row_number() OVER (PARTITION BY i.uuid ORDER BY pe.encounter_date_time desc) erank,
           pe.uuid         AS                                                           euuid,
pe."Menstrual disorder" AS                                                           observations,
pe.encounter_date_time
FROM agg_data pe
INNER JOIN adsr.individual_adolescent e ON pe.program_enrolment_id = e.id
INNER JOIN adsr.individual i ON e.individual_id = i.id
INNER JOIN address_level a ON a.id = i.address_id
WHERE program_exit_date_time isnull
[[ and e.enrolment_date_time >=(' || '''' || quote_literal({{ start_date }}) || '''' || '  ::DATE)]]
[[and e.enrolment_date_time <=' || '''' || quote_literal({{end_date}}) || '''' || ' ::DATE]]

)
SELECT i.uuid              uuid,
       i.gender            gender_name,
       alt.name address_type,
       a.title address_name
FROM individual_program_partitions ip
LEFT OUTER JOIN adsr.individual i ON i.uuid = ip.iuuid
LEFT OUTER JOIN address_level a on i.address_id = a.id
LEFT OUTER JOIN address_level_type alt on alt.id = a.type_id
WHERE ip.observations IS NOT NULL
AND ip.observations like ''''%Backache%''''
AND erank = 1
AND a.is_voided = false and i.is_voided = false
[[and a.title = ' || '''' || quote_literal({{title}}) || '''' || ']]'', ''with agg_data as (
  select uuid,
         individual_id,
         program_enrolment_id,
         encounter_date_time,
         "Menstrual disorder"
  from adsr.individual_adolescent_annual_visit_baseline
  where  encounter_date_time is not null
  union all
  select uuid,
         individual_id,
         program_enrolment_id,
         encounter_date_time,
         "Menstrual disorder"
  from adsr.individual_adolescent_annual_visit_endline
  where  encounter_date_time is not null
), individual_program_partitions AS (
SELECT i.uuid          AS                                                           iuuid,
           row_number() OVER (PARTITION BY i.uuid ORDER BY pe.encounter_date_time desc) erank,
           pe.uuid         AS                                                           euuid,
pe."Menstrual disorder" AS                                                           observations,
pe.encounter_date_time
FROM agg_data pe
INNER JOIN adsr.individual_adolescent e ON pe.program_enrolment_id = e.id
INNER JOIN adsr.individual i ON e.individual_id = i.id
INNER JOIN address_level a ON a.id = i.address_id
WHERE program_exit_date_time isnull
[[ and e.enrolment_date_time >=(' || '''' || quote_literal({{ start_date }}) || '''' || '  ::DATE)]]
[[and e.enrolment_date_time <=' || '''' || quote_literal({{end_date}}) || '''' || ' ::DATE]]

)
SELECT i.uuid              uuid,
       i.gender            gender_name,
       alt.name address_type,
       a.title address_name
FROM individual_program_partitions ip
LEFT OUTER JOIN adsr.individual i ON i.uuid = ip.iuuid
LEFT OUTER JOIN address_level a on i.address_id = a.id
LEFT OUTER JOIN address_level_type alt on alt.id = a.type_id
WHERE ip.observations IS NOT NULL
AND ip.observations not like ''''%No problem%''''
AND erank = 1
AND a.is_voided = false and i.is_voided = false
[[and a.title = ' || '''' || quote_literal({{title}}) || '''' || ']]'')
UNION ALL
SELECT
''Leg Pain''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''with agg_data as (
  select uuid,
         individual_id,
         program_enrolment_id,
         encounter_date_time,
         "Menstrual disorder"
  from adsr.individual_adolescent_annual_visit_baseline
  where  encounter_date_time is not null
  union all
  select uuid,
         individual_id,
         program_enrolment_id,
         encounter_date_time,
         "Menstrual disorder"
  from adsr.individual_adolescent_annual_visit_endline
  where  encounter_date_time is not null
), individual_program_partitions AS (
SELECT i.uuid          AS                                                           iuuid,
           row_number() OVER (PARTITION BY i.uuid ORDER BY pe.encounter_date_time desc) erank,
           pe.uuid         AS                                                           euuid,
pe."Menstrual disorder" AS                                                           observations,
pe.encounter_date_time
FROM agg_data pe
INNER JOIN adsr.individual_adolescent e ON pe.program_enrolment_id = e.id
INNER JOIN adsr.individual i ON e.individual_id = i.id
INNER JOIN address_level a ON a.id = i.address_id
WHERE program_exit_date_time isnull
[[ and e.enrolment_date_time >=(' || '''' || quote_literal({{ start_date }}) || '''' || '  ::DATE)]]
[[and e.enrolment_date_time <=' || '''' || quote_literal({{end_date}}) || '''' || ' ::DATE]]

)
SELECT i.uuid              uuid,
       i.gender            gender_name,
       alt.name address_type,
       a.title address_name
FROM individual_program_partitions ip
LEFT OUTER JOIN adsr.individual i ON i.uuid = ip.iuuid
LEFT OUTER JOIN address_level a on i.address_id = a.id
LEFT OUTER JOIN address_level_type alt on alt.id = a.type_id
WHERE ip.observations IS NOT NULL
AND ip.observations like ''''%Leg pain%''''
AND erank = 1
AND a.is_voided = false and i.is_voided = false
[[and a.title = ' || '''' || quote_literal({{title}}) || '''' || ']]'', ''with agg_data as (
  select uuid,
         individual_id,
         program_enrolment_id,
         encounter_date_time,
         "Menstrual disorder"
  from adsr.individual_adolescent_annual_visit_baseline
  where  encounter_date_time is not null
  union all
  select uuid,
         individual_id,
         program_enrolment_id,
         encounter_date_time,
         "Menstrual disorder"
  from adsr.individual_adolescent_annual_visit_endline
  where  encounter_date_time is not null
), individual_program_partitions AS (
SELECT i.uuid          AS                                                           iuuid,
           row_number() OVER (PARTITION BY i.uuid ORDER BY pe.encounter_date_time desc) erank,
           pe.uuid         AS                                                           euuid,
pe."Menstrual disorder" AS                                                           observations,
pe.encounter_date_time
FROM agg_data pe
INNER JOIN adsr.individual_adolescent e ON pe.program_enrolment_id = e.id
INNER JOIN adsr.individual i ON e.individual_id = i.id
INNER JOIN address_level a ON a.id = i.address_id
WHERE program_exit_date_time isnull
[[ and e.enrolment_date_time >=(' || '''' || quote_literal({{ start_date }}) || '''' || '  ::DATE)]]
[[and e.enrolment_date_time <=' || '''' || quote_literal({{end_date}}) || '''' || ' ::DATE]]

)
SELECT i.uuid              uuid,
       i.gender            gender_name,
       alt.name address_type,
       a.title address_name
FROM individual_program_partitions ip
LEFT OUTER JOIN adsr.individual i ON i.uuid = ip.iuuid
LEFT OUTER JOIN address_level a on i.address_id = a.id
LEFT OUTER JOIN address_level_type alt on alt.id = a.type_id
WHERE ip.observations IS NOT NULL
AND ip.observations not like ''''%No problem%''''
AND erank = 1
AND a.is_voided = false and i.is_voided = false
[[and a.title = ' || '''' || quote_literal({{title}}) || '''' || ']]'')
UNION ALL
SELECT
''Nausea And Vomiting''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''with agg_data as (
  select uuid,
         individual_id,
         program_enrolment_id,
         encounter_date_time,
         "Menstrual disorder"
  from adsr.individual_adolescent_annual_visit_baseline
  where  encounter_date_time is not null
  union all
  select uuid,
         individual_id,
         program_enrolment_id,
         encounter_date_time,
         "Menstrual disorder"
  from adsr.individual_adolescent_annual_visit_endline
  where  encounter_date_time is not null
), individual_program_partitions AS (
SELECT i.uuid          AS                                                           iuuid,
           row_number() OVER (PARTITION BY i.uuid ORDER BY pe.encounter_date_time desc) erank,
           pe.uuid         AS                                                           euuid,
pe."Menstrual disorder" AS                                                           observations,
pe.encounter_date_time
FROM agg_data pe
INNER JOIN adsr.individual_adolescent e ON pe.program_enrolment_id = e.id
INNER JOIN adsr.individual i ON e.individual_id = i.id
INNER JOIN address_level a ON a.id = i.address_id
WHERE program_exit_date_time isnull
[[ and e.enrolment_date_time >=(' || '''' || quote_literal({{ start_date }}) || '''' || '  ::DATE)]]
[[and e.enrolment_date_time <=' || '''' || quote_literal({{end_date}}) || '''' || ' ::DATE]]

)
SELECT i.uuid              uuid,
       i.gender            gender_name,
       alt.name address_type,
       a.title address_name
FROM individual_program_partitions ip
LEFT OUTER JOIN adsr.individual i ON i.uuid = ip.iuuid
LEFT OUTER JOIN address_level a on i.address_id = a.id
LEFT OUTER JOIN address_level_type alt on alt.id = a.type_id
WHERE ip.observations IS NOT NULL
AND ip.observations like ''''%Nausea-Vomiting%''''
AND erank = 1
AND a.is_voided = false and i.is_voided = false
[[and a.title = ' || '''' || quote_literal({{title}}) || '''' || ']]'', ''with agg_data as (
  select uuid,
         individual_id,
         program_enrolment_id,
         encounter_date_time,
         "Menstrual disorder"
  from adsr.individual_adolescent_annual_visit_baseline
  where  encounter_date_time is not null
  union all
  select uuid,
         individual_id,
         program_enrolment_id,
         encounter_date_time,
         "Menstrual disorder"
  from adsr.individual_adolescent_annual_visit_endline
  where  encounter_date_time is not null
), individual_program_partitions AS (
SELECT i.uuid          AS                                                           iuuid,
           row_number() OVER (PARTITION BY i.uuid ORDER BY pe.encounter_date_time desc) erank,
           pe.uuid         AS                                                           euuid,
pe."Menstrual disorder" AS                                                           observations,
pe.encounter_date_time
FROM agg_data pe
INNER JOIN adsr.individual_adolescent e ON pe.program_enrolment_id = e.id
INNER JOIN adsr.individual i ON e.individual_id = i.id
INNER JOIN address_level a ON a.id = i.address_id
WHERE program_exit_date_time isnull
[[ and e.enrolment_date_time >=(' || '''' || quote_literal({{ start_date }}) || '''' || '  ::DATE)]]
[[and e.enrolment_date_time <=' || '''' || quote_literal({{end_date}}) || '''' || ' ::DATE]]

)
SELECT i.uuid              uuid,
       i.gender            gender_name,
       alt.name address_type,
       a.title address_name
FROM individual_program_partitions ip
LEFT OUTER JOIN adsr.individual i ON i.uuid = ip.iuuid
LEFT OUTER JOIN address_level a on i.address_id = a.id
LEFT OUTER JOIN address_level_type alt on alt.id = a.type_id
WHERE ip.observations IS NOT NULL
AND ip.observations not like ''''%No problem%''''
AND erank = 1
AND a.is_voided = false and i.is_voided = false
[[and a.title = ' || '''' || quote_literal({{title}}) || '''' || ']]'')
UNION ALL
SELECT
''Irregular mensis''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''with agg_data as (
  select uuid,
         individual_id,
         program_enrolment_id,
         encounter_date_time,
         "Menstrual disorder"
  from adsr.individual_adolescent_annual_visit_baseline
  where  encounter_date_time is not null
  union all
  select uuid,
         individual_id,
         program_enrolment_id,
         encounter_date_time,
         "Menstrual disorder"
  from adsr.individual_adolescent_annual_visit_endline
  where  encounter_date_time is not null
), individual_program_partitions AS (
SELECT i.uuid          AS                                                           iuuid,
           row_number() OVER (PARTITION BY i.uuid ORDER BY pe.encounter_date_time desc) erank,
           pe.uuid         AS                                                           euuid,
pe."Menstrual disorder" AS                                                           observations,
pe.encounter_date_time
FROM agg_data pe
INNER JOIN adsr.individual_adolescent e ON pe.program_enrolment_id = e.id
INNER JOIN adsr.individual i ON e.individual_id = i.id
INNER JOIN address_level a ON a.id = i.address_id
WHERE program_exit_date_time isnull
[[ and e.enrolment_date_time >=(' || '''' || quote_literal({{ start_date }}) || '''' || '  ::DATE)]]
[[and e.enrolment_date_time <=' || '''' || quote_literal({{end_date}}) || '''' || ' ::DATE]]

)
SELECT i.uuid              uuid,
       i.gender            gender_name,
       alt.name address_type,
       a.title address_name
FROM individual_program_partitions ip
LEFT OUTER JOIN adsr.individual i ON i.uuid = ip.iuuid
LEFT OUTER JOIN address_level a on i.address_id = a.id
LEFT OUTER JOIN address_level_type alt on alt.id = a.type_id
WHERE ip.observations IS NOT NULL
AND ip.observations like ''''%Irregular mensis%''''
AND erank = 1
AND a.is_voided = false and i.is_voided = false
[[and a.title = ' || '''' || quote_literal({{title}}) || '''' || ']]'', ''with agg_data as (
  select uuid,
         individual_id,
         program_enrolment_id,
         encounter_date_time,
         "Menstrual disorder"
  from adsr.individual_adolescent_annual_visit_baseline
  where  encounter_date_time is not null
  union all
  select uuid,
         individual_id,
         program_enrolment_id,
         encounter_date_time,
         "Menstrual disorder"
  from adsr.individual_adolescent_annual_visit_endline
  where  encounter_date_time is not null
), individual_program_partitions AS (
SELECT i.uuid          AS                                                           iuuid,
           row_number() OVER (PARTITION BY i.uuid ORDER BY pe.encounter_date_time desc) erank,
           pe.uuid         AS                                                           euuid,
pe."Menstrual disorder" AS                                                           observations,
pe.encounter_date_time
FROM agg_data pe
INNER JOIN adsr.individual_adolescent e ON pe.program_enrolment_id = e.id
INNER JOIN adsr.individual i ON e.individual_id = i.id
INNER JOIN address_level a ON a.id = i.address_id
WHERE program_exit_date_time isnull
[[ and e.enrolment_date_time >=(' || '''' || quote_literal({{ start_date }}) || '''' || '  ::DATE)]]
[[and e.enrolment_date_time <=' || '''' || quote_literal({{end_date}}) || '''' || ' ::DATE]]

)
SELECT i.uuid              uuid,
       i.gender            gender_name,
       alt.name address_type,
       a.title address_name
FROM individual_program_partitions ip
LEFT OUTER JOIN adsr.individual i ON i.uuid = ip.iuuid
LEFT OUTER JOIN address_level a on i.address_id = a.id
LEFT OUTER JOIN address_level_type alt on alt.id = a.type_id
WHERE ip.observations IS NOT NULL
AND ip.observations not like ''''%No problem%''''
AND erank = 1
AND a.is_voided = false and i.is_voided = false
[[and a.title = ' || '''' || quote_literal({{title}}) || '''' || ']]'')') AS (
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