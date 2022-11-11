with agg_data as (select uuid,
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
WHERE (lpe."Sickling test result" = 'Disease'
OR lpe."Sickling test result" = 'Trait')