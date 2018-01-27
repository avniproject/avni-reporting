SELECT Indicator, concat(VillageMale, ' (',((VillageMale*100)/(CASE WHEN VillageTotal=0 THEN 1 ELSE VillageTotal END)), '%)') as "VLG Male", concat(VillageFemale, ' (',((VillageFemale*100)/(CASE WHEN VillageTotal=0 THEN 1 ELSE VillageTotal END)), '%)') as "VLG Female", VillageTotal as "VLG Total", concat(SchoolMale, ' (',((SchoolMale*100)/(CASE WHEN SchoolTotal=0 THEN 1 ELSE SchoolTotal END)), '%)') as "SCH Male", concat(SchoolFemale, ' (',((SchoolFemale*100)/(CASE WHEN SchoolTotal=0 THEN 1 ELSE SchoolTotal END)), '%)') as "SCH Female", SchoolTotal as "SCH Total", concat(BoardingSchoolFemale, ' (',((BoardingSchoolFemale*100)/(CASE WHEN BoardingSchoolTotal=0 THEN 1 ELSE BoardingSchoolTotal END)), '%)') as "B-SCH Male", concat(BoardingSchoolFemale, ' (',((BoardingSchoolFemale*100)/(CASE WHEN BoardingSchoolTotal=0 THEN 1 ELSE BoardingSchoolTotal END)), '%)') as "B-SCH Female", BoardingSchoolTotal as "B-SCH Total" from (SELECT 1 DisplayOrder, 'Total adolescents addicted of tobacco' AS Indicator,
 count(CASE WHEN is_referred THEN 1 END) FILTER (WHERE gender_name = 'Male' and address_level_type = 'Village') AS VillageMale, 
 count(CASE WHEN is_referred THEN 1 END) FILTER (WHERE gender_name = 'Female' and address_level_type = 'Village') AS VillageFemale, 
 count(CASE WHEN is_referred THEN 1 END) FILTER (WHERE address_level_type = 'Village') AS VillageTotal, 
 count(CASE WHEN is_referred THEN 1 END) FILTER (WHERE gender_name = 'Male' and address_level_type = 'School') AS SchoolMale, 
 count(CASE WHEN is_referred THEN 1 END) FILTER (WHERE gender_name = 'Female' and address_level_type = 'School') AS SchoolFemale, 
 count(CASE WHEN is_referred THEN 1 END) FILTER (WHERE address_level_type = 'School') AS SchoolTotal, 
 count(CASE WHEN is_referred THEN 1 END) FILTER (WHERE gender_name = 'Male' and address_level_type = 'Boarding School') AS BoardingSchoolMale, 
 count(CASE WHEN is_referred THEN 1 END) FILTER (WHERE gender_name = 'Female' and address_level_type = 'Boarding School') AS BoardingSchoolFemale, 
 count(CASE WHEN is_referred THEN 1 END) FILTER (WHERE address_level_type = 'Boarding School') AS BoardingSchoolTotal
 from (SELECT bool_or(coded_obs_contains(program_encounter.observations, 'Addiction Details', ARRAY ['Tobacco'])) AS is_referred, gender.name gender_name, address_level.type address_level_type from program_encounter
INNER JOIN program_enrolment ON program_encounter.program_enrolment_id = program_enrolment.id
INNER JOIN encounter_type ON program_encounter.encounter_type_id = encounter_type.id INNER JOIN program ON program_enrolment.program_id = program.id
INNER JOIN individual ON program_enrolment.individual_id = individual.id
INNER JOIN gender ON individual.gender_id = gender.id
INNER JOIN address_level ON address_level.id = individual.address_id
WHERE program.name = 'Adolescent' GROUP BY program_encounter.program_enrolment_id, gender.name, address_level.type) AS encounter_function_output UNION SELECT 2 DisplayOrder, 'Total adolescents addicted of alcohol' AS Indicator,
 count(CASE WHEN is_referred THEN 1 END) FILTER (WHERE gender_name = 'Male' and address_level_type = 'Village') AS VillageMale, 
 count(CASE WHEN is_referred THEN 1 END) FILTER (WHERE gender_name = 'Female' and address_level_type = 'Village') AS VillageFemale, 
 count(CASE WHEN is_referred THEN 1 END) FILTER (WHERE address_level_type = 'Village') AS VillageTotal, 
 count(CASE WHEN is_referred THEN 1 END) FILTER (WHERE gender_name = 'Male' and address_level_type = 'School') AS SchoolMale, 
 count(CASE WHEN is_referred THEN 1 END) FILTER (WHERE gender_name = 'Female' and address_level_type = 'School') AS SchoolFemale, 
 count(CASE WHEN is_referred THEN 1 END) FILTER (WHERE address_level_type = 'School') AS SchoolTotal, 
 count(CASE WHEN is_referred THEN 1 END) FILTER (WHERE gender_name = 'Male' and address_level_type = 'Boarding School') AS BoardingSchoolMale, 
 count(CASE WHEN is_referred THEN 1 END) FILTER (WHERE gender_name = 'Female' and address_level_type = 'Boarding School') AS BoardingSchoolFemale, 
 count(CASE WHEN is_referred THEN 1 END) FILTER (WHERE address_level_type = 'Boarding School') AS BoardingSchoolTotal
 from (SELECT bool_or(coded_obs_contains(program_encounter.observations, 'Addiction Details', ARRAY ['Alcohol'])) AS is_referred, gender.name gender_name, address_level.type address_level_type from program_encounter
INNER JOIN program_enrolment ON program_encounter.program_enrolment_id = program_enrolment.id
INNER JOIN encounter_type ON program_encounter.encounter_type_id = encounter_type.id INNER JOIN program ON program_enrolment.program_id = program.id
INNER JOIN individual ON program_enrolment.individual_id = individual.id
INNER JOIN gender ON individual.gender_id = gender.id
INNER JOIN address_level ON address_level.id = individual.address_id
WHERE program.name = 'Adolescent' GROUP BY program_encounter.program_enrolment_id, gender.name, address_level.type) AS encounter_function_output UNION SELECT 3 DisplayOrder, 'Father''s addiction' AS Indicator,
 count(CASE WHEN is_referred THEN 1 END) FILTER (WHERE gender_name = 'Male' and address_level_type = 'Village') AS VillageMale, 
 count(CASE WHEN is_referred THEN 1 END) FILTER (WHERE gender_name = 'Female' and address_level_type = 'Village') AS VillageFemale, 
 count(CASE WHEN is_referred THEN 1 END) FILTER (WHERE address_level_type = 'Village') AS VillageTotal, 
 count(CASE WHEN is_referred THEN 1 END) FILTER (WHERE gender_name = 'Male' and address_level_type = 'School') AS SchoolMale, 
 count(CASE WHEN is_referred THEN 1 END) FILTER (WHERE gender_name = 'Female' and address_level_type = 'School') AS SchoolFemale, 
 count(CASE WHEN is_referred THEN 1 END) FILTER (WHERE address_level_type = 'School') AS SchoolTotal, 
 count(CASE WHEN is_referred THEN 1 END) FILTER (WHERE gender_name = 'Male' and address_level_type = 'Boarding School') AS BoardingSchoolMale, 
 count(CASE WHEN is_referred THEN 1 END) FILTER (WHERE gender_name = 'Female' and address_level_type = 'Boarding School') AS BoardingSchoolFemale, 
 count(CASE WHEN is_referred THEN 1 END) FILTER (WHERE address_level_type = 'Boarding School') AS BoardingSchoolTotal
 from (SELECT bool_or(coded_obs_contains(program_encounter.observations, 'Father''s Addiction', ARRAY ['Tobacco', 'Alcohol', 'Both'])) AS is_referred, gender.name gender_name, address_level.type address_level_type from program_encounter
INNER JOIN program_enrolment ON program_encounter.program_enrolment_id = program_enrolment.id
INNER JOIN encounter_type ON program_encounter.encounter_type_id = encounter_type.id INNER JOIN program ON program_enrolment.program_id = program.id
INNER JOIN individual ON program_enrolment.individual_id = individual.id
INNER JOIN gender ON individual.gender_id = gender.id
INNER JOIN address_level ON address_level.id = individual.address_id
WHERE program.name = 'Adolescent' GROUP BY program_encounter.program_enrolment_id, gender.name, address_level.type) AS encounter_function_output UNION SELECT 4 DisplayOrder, 'Mother''s addiction' AS Indicator,
 count(CASE WHEN is_referred THEN 1 END) FILTER (WHERE gender_name = 'Male' and address_level_type = 'Village') AS VillageMale, 
 count(CASE WHEN is_referred THEN 1 END) FILTER (WHERE gender_name = 'Female' and address_level_type = 'Village') AS VillageFemale, 
 count(CASE WHEN is_referred THEN 1 END) FILTER (WHERE address_level_type = 'Village') AS VillageTotal, 
 count(CASE WHEN is_referred THEN 1 END) FILTER (WHERE gender_name = 'Male' and address_level_type = 'School') AS SchoolMale, 
 count(CASE WHEN is_referred THEN 1 END) FILTER (WHERE gender_name = 'Female' and address_level_type = 'School') AS SchoolFemale, 
 count(CASE WHEN is_referred THEN 1 END) FILTER (WHERE address_level_type = 'School') AS SchoolTotal, 
 count(CASE WHEN is_referred THEN 1 END) FILTER (WHERE gender_name = 'Male' and address_level_type = 'Boarding School') AS BoardingSchoolMale, 
 count(CASE WHEN is_referred THEN 1 END) FILTER (WHERE gender_name = 'Female' and address_level_type = 'Boarding School') AS BoardingSchoolFemale, 
 count(CASE WHEN is_referred THEN 1 END) FILTER (WHERE address_level_type = 'Boarding School') AS BoardingSchoolTotal
 from (SELECT bool_or(coded_obs_contains(program_encounter.observations, 'Mother''s Addiction', ARRAY ['Tobacco', 'Alcohol', 'Both'])) AS is_referred, gender.name gender_name, address_level.type address_level_type from program_encounter
INNER JOIN program_enrolment ON program_encounter.program_enrolment_id = program_enrolment.id
INNER JOIN encounter_type ON program_encounter.encounter_type_id = encounter_type.id INNER JOIN program ON program_enrolment.program_id = program.id
INNER JOIN individual ON program_enrolment.individual_id = individual.id
INNER JOIN gender ON individual.gender_id = gender.id
INNER JOIN address_level ON address_level.id = individual.address_id
WHERE program.name = 'Adolescent' GROUP BY program_encounter.program_enrolment_id, gender.name, address_level.type) AS encounter_function_output) AS Unordered ORDER BY Unordered.DisplayOrder