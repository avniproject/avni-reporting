
WITH individual_program_partitions AS (
    select individual_id,
           encounter_date_time,
           earliest_visit_date_time,
           is_voided,
           "Is there a swelling at lower back",
           "Does she remain absent during menstruation",
           "Is there any physical defect",
           "Do you suffer from ulcer over genitalia",
           "Is he/she slower than others in learning and unde (1127345045)",
           "Does he/she have difficulty in breathing while playing",
           "Are there dental carries",
           "Is his/her behaviour different from others",
           "Does he/she have impaired hearing",
           "Is there a white patch in her eyes",
           "Do you have multiple sexual partners",
           "Do you suffer from burning micturition",
           "Has he/she ever suffered from convulsions",
           "Is there pus coming from ear",
           "Is his/her nails/tongue pale",
           "Is there any developmental delay or disability seen",
           "Is there any problem in leg bone",
           "Do you suffer from yellowish discharge from vagina / penis",
           "Does he/she have impaired vision",
           "Is there a swelling over throat",
           "Do you perform unprotected sexual intercourse",
           "Sickling test result",
           "Do you have any addiction",
           "Does he/she have skin problems",
           "BMI (kg/m²)",
           "Haemoglobin",
           "Menstrual disorder"
    from adsr.individual_adolescent_annual_visit_baseline baseline
    where is_voided = false
      and encounter_date_time notnull
    union all
    select individual_id,
           encounter_date_time,
           earliest_visit_date_time,
           is_voided,
           "Is there a swelling at lower back",
           "Does she remain absent during menstruation",
           "Is there any physical defect",
           "Do you suffer from ulcer over genitalia",
           "Is he/she slower than others in learning and unde (1127345045)",
           "Does he/she have difficulty in breathing while playing",
           "Are there dental carries",
           "Is his/her behaviour different from others",
           "Does he/she have impaired hearing",
           "Is there a white patch in her eyes",
           "Do you have multiple sexual partners",
           "Do you suffer from burning micturition",
           "Has he/she ever suffered from convulsions",
           "Is there pus coming from ear",
           "Is his/her nails/tongue pale",
           "Is there any developmental delay or disability seen",
           "Is there any problem in leg bone",
           "Do you suffer from yellowish discharge from vagina / penis",
           "Does he/she have impaired vision",
           "Is there a swelling over throat",
           "Do you perform unprotected sexual intercourse",
           "Sickling test result",
           "Do you have any addiction",
           "Does he/she have skin problems",
           "BMI (kg/m²)",
           "Haemoglobin",
           "Menstrual disorder"
    from adsr.individual_adolescent_annual_visit_endline baseline
    where is_voided = false
      and encounter_date_time notnull
),
     ranked_data as (
         select *,
                row_number() OVER (PARTITION BY individual_id ORDER BY encounter_date_time desc) erank
         from individual_program_partitions
     )
SELECT i.uuid   as uuid,
       i.gender as gender_name,
       case
           when a."School" notnull then 'School'
           when a."Village" notnull then 'Village'
           when a."Boarding" notnull then 'Boarding'
           end  as address_type,
       case
           when a."School" notnull then a."School"
           when a."Village" notnull then a."Village"
           when a."Boarding" notnull then a."Boarding"
           end  as address_name
FROM ranked_data rd
         left join adsr.individual i on i.id = rd.individual_id
         left join adsr.individual_adolescent ia on i.id = ia.individual_id
         left join adsr.address a on a.id = i.address_id
WHERE ia.program_exit_date_time isnull
  AND erank = 1
  and i.is_voided = false
  and ia.is_voided = false
    and a.is_voided = false
   [[ and ia.enrolment_date_time >=(q1 || q4 || quote_literal({{ start_date }}) || q4 || q1  ::DATE)]]
    [[and ia.enrolment_date_time <=q1 || q4 || quote_literal({{end_date}}) || q4 || q1 ::DATE]]
  and (
            "Is there a swelling at lower back" = 'Yes'
        or "Does she remain absent during menstruation" = 'Yes'
        or "Is there any physical defect" = 'Yes'
        or "Do you suffer from ulcer over genitalia" = 'Yes'
        or "Is he/she slower than others in learning and unde (1127345045)" = 'Yes'
        or "Does he/she have difficulty in breathing while playing" = 'Yes'
        or "Are there dental carries" = 'Yes'
        or "Is his/her behaviour different from others" = 'Yes'
        or "Does he/she have impaired hearing" = 'Yes'
        or "Is there a white patch in her eyes" = 'Yes'
        or "Do you have multiple sexual partners" = 'Yes'
        or "Do you suffer from burning micturition" = 'Yes'
        or "Has he/she ever suffered from convulsions" = 'Yes'
        or "Is there pus coming from ear" = 'Yes'
        or "Is his/her nails/tongue pale" = 'Yes'
        or "Is there any developmental delay or disability seen" = 'Yes'
        or "Is there any problem in leg bone" = 'Yes'
        or "Do you suffer from yellowish discharge from vagina / penis" = 'Yes'
        or "Does he/she have impaired vision" = 'Yes'
        or "Is there a swelling over throat" = 'Yes'
        or "Do you perform unprotected sexual intercourse" = 'Yes'
        or "Sickling test result" = 'Disease'
        or "Do you have any addiction" <> 'None'
        or "Does he/she have skin problems" = 'Yes'
        or "BMI (kg/m²)"::float < 14.5
        or "Haemoglobin"::float <= 7
        or "Menstrual disorder" <> 'No problem'
    )
;