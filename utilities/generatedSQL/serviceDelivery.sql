SELECT 'Total adolescents enrolled',
 count(*) FILTER (WHERE gender.name = 'Male' and address_level.type = 'Village') AS "Village - Male", 
 count(*) FILTER (WHERE gender.name = 'Female' and address_level.type = 'Village') AS "Village - Female", 
 count(*) FILTER (WHERE address_level.type = 'Village') AS "Village - Total", 
 count(*) FILTER (WHERE gender.name = 'Male' and address_level.type = 'School') AS "School - Male", 
 count(*) FILTER (WHERE gender.name = 'Female' and address_level.type = 'School') AS "School - Female", 
 count(*) FILTER (WHERE address_level.type = 'School') AS "School - Total", 
 count(*) FILTER (WHERE gender.name = 'Male' and address_level.type = 'Boarding School') AS "Village - Male", 
 count(*) FILTER (WHERE gender.name = 'Female' and address_level.type = 'Boarding School') AS "Village - Female", 
 count(*) FILTER (WHERE address_level.type = 'Boarding School') AS "Boarding School - Total"
 from program_enrolment INNER JOIN program ON program_enrolment.program_id = program.id
INNER JOIN individual ON program_enrolment.individual_id = individual.id
INNER JOIN gender ON individual.gender_id = gender.id
INNER JOIN address_level ON address_level.id = individual.address_id
WHERE program.name = 'Adolescent' UNION 
SELECT 'Total adolescents having problem',
 count(CASE WHEN has_problem THEN 1 END) FILTER (WHERE gender_name = 'Male' and address_level_type = 'Village') AS "Village - Male", 
 count(CASE WHEN has_problem THEN 1 END) FILTER (WHERE gender_name = 'Female' and address_level_type = 'Village') AS "Village - Female", 
 count(CASE WHEN has_problem THEN 1 END) FILTER (WHERE address_level_type = 'Village') AS "Village - Total", 
 count(CASE WHEN has_problem THEN 1 END) FILTER (WHERE gender_name = 'Male' and address_level_type = 'School') AS "School - Male", 
 count(CASE WHEN has_problem THEN 1 END) FILTER (WHERE gender_name = 'Female' and address_level_type = 'School') AS "School - Female", 
 count(CASE WHEN has_problem THEN 1 END) FILTER (WHERE address_level_type = 'School') AS "School - Total", 
 count(CASE WHEN has_problem THEN 1 END) FILTER (WHERE gender_name = 'Male' and address_level_type = 'Boarding School') AS "Village - Male", 
 count(CASE WHEN has_problem THEN 1 END) FILTER (WHERE gender_name = 'Female' and address_level_type = 'Boarding School') AS "Village - Female", 
 count(CASE WHEN has_problem THEN 1 END) FILTER (WHERE address_level_type = 'Boarding School') AS "Boarding School - Total"
 from (SELECT bool_and(has_problem(program_encounter.observations)) AS has_problem, gender.name gender_name, address_level.type address_level_type from program_encounter
INNER JOIN program_enrolment ON program_encounter.program_enrolment_id = program_enrolment.id
INNER JOIN encounter_type ON program_encounter.encounter_type_id = encounter_type.id INNER JOIN program ON program_enrolment.program_id = program.id
INNER JOIN individual ON program_enrolment.individual_id = individual.id
INNER JOIN gender ON individual.gender_id = gender.id
INNER JOIN address_level ON address_level.id = individual.address_id
WHERE program.name = 'Adolescent' GROUP BY program_encounter.program_enrolment_id, gender.name, address_level.type) AS encounter_function_output UNION 
SELECT 'Total adolescents counselled',
 count(CASE WHEN is_counselled THEN 1 END) FILTER (WHERE gender_name = 'Male' and address_level_type = 'Village') AS "Village - Male", 
 count(CASE WHEN is_counselled THEN 1 END) FILTER (WHERE gender_name = 'Female' and address_level_type = 'Village') AS "Village - Female", 
 count(CASE WHEN is_counselled THEN 1 END) FILTER (WHERE address_level_type = 'Village') AS "Village - Total", 
 count(CASE WHEN is_counselled THEN 1 END) FILTER (WHERE gender_name = 'Male' and address_level_type = 'School') AS "School - Male", 
 count(CASE WHEN is_counselled THEN 1 END) FILTER (WHERE gender_name = 'Female' and address_level_type = 'School') AS "School - Female", 
 count(CASE WHEN is_counselled THEN 1 END) FILTER (WHERE address_level_type = 'School') AS "School - Total", 
 count(CASE WHEN is_counselled THEN 1 END) FILTER (WHERE gender_name = 'Male' and address_level_type = 'Boarding School') AS "Village - Male", 
 count(CASE WHEN is_counselled THEN 1 END) FILTER (WHERE gender_name = 'Female' and address_level_type = 'Boarding School') AS "Village - Female", 
 count(CASE WHEN is_counselled THEN 1 END) FILTER (WHERE address_level_type = 'Boarding School') AS "Boarding School - Total"
 from (SELECT bool_and(is_counselled(program_encounter.observations)) AS is_counselled, gender.name gender_name, address_level.type address_level_type from program_encounter
INNER JOIN program_enrolment ON program_encounter.program_enrolment_id = program_enrolment.id
INNER JOIN encounter_type ON program_encounter.encounter_type_id = encounter_type.id INNER JOIN program ON program_enrolment.program_id = program.id
INNER JOIN individual ON program_enrolment.individual_id = individual.id
INNER JOIN gender ON individual.gender_id = gender.id
INNER JOIN address_level ON address_level.id = individual.address_id
WHERE program.name = 'Adolescent' GROUP BY program_encounter.program_enrolment_id, gender.name, address_level.type) AS encounter_function_output UNION 
SELECT 'Total adolescents dropped out',
 count(CASE WHEN has_dropped_out THEN 1 END) FILTER (WHERE gender_name = 'Male' and address_level_type = 'Village') AS "Village - Male", 
 count(CASE WHEN has_dropped_out THEN 1 END) FILTER (WHERE gender_name = 'Female' and address_level_type = 'Village') AS "Village - Female", 
 count(CASE WHEN has_dropped_out THEN 1 END) FILTER (WHERE address_level_type = 'Village') AS "Village - Total", 
 count(CASE WHEN has_dropped_out THEN 1 END) FILTER (WHERE gender_name = 'Male' and address_level_type = 'School') AS "School - Male", 
 count(CASE WHEN has_dropped_out THEN 1 END) FILTER (WHERE gender_name = 'Female' and address_level_type = 'School') AS "School - Female", 
 count(CASE WHEN has_dropped_out THEN 1 END) FILTER (WHERE address_level_type = 'School') AS "School - Total", 
 count(CASE WHEN has_dropped_out THEN 1 END) FILTER (WHERE gender_name = 'Male' and address_level_type = 'Boarding School') AS "Village - Male", 
 count(CASE WHEN has_dropped_out THEN 1 END) FILTER (WHERE gender_name = 'Female' and address_level_type = 'Boarding School') AS "Village - Female", 
 count(CASE WHEN has_dropped_out THEN 1 END) FILTER (WHERE address_level_type = 'Boarding School') AS "Boarding School - Total"
 from (SELECT bool_and(has_dropped_out(program_enrolment.observations, program_encounter.observations)) AS has_dropped_out, gender.name gender_name, address_level.type address_level_type from program_encounter
INNER JOIN program_enrolment ON program_encounter.program_enrolment_id = program_enrolment.id
INNER JOIN encounter_type ON program_encounter.encounter_type_id = encounter_type.id INNER JOIN program ON program_enrolment.program_id = program.id
INNER JOIN individual ON program_enrolment.individual_id = individual.id
INNER JOIN gender ON individual.gender_id = gender.id
INNER JOIN address_level ON address_level.id = individual.address_id
WHERE program.name = 'Adolescent' GROUP BY program_encounter.program_enrolment_id, gender.name, address_level.type) AS encounter_function_output UNION 
SELECT 'Total adolescents whose home visits done',
 count(CASE WHEN home_visit_done THEN 1 END) FILTER (WHERE gender_name = 'Male' and address_level_type = 'Village') AS "Village - Male", 
 count(CASE WHEN home_visit_done THEN 1 END) FILTER (WHERE gender_name = 'Female' and address_level_type = 'Village') AS "Village - Female", 
 count(CASE WHEN home_visit_done THEN 1 END) FILTER (WHERE address_level_type = 'Village') AS "Village - Total", 
 count(CASE WHEN home_visit_done THEN 1 END) FILTER (WHERE gender_name = 'Male' and address_level_type = 'School') AS "School - Male", 
 count(CASE WHEN home_visit_done THEN 1 END) FILTER (WHERE gender_name = 'Female' and address_level_type = 'School') AS "School - Female", 
 count(CASE WHEN home_visit_done THEN 1 END) FILTER (WHERE address_level_type = 'School') AS "School - Total", 
 count(CASE WHEN home_visit_done THEN 1 END) FILTER (WHERE gender_name = 'Male' and address_level_type = 'Boarding School') AS "Village - Male", 
 count(CASE WHEN home_visit_done THEN 1 END) FILTER (WHERE gender_name = 'Female' and address_level_type = 'Boarding School') AS "Village - Female", 
 count(CASE WHEN home_visit_done THEN 1 END) FILTER (WHERE address_level_type = 'Boarding School') AS "Boarding School - Total"
 from (SELECT bool_and(encounter_type.name = 'Dropout Home Visit') AS home_visit_done, gender.name gender_name, address_level.type address_level_type from program_encounter
INNER JOIN program_enrolment ON program_encounter.program_enrolment_id = program_enrolment.id
INNER JOIN encounter_type ON program_encounter.encounter_type_id = encounter_type.id INNER JOIN program ON program_enrolment.program_id = program.id
INNER JOIN individual ON program_enrolment.individual_id = individual.id
INNER JOIN gender ON individual.gender_id = gender.id
INNER JOIN address_level ON address_level.id = individual.address_id
WHERE program.name = 'Adolescent' GROUP BY program_encounter.program_enrolment_id, gender.name, address_level.type) AS encounter_function_output UNION 
SELECT 'Total adolescents referred',
 count(CASE WHEN is_referred THEN 1 END) FILTER (WHERE gender_name = 'Male' and address_level_type = 'Village') AS "Village - Male", 
 count(CASE WHEN is_referred THEN 1 END) FILTER (WHERE gender_name = 'Female' and address_level_type = 'Village') AS "Village - Female", 
 count(CASE WHEN is_referred THEN 1 END) FILTER (WHERE address_level_type = 'Village') AS "Village - Total", 
 count(CASE WHEN is_referred THEN 1 END) FILTER (WHERE gender_name = 'Male' and address_level_type = 'School') AS "School - Male", 
 count(CASE WHEN is_referred THEN 1 END) FILTER (WHERE gender_name = 'Female' and address_level_type = 'School') AS "School - Female", 
 count(CASE WHEN is_referred THEN 1 END) FILTER (WHERE address_level_type = 'School') AS "School - Total", 
 count(CASE WHEN is_referred THEN 1 END) FILTER (WHERE gender_name = 'Male' and address_level_type = 'Boarding School') AS "Village - Male", 
 count(CASE WHEN is_referred THEN 1 END) FILTER (WHERE gender_name = 'Female' and address_level_type = 'Boarding School') AS "Village - Female", 
 count(CASE WHEN is_referred THEN 1 END) FILTER (WHERE address_level_type = 'Boarding School') AS "Boarding School - Total"
 from (SELECT bool_and(coded_obs_exists(program_encounter, 'Refer to hospital for')) AS is_referred, gender.name gender_name, address_level.type address_level_type from program_encounter
INNER JOIN program_enrolment ON program_encounter.program_enrolment_id = program_enrolment.id
INNER JOIN encounter_type ON program_encounter.encounter_type_id = encounter_type.id INNER JOIN program ON program_enrolment.program_id = program.id
INNER JOIN individual ON program_enrolment.individual_id = individual.id
INNER JOIN gender ON individual.gender_id = gender.id
INNER JOIN address_level ON address_level.id = individual.address_id
WHERE program.name = 'Adolescent' GROUP BY program_encounter.program_enrolment_id, gender.name, address_level.type) AS encounter_function_output 