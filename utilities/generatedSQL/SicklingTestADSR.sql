-- Generated Report
-- Name: SicklingTestADSR

with filters as (
    select coalesce( [[ {{start_date}} , ]] '1900-01-01'::timestamptz) start_date,
           coalesce( [[ {{end_date}} , ]] current_timestamp) end_date
)

SELECT * FROM crosstab('SELECT
''Total Tested Adolescents''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''WITH agg_data as (select uuid,
                         individual_id,
                         program_enrolment_id,
                         encounter_date_time,
                         "Sickling test result"
from adsr.individual_adolescent_annual_visit_baseline
where encounter_date_time is not null
union all
select uuid,
       individual_id,
       program_enrolment_id,
       encounter_date_time,
       "Sickling test result"
from adsr.individual_adolescent_annual_visit_endline
where encounter_date_time is not null)
, individual_program_partitions AS (
SELECT i.uuid          AS                                                           iuuid,
           row_number() OVER (PARTITION BY i.uuid ORDER BY pe.encounter_date_time desc) erank,
           pe.uuid         AS                                                           euuid,
pe."Sickling test result" AS                                                           obs,
pe.encounter_date_time
FROM agg_data pe
INNER JOIN adsr.individual_adolescent e ON pe.program_enrolment_id = e.id
INNER JOIN adsr.individual i ON e.individual_id = i.id
WHERE e.program_exit_date_time is null
)
SELECT distinct i.uuid              as uuid,
                i.gender            as gender_name,
                alt.name as address_type,
                a.title as address_name,
                ip.obs
FROM individual_program_partitions ip
JOIN adsr.individual i ON i.uuid = ip.iuuid
JOIN address_level a ON a.id = i.address_id
JOIN address_level_type alt ON alt.id = a.type_id
WHERE ip.obs  is not null
[[and e.enrolment_date_time >=(' || '''' || quote_literal({{ start_date }}) || '''' || '  ::DATE)]]
[[and e.enrolment_date_time <=' || '''' || quote_literal({{end_date}}) || '''' || ' ::DATE]]
[[and a.title = ' || '''' || quote_literal({{title}}) || '''' || ']]'', ''SELECT DISTINCT i.uuid uuid, i.gender gender_name, alt.name address_type, a.title address_name
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
''Negative''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''WITH agg_data as (select uuid,
                         individual_id,
                         program_enrolment_id,
                         encounter_date_time,
                         "Sickling test result"
from adsr.individual_adolescent_annual_visit_baseline
where encounter_date_time is not null
union all
select uuid,
       individual_id,
       program_enrolment_id,
       encounter_date_time,
       "Sickling test result"
from adsr.individual_adolescent_annual_visit_endline
where encounter_date_time is not null)
, individual_program_partitions AS (SELECT i.uuid                    AS                                    iuuid,
                                              row_number()
                                              OVER (PARTITION BY i.uuid ORDER BY pe.encounter_date_time desc) erank,
                                              pe.uuid                   AS                                    euuid,
pe."Sickling test result" AS                                    obs,
pe.encounter_date_time
FROM agg_data pe
INNER JOIN adsr.individual_adolescent e ON pe.program_enrolment_id = e.id
INNER JOIN adsr.individual i ON e.individual_id = i.id
WHERE e.program_exit_date_time is null)
SELECT distinct i.uuid   as uuid,
                i.gender as gender_name,
                alt.name as address_type,
                a.title  as address_name
FROM individual_program_partitions ip
JOIN adsr.individual i ON i.uuid = ip.iuuid
JOIN address_level a on a.id = i.address_id
JOIN address_level_type alt on a.type_id = alt.id
WHERE ip.obs = ''''Negative''''
[[ and e.enrolment_date_time >= (' || '''' || quote_literal({{ start_date }}) || '''' || ' ::DATE)]]
[[and e.enrolment_date_time <=' || '''' || quote_literal({{end_date}}) || '''' || ' ::DATE]]
[[and i.addresslevel_name = ' || '''' || quote_literal({{title}}) || '''' || ']]'', ''WITH agg_data as (select uuid,
                         individual_id,
                         program_enrolment_id,
                         encounter_date_time,
                         "Sickling test result"
from adsr.individual_adolescent_annual_visit_baseline
where encounter_date_time is not null
union all
select uuid,
       individual_id,
       program_enrolment_id,
       encounter_date_time,
       "Sickling test result"
from adsr.individual_adolescent_annual_visit_endline
where encounter_date_time is not null)
, individual_program_partitions AS (
SELECT i.uuid          AS                                                           iuuid,
           row_number() OVER (PARTITION BY i.uuid ORDER BY pe.encounter_date_time desc) erank,
           pe.uuid         AS                                                           euuid,
pe."Sickling test result" AS                                                           obs,
pe.encounter_date_time
FROM agg_data pe
INNER JOIN adsr.individual_adolescent e ON pe.program_enrolment_id = e.id
INNER JOIN adsr.individual i ON e.individual_id = i.id
WHERE e.program_exit_date_time is null
)
SELECT distinct i.uuid              as uuid,
                i.gender            as gender_name,
                alt.name as address_type,
                a.title as address_name,
                ip.obs
FROM individual_program_partitions ip
JOIN adsr.individual i ON i.uuid = ip.iuuid
JOIN address_level a ON a.id = i.address_id
JOIN address_level_type alt ON alt.id = a.type_id
WHERE ip.obs  is not null
[[and e.enrolment_date_time >=(' || '''' || quote_literal({{ start_date }}) || '''' || '  ::DATE)]]
[[and e.enrolment_date_time <=' || '''' || quote_literal({{end_date}}) || '''' || ' ::DATE]]
[[and a.title = ' || '''' || quote_literal({{title}}) || '''' || ']]'')
UNION ALL
SELECT
''Counseling done for Trait''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''WITH agg_data as (select uuid,
                         individual_id,
                         program_enrolment_id,
                         encounter_date_time,
                         "Sickling test result"
from adsr.individual_adolescent_annual_visit_baseline
where encounter_date_time is not null
union all
select uuid,
       individual_id,
       program_enrolment_id,
       encounter_date_time,
       "Sickling test result"
from adsr.individual_adolescent_annual_visit_endline
where encounter_date_time is not null),
  individual_program_partitions AS (SELECT i.uuid                    AS                                    iuuid,
                                              row_number()
                                              OVER (PARTITION BY i.uuid ORDER BY pe.encounter_date_time desc) erank,
                                              pe.uuid                   AS                                    euuid,
pe."Sickling test result" AS                                    obs,
pe.encounter_date_time
FROM agg_data pe
INNER JOIN adsr.individual_adolescent e ON pe.program_enrolment_id = e.id
INNER JOIN adsr.individual i ON e.individual_id = i.id
INNER JOIN address_level a on i.address_id = a.id
WHERE e.program_exit_date_time is null
and i.is_voided = false
and "Sickling test result" = ''''Trait''''
[[and e.enrolment_date_time >=(' || '''' || quote_literal({{ start_date }}) || '''' || '  ::DATE)]]
[[and e.enrolment_date_time <=' || '''' || quote_literal({{end_date}}) || '''' || ' ::DATE]]
[[and a.title = ' || '''' || quote_literal({{title}}) || '''' || ']]
),
individual_program_partitions_couselling_done AS (SELECT i.uuid                AS                                        iuuid,
                                                              row_number()
                                                              OVER (PARTITION BY i.uuid ORDER BY pe.encounter_date_time desc) erank,
                                                              pe.uuid               AS                                        euuid,
pe."Counselling done" AS                                        obs,
pe.encounter_date_time
FROM adsr.individual_adolescent_sickle_cell_disease_followup pe
INNER JOIN adsr.individual_adolescent e ON pe.program_enrolment_id = e.id
INNER JOIN adsr.individual i ON e.individual_id = i.id
WHERE e.program_exit_date_time is null
AND "Counselling done" = ''''Yes''''
and pe.encounter_date_time is not null
and i.is_voided = false)
SELECT distinct i.uuid   as uuid,
                i.gender as gender_name,
                alt.name as address_type,
                a.title  as address_name,
                ip.obs   AS TEST_RESULT,
                c.obs
