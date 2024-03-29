WITH ind_with_HB AS (
    SELECT i.uuid          AS                                                           iuuid,
           i.id            As                                                           id,
           pe.uuid         AS                                                           euuid,
           pe.observations AS                                                           obs,
           pe.encounter_date_time
    FROM completed_program_encounter_view pe
             INNER JOIN non_exited_program_enrolment_view e ON pe.program_enrolment_id = e.id
             INNER JOIN individual_view i ON e.individual_id = i.id
             INNER JOIN address_level a ON a.id = i.address_id
    WHERE e.program_name = 'Adolescent'
      AND (pe.encounter_type_name = 'Annual Visit' or pe.encounter_type_name = 'Quarterly Visit')
      AND pe.observations ->> 'f9ecabbc-2df2-4bfc-a6fa-aa417c50e11b' notnull
        [[ and e.enrolment_date_time >=(q1 || q4 || quote_literal({{ start_date }}) || q4 || q1  ::DATE)]]
    [[and e.enrolment_date_time <=q1 || q4 || quote_literal({{end_date}}) || q4 || q1 ::DATE]]
    [[and a.title = q1 || q4 || quote_literal({{title}}) || q4 || q1]]
)
SELECT i.uuid              as uuid,
       i.gender            as gender_name,
       i.addresslevel_type as address_type,
       i.addresslevel_name as address_name
FROM individual_gender_address_view i
         INNER JOIN non_exited_program_enrolment_view e ON e.individual_id = i.id
         INNER JOIN address_level a ON a.id = i.address_id
WHERE i.id in (select id from ind_with_HB)
          [[ and e.enrolment_date_time >=(q1 || q4 || quote_literal({{ start_date }}) || q4 || q1  ::DATE)]]
    [[and e.enrolment_date_time <=q1 || q4 || quote_literal({{end_date}}) || q4 || q1 ::DATE]]
    [[and a.title = q1 || q4 || quote_literal({{title}}) || q4 || q1]];
