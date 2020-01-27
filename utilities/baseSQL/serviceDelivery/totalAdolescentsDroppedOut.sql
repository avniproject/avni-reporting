WITH individual_program_partitions AS (
    SELECT e.individual_id,
           (row_number()  OVER (PARTITION BY individual_id ORDER BY pe.encounter_date_time desc) = 1)::boolean islatest,
           pe.program_enrolment_id,
           pe.observations @> '{"575a29c3-a070-4c7d-ac96-fe58b6bddca3":"58f789aa-6570-4aea-87a7-1f7651729c5a"}' isdropout
    FROM completed_program_encounter_view pe
             INNER JOIN program_enrolment_view e ON pe.program_enrolment_id = e.id
    WHERE e.program_name = 'Adolescent'
      and (e.enrolment_date_time ISNULL OR e.enrolment_date_time between 'FILTERS.start_date' and 'FILTERS.end_date')
      AND (pe.encounter_type_name = 'Annual Visit' or pe.encounter_type_name = 'Quarterly Visit'))

SELECT DISTINCT
    i.uuid,
    i.gender,
    i.addresslevel_type,
    i.addresslevel_name
FROM individual_program_partitions pe
         JOIN individual_gender_address_view i ON pe.individual_id = i.id
WHERE pe.isdropout and pe.islatest;