FROM individual_program_partitions ip
JOIN adsr.individual i ON i.uuid = ip.iuuid
JOIN address_level a on a.id = i.address_id
JOIN address_level_type alt on alt.id = a.type_id
JOIN individual_program_partitions_couselling_done c on c.iuuid = i.uuid
WHERE ip.erank = 1
and c.erank = 1'', ''with agg_data as (select uuid,
                         individual_id,
                         program_enrolment_id,
                         encounter_date_time,
                         "Sickling test result"
from adsr.individual_adolescent_annual_visit_baseline
where encounter_date_time is not null
union all
select uuid,
       individual_id,
       program_enrolment_id,
       encounter_date_time,
       "Sickling test result"
from adsr.individual_adolescent_annual_visit_endline
where encounter_date_time is not null),

  individual_program_partitions AS (SELECT i.uuid          AS                                                           iuuid,
                                              row_number() OVER (PARTITION BY i.uuid ORDER BY pe.encounter_date_time desc) erank,
                                              pe.uuid         AS                                                           euuid,
pe."Sickling test result" AS                                                           obs,
pe.encounter_date_time
FROM agg_data pe
INNER JOIN adsr.individual_adolescent e ON pe.program_enrolment_id = e.id
INNER JOIN adsr.individual i ON e.individual_id = i.id
INNER JOIN address_level a ON a.id = i.address_id
WHERE e.program_exit_date_time is null
AND pe."Sickling test result" = ''''Trait''''
[[and e.enrolment_date_time >=(' || '''' || quote_literal({{ start_date }}) || '''' || '  ::DATE)]]
[[and e.enrolment_date_time <=' || '''' || quote_literal({{end_date}}) || '''' || ' ::DATE]]
[[and a.title = ' || '''' || quote_literal({{title}}) || '''' || ']]
--
)

