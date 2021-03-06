WITH latest_annual_visit AS (
    SELECT i.uuid          AS                                                                                 iuuid,
           (row_number() OVER (PARTITION BY individual_id ORDER BY pe.encounter_date_time desc) = 1)::boolean islatest,
           pe.uuid         AS                                                                                 euuid,
           pe.observations AS                                                                                 obs,
           pe.encounter_date_time
    FROM completed_program_encounter_view pe
             INNER JOIN non_exited_program_enrolment_view e ON pe.program_enrolment_id = e.id
             INNER JOIN individual_view i ON e.individual_id = i.id
    WHERE e.program_name = 'Adolescent'
      and pe.encounter_type_name = 'Annual Visit'
    [[ and e.enrolment_date_time >=(q1 || q4 || quote_literal({{ start_date }}) || q4 || q1  ::DATE)]]
  [[and e.enrolment_date_time <=q1 || q4 || quote_literal({{end_date}}) || q4 || q1 ::DATE]]
),
     latest_quarterly_visit AS (
         SELECT i.uuid          AS iuuid,
                (row_number() OVER (PARTITION BY individual_id ORDER BY pe.encounter_date_time desc) =
                 1)::boolean       islatest,
                pe.uuid         AS euuid,
                pe.observations AS obs,
                pe.encounter_date_time
         FROM completed_program_encounter_view pe
                  INNER JOIN non_exited_program_enrolment_view e ON pe.program_enrolment_id = e.id
                  INNER JOIN individual_view i ON e.individual_id = i.id
         WHERE e.program_name = 'Adolescent'
           and pe.encounter_type_name = 'Quarterly Visit'
    [[ and e.enrolment_date_time >=(q1 || q4 || quote_literal({{ start_date }}) || q4 || q1  ::DATE)]]
  [[and e.enrolment_date_time <=q1 || q4 || quote_literal({{end_date}}) || q4 || q1 ::DATE]]
     ),
     both_visits as (select *
                     from latest_annual_visit
                     where latest_annual_visit.islatest
                     union all
                     select *
                     from latest_quarterly_visit
                     where latest_quarterly_visit.islatest)
SELECT distinct ip.iuuid            uuid,
                i.gender            gender_name,
                i.addresslevel_type address_type,
                i.addresslevel_name address_name
FROM both_visits ip
         LEFT OUTER JOIN individual_gender_address_view i ON i.uuid = ip.iuuid
WHERE (ip.obs -> '0e620ea5-1a80-499f-9d07-b972a9130d60' IS NOT NULL
    OR ip.obs -> 'de5f1932-263b-48d2-8add-720c089aa6d6' IS NOT NULL)

