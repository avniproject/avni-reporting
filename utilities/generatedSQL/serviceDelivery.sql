SELECT Indicator, concat(VillageMale, ' (',((VillageMale*100)/(CASE WHEN VillageTotal=0 THEN 1 ELSE VillageTotal END)), '%)') as "VLG Male", concat(VillageFemale, ' (',((VillageFemale*100)/(CASE WHEN VillageTotal=0 THEN 1 ELSE VillageTotal END)), '%)') as "VLG Female", VillageTotal as "VLG Total", concat(SchoolMale, ' (',((SchoolMale*100)/(CASE WHEN SchoolTotal=0 THEN 1 ELSE SchoolTotal END)), '%)') as "SCH Male", concat(SchoolFemale, ' (',((SchoolFemale*100)/(CASE WHEN SchoolTotal=0 THEN 1 ELSE SchoolTotal END)), '%)') as "SCH Female", SchoolTotal as "SCH Total", concat(BoardingSchoolFemale, ' (',((BoardingSchoolFemale*100)/(CASE WHEN BoardingSchoolTotal=0 THEN 1 ELSE BoardingSchoolTotal END)), '%)') as "B-SCH Male", concat(BoardingSchoolFemale, ' (',((BoardingSchoolFemale*100)/(CASE WHEN BoardingSchoolTotal=0 THEN 1 ELSE BoardingSchoolTotal END)), '%)') as "B-SCH Female", BoardingSchoolTotal as "B-SCH Total" from (SELECT 1 DisplayOrder, 'Total adolescents enrolled' AS Indicator,
 count(*) FILTER (WHERE gender.name = 'Male' and address_level.type = 'Village') AS VillageMale, 
 count(*) FILTER (WHERE gender.name = 'Female' and address_level.type = 'Village') AS VillageFemale, 
 count(*) FILTER (WHERE address_level.type = 'Village') AS VillageTotal, 
 count(*) FILTER (WHERE gender.name = 'Male' and address_level.type = 'School') AS SchoolMale, 
 count(*) FILTER (WHERE gender.name = 'Female' and address_level.type = 'School') AS SchoolFemale, 
 count(*) FILTER (WHERE address_level.type = 'School') AS SchoolTotal, 
 count(*) FILTER (WHERE gender.name = 'Male' and address_level.type = 'Boarding School') AS BoardingSchoolMale, 
 count(*) FILTER (WHERE gender.name = 'Female' and address_level.type = 'Boarding School') AS BoardingSchoolFemale, 
 count(*) FILTER (WHERE address_level.type = 'Boarding School') AS BoardingSchoolTotal
 from program_enrolment INNER JOIN program ON program_enrolment.program_id = program.id
INNER JOIN individual ON program_enrolment.individual_id = individual.id
INNER JOIN gender ON individual.gender_id = gender.id
INNER JOIN address_level ON address_level.id = individual.address_id
WHERE program.name = 'Adolescent' UNION SELECT 2 DisplayOrder, 'Total adolescents having problem' AS Indicator,
 count(CASE WHEN has_problem THEN 1 END) FILTER (WHERE gender_name = 'Male' and address_level_type = 'Village') AS VillageMale, 
 count(CASE WHEN has_problem THEN 1 END) FILTER (WHERE gender_name = 'Female' and address_level_type = 'Village') AS VillageFemale, 
 count(CASE WHEN has_problem THEN 1 END) FILTER (WHERE address_level_type = 'Village') AS VillageTotal, 
 count(CASE WHEN has_problem THEN 1 END) FILTER (WHERE gender_name = 'Male' and address_level_type = 'School') AS SchoolMale, 
 count(CASE WHEN has_problem THEN 1 END) FILTER (WHERE gender_name = 'Female' and address_level_type = 'School') AS SchoolFemale, 
 count(CASE WHEN has_problem THEN 1 END) FILTER (WHERE address_level_type = 'School') AS SchoolTotal, 
 count(CASE WHEN has_problem THEN 1 END) FILTER (WHERE gender_name = 'Male' and address_level_type = 'Boarding School') AS BoardingSchoolMale, 
 count(CASE WHEN has_problem THEN 1 END) FILTER (WHERE gender_name = 'Female' and address_level_type = 'Boarding School') AS BoardingSchoolFemale, 
 count(CASE WHEN has_problem THEN 1 END) FILTER (WHERE address_level_type = 'Boarding School') AS BoardingSchoolTotal
 from (SELECT bool_or(has_problem(program_encounter.observations)) AS has_problem, gender.name gender_name, address_level.type address_level_type from program_encounter
INNER JOIN program_enrolment ON program_encounter.program_enrolment_id = program_enrolment.id
INNER JOIN encounter_type ON program_encounter.encounter_type_id = encounter_type.id INNER JOIN program ON program_enrolment.program_id = program.id
INNER JOIN individual ON program_enrolment.individual_id = individual.id
INNER JOIN gender ON individual.gender_id = gender.id
INNER JOIN address_level ON address_level.id = individual.address_id
WHERE program.name = 'Adolescent' GROUP BY program_encounter.program_enrolment_id, gender.name, address_level.type) AS encounter_function_output UNION SELECT 3 DisplayOrder, 'Total adolescents counselled' AS Indicator,
 count(CASE WHEN is_counselled THEN 1 END) FILTER (WHERE gender_name = 'Male' and address_level_type = 'Village') AS VillageMale, 
 count(CASE WHEN is_counselled THEN 1 END) FILTER (WHERE gender_name = 'Female' and address_level_type = 'Village') AS VillageFemale, 
 count(CASE WHEN is_counselled THEN 1 END) FILTER (WHERE address_level_type = 'Village') AS VillageTotal, 
 count(CASE WHEN is_counselled THEN 1 END) FILTER (WHERE gender_name = 'Male' and address_level_type = 'School') AS SchoolMale, 
 count(CASE WHEN is_counselled THEN 1 END) FILTER (WHERE gender_name = 'Female' and address_level_type = 'School') AS SchoolFemale, 
 count(CASE WHEN is_counselled THEN 1 END) FILTER (WHERE address_level_type = 'School') AS SchoolTotal, 
 count(CASE WHEN is_counselled THEN 1 END) FILTER (WHERE gender_name = 'Male' and address_level_type = 'Boarding School') AS BoardingSchoolMale, 
 count(CASE WHEN is_counselled THEN 1 END) FILTER (WHERE gender_name = 'Female' and address_level_type = 'Boarding School') AS BoardingSchoolFemale, 
 count(CASE WHEN is_counselled THEN 1 END) FILTER (WHERE address_level_type = 'Boarding School') AS BoardingSchoolTotal
 from (SELECT bool_or(is_counselled(program_encounter.observations)) AS is_counselled, gender.name gender_name, address_level.type address_level_type from program_encounter
INNER JOIN program_enrolment ON program_encounter.program_enrolment_id = program_enrolment.id
INNER JOIN encounter_type ON program_encounter.encounter_type_id = encounter_type.id INNER JOIN program ON program_enrolment.program_id = program.id
INNER JOIN individual ON program_enrolment.individual_id = individual.id
INNER JOIN gender ON individual.gender_id = gender.id
INNER JOIN address_level ON address_level.id = individual.address_id
WHERE program.name = 'Adolescent' GROUP BY program_encounter.program_enrolment_id, gender.name, address_level.type) AS encounter_function_output UNION SELECT 4 DisplayOrder, 'Total adolescents dropped out' AS Indicator,
 count(CASE WHEN has_dropped_out THEN 1 END) FILTER (WHERE gender_name = 'Male' and address_level_type = 'Village') AS VillageMale, 
 count(CASE WHEN has_dropped_out THEN 1 END) FILTER (WHERE gender_name = 'Female' and address_level_type = 'Village') AS VillageFemale, 
 count(CASE WHEN has_dropped_out THEN 1 END) FILTER (WHERE address_level_type = 'Village') AS VillageTotal, 
 count(CASE WHEN has_dropped_out THEN 1 END) FILTER (WHERE gender_name = 'Male' and address_level_type = 'School') AS SchoolMale, 
 count(CASE WHEN has_dropped_out THEN 1 END) FILTER (WHERE gender_name = 'Female' and address_level_type = 'School') AS SchoolFemale, 
 count(CASE WHEN has_dropped_out THEN 1 END) FILTER (WHERE address_level_type = 'School') AS SchoolTotal, 
 count(CASE WHEN has_dropped_out THEN 1 END) FILTER (WHERE gender_name = 'Male' and address_level_type = 'Boarding School') AS BoardingSchoolMale, 
 count(CASE WHEN has_dropped_out THEN 1 END) FILTER (WHERE gender_name = 'Female' and address_level_type = 'Boarding School') AS BoardingSchoolFemale, 
 count(CASE WHEN has_dropped_out THEN 1 END) FILTER (WHERE address_level_type = 'Boarding School') AS BoardingSchoolTotal
 from (SELECT bool_or(has_dropped_out(program_enrolment.observations, program_encounter.observations)) AS has_dropped_out, gender.name gender_name, address_level.type address_level_type from program_encounter
INNER JOIN program_enrolment ON program_encounter.program_enrolment_id = program_enrolment.id
INNER JOIN encounter_type ON program_encounter.encounter_type_id = encounter_type.id INNER JOIN program ON program_enrolment.program_id = program.id
INNER JOIN individual ON program_enrolment.individual_id = individual.id
INNER JOIN gender ON individual.gender_id = gender.id
INNER JOIN address_level ON address_level.id = individual.address_id
WHERE program.name = 'Adolescent' GROUP BY program_encounter.program_enrolment_id, gender.name, address_level.type) AS encounter_function_output UNION SELECT 5 DisplayOrder, 'Total adolescents whose home visits done' AS Indicator,
 count(CASE WHEN home_visit_done THEN 1 END) FILTER (WHERE gender_name = 'Male' and address_level_type = 'Village') AS VillageMale, 
 count(CASE WHEN home_visit_done THEN 1 END) FILTER (WHERE gender_name = 'Female' and address_level_type = 'Village') AS VillageFemale, 
 count(CASE WHEN home_visit_done THEN 1 END) FILTER (WHERE address_level_type = 'Village') AS VillageTotal, 
 count(CASE WHEN home_visit_done THEN 1 END) FILTER (WHERE gender_name = 'Male' and address_level_type = 'School') AS SchoolMale, 
 count(CASE WHEN home_visit_done THEN 1 END) FILTER (WHERE gender_name = 'Female' and address_level_type = 'School') AS SchoolFemale, 
 count(CASE WHEN home_visit_done THEN 1 END) FILTER (WHERE address_level_type = 'School') AS SchoolTotal, 
 count(CASE WHEN home_visit_done THEN 1 END) FILTER (WHERE gender_name = 'Male' and address_level_type = 'Boarding School') AS BoardingSchoolMale, 
 count(CASE WHEN home_visit_done THEN 1 END) FILTER (WHERE gender_name = 'Female' and address_level_type = 'Boarding School') AS BoardingSchoolFemale, 
 count(CASE WHEN home_visit_done THEN 1 END) FILTER (WHERE address_level_type = 'Boarding School') AS BoardingSchoolTotal
 from (SELECT bool_or(encounter_type.name = 'Dropout Home Visit') AS home_visit_done, gender.name gender_name, address_level.type address_level_type from program_encounter
INNER JOIN program_enrolment ON program_encounter.program_enrolment_id = program_enrolment.id
INNER JOIN encounter_type ON program_encounter.encounter_type_id = encounter_type.id INNER JOIN program ON program_enrolment.program_id = program.id
INNER JOIN individual ON program_enrolment.individual_id = individual.id
INNER JOIN gender ON individual.gender_id = gender.id
INNER JOIN address_level ON address_level.id = individual.address_id
WHERE program.name = 'Adolescent' GROUP BY program_encounter.program_enrolment_id, gender.name, address_level.type) AS encounter_function_output UNION SELECT 6 DisplayOrder, 'Total adolescents referred' AS Indicator,
 count(CASE WHEN is_referred THEN 1 END) FILTER (WHERE gender_name = 'Male' and address_level_type = 'Village') AS VillageMale, 
 count(CASE WHEN is_referred THEN 1 END) FILTER (WHERE gender_name = 'Female' and address_level_type = 'Village') AS VillageFemale, 
 count(CASE WHEN is_referred THEN 1 END) FILTER (WHERE address_level_type = 'Village') AS VillageTotal, 
 count(CASE WHEN is_referred THEN 1 END) FILTER (WHERE gender_name = 'Male' and address_level_type = 'School') AS SchoolMale, 
 count(CASE WHEN is_referred THEN 1 END) FILTER (WHERE gender_name = 'Female' and address_level_type = 'School') AS SchoolFemale, 
 count(CASE WHEN is_referred THEN 1 END) FILTER (WHERE address_level_type = 'School') AS SchoolTotal, 
 count(CASE WHEN is_referred THEN 1 END) FILTER (WHERE gender_name = 'Male' and address_level_type = 'Boarding School') AS BoardingSchoolMale, 
 count(CASE WHEN is_referred THEN 1 END) FILTER (WHERE gender_name = 'Female' and address_level_type = 'Boarding School') AS BoardingSchoolFemale, 
 count(CASE WHEN is_referred THEN 1 END) FILTER (WHERE address_level_type = 'Boarding School') AS BoardingSchoolTotal
 from (SELECT bool_or(coded_obs_exists(program_encounter, 'Refer to hospital for')) AS is_referred, gender.name gender_name, address_level.type address_level_type from program_encounter
INNER JOIN program_enrolment ON program_encounter.program_enrolment_id = program_enrolment.id
INNER JOIN encounter_type ON program_encounter.encounter_type_id = encounter_type.id INNER JOIN program ON program_enrolment.program_id = program.id
INNER JOIN individual ON program_enrolment.individual_id = individual.id
INNER JOIN gender ON individual.gender_id = gender.id
INNER JOIN address_level ON address_level.id = individual.address_id
WHERE program.name = 'Adolescent' GROUP BY program_encounter.program_enrolment_id, gender.name, address_level.type) AS encounter_function_output) AS Unordered ORDER BY Unordered.DisplayOrder