select distinct i.uuid              as uuid,
                i.gender            as gender_name,
                alt.name as address_type,
                a.title as address_name
FROM individual_program_partitions ip
JOIN adsr.individual i ON i.uuid = ip.iuuid
JOIN address_level a on a.id = i.address_id
JOIN address_level_type alt on alt.id = a.type_id
WHERE ip.erank = 1'')
UNION ALL
SELECT
''Counseling done for Disease''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''WITH agg_data as (select uuid,
                         individual_id,
                         program_enrolment_id,
                         encounter_date_time,
                         "Sickling test result"
from adsr.individual_adolescent_annual_visit_baseline
where encounter_date_time is not null
union all
select uuid,
       individual_id,
       program_enrolment_id,
       encounter_date_time,
       "Sickling test result"
from adsr.individual_adolescent_annual_visit_endline
where encounter_date_time is not null),
  individual_program_partitions AS (SELECT i.uuid                    AS                                    iuuid,
                                              row_number()
                                              OVER (PARTITION BY i.uuid ORDER BY pe.encounter_date_time desc) erank,
                                              pe.uuid                   AS                                    euuid,
pe."Sickling test result" AS                                    obs,
pe.encounter_date_time
FROM agg_data pe
INNER JOIN adsr.individual_adolescent e ON pe.program_enrolment_id = e.id
INNER JOIN adsr.individual i ON e.individual_id = i.id
INNER JOIN address_level a on i.address_id = a.id
WHERE e.program_exit_date_time is null
and i.is_voided = false
and "Sickling test result" = ''''Disease''''
[[and e.enrolment_date_time >=(' || '''' || quote_literal({{ start_date }}) || '''' || '  ::DATE)]]
[[and e.enrolment_date_time <=' || '''' || quote_literal({{end_date}}) || '''' || ' ::DATE]]
[[and a.title = ' || '''' || quote_literal({{title}}) || '''' || ']]
),
individual_program_partitions_couselling_done AS (SELECT i.uuid                AS                                        iuuid,
                                                              row_number()
                                                              OVER (PARTITION BY i.uuid ORDER BY pe.encounter_date_time desc) erank,
                                                              pe.uuid               AS                                        euuid,
pe."Counselling done" AS                                        obs,
pe.encounter_date_time
FROM adsr.individual_adolescent_sickle_cell_disease_followup pe
INNER JOIN adsr.individual_adolescent e ON pe.program_enrolment_id = e.id
INNER JOIN adsr.individual i ON e.individual_id = i.id
WHERE e.program_exit_date_time is null
AND "Counselling done" = ''''Yes''''
and pe.encounter_date_time is not null
and i.is_voided = false)
SELECT distinct i.uuid   as uuid,
                i.gender as gender_name,
                alt.name as address_type,
                a.title  as address_name,
                ip.obs   AS TEST_RESULT,
                c.obs
FROM individual_program_partitions ip
JOIN adsr.individual i ON i.uuid = ip.iuuid
JOIN address_level a on a.id = i.address_id
JOIN address_level_type alt on alt.id = a.type_id
JOIN individual_program_partitions_couselling_done c on c.iuuid = i.uuid
WHERE ip.erank = 1
and c.erank = 1'', ''with agg_data as (select uuid,
                         individual_id,
                         program_enrolment_id,
                         encounter_date_time,
                         "Sickling test result"
from adsr.individual_adolescent_annual_visit_baseline
where encounter_date_time is not null
union all
select uuid,
       individual_id,
       program_enrolment_id,
       encounter_date_time,
       "Sickling test result"
from adsr.individual_adolescent_annual_visit_endline
where encounter_date_time is not null),

  individual_program_partitions AS (SELECT i.uuid          AS                                                           iuuid,
                                              row_number() OVER (PARTITION BY i.uuid ORDER BY pe.encounter_date_time desc) erank,
                                              pe.uuid         AS                                                           euuid,
pe."Sickling test result" AS                                                           obs,
pe.encounter_date_time
FROM agg_data pe
INNER JOIN adsr.individual_adolescent e ON pe.program_enrolment_id = e.id
INNER JOIN adsr.individual i ON e.individual_id = i.id
INNER JOIN address_level a ON a.id = i.address_id
WHERE e.program_exit_date_time is null
AND pe."Sickling test result" = ''''Disease''''
[[and e.enrolment_date_time >=(' || '''' || quote_literal({{ start_date }}) || '''' || '  ::DATE)]]
[[and e.enrolment_date_time <=' || '''' || quote_literal({{end_date}}) || '''' || ' ::DATE]]
[[and a.title = ' || '''' || quote_literal({{title}}) || '''' || ']]
--
)

select distinct i.uuid              as uuid,
                i.gender            as gender_name,
                alt.name as address_type,
                a.title as address_name
FROM individual_program_partitions ip
JOIN adsr.individual i ON i.uuid = ip.iuuid
JOIN address_level a on a.id = i.address_id
JOIN address_level_type alt on alt.id = a.type_id
WHERE ip.erank = 1'')
UNION ALL
SELECT
''Referred''                                          rowid,
address_type || '' '' || gender AS                             attribute,
total :: VARCHAR || '' ('' || percentage :: VARCHAR(5) || ''%)'' frequency_percentage
FROM frequency_and_percentage(''WITH individual_program_partitions AS (
SELECT i.uuid          AS                                                           iuuid,
           row_number() OVER (PARTITION BY i.uuid ORDER BY pe.encounter_date_time desc) erank,
           pe.uuid         AS                                                           euuid,
pe."Have you been referred" AS                                                           obs,
pe.encounter_date_time
FROM adsr.individual_adolescent_sickle_cell_disease_followup pe
INNER JOIN adsr.individual_adolescent e ON pe.program_enrolment_id = e.id
INNER JOIN adsr.individual i ON e.individual_id = i.id
INNER JOIN address_level a ON a.id = i.address_id
WHERE e.program_exit_date_time is null
and pe.encounter_date_time is not null
[[and e.enrolment_date_time >=(' || '''' || quote_literal({{ start_date }}) || '''' || '  ::DATE)]]
[[and e.enrolment_date_time <=' || '''' || quote_literal({{end_date}}) || '''' || ' ::DATE]]
[[and a.title = ' || '''' || quote_literal({{title}}) || '''' || ']]
)

SELECT ip.iuuid            uuid,
       i.gender            gender_name,
       alt.name address_type,
       a.title address_name
FROM individual_program_partitions ip
LEFT OUTER JOIN adsr.individual i ON i.uuid = ip.iuuid
LEFT OUTER JOIN address_level a on a.id = i.address_id
LEFT OUTER JOIN address_level_type alt on alt.id = a.type_id
WHERE ip.obs = ''''Yes''''
AND erank = 1'', ''with agg_data as (select uuid,
                         individual_id,
                         program_enrolment_id,
                         encounter_date_time,
                         "Sickling test result"
from adsr.individual_adolescent_annual_visit_baseline
where encounter_date_time is not null
union all
select uuid,
       individual_id,
       program_enrolment_id,
       encounter_date_time,
       "Sickling test result"
from adsr.individual_adolescent_annual_visit_endline
where encounter_date_time is not null)
SELECT i.uuid as uuid,
       i.gender as gender_name,
       alt.name as address_type,
       a.title as address_name
FROM agg_data lpe
JOIN adsr.individual i ON i.id = lpe.individual_id
JOIN address_level a on a.id = i.address_id
JOIN address_level_type alt on alt.id = a.type_id
WHERE (lpe."Sickling test result" = ''''Disease''''
OR lpe."Sickling test result" = ''''Trait'''')'')') AS (
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