SELECT Indicator, VillageFemale as "VLG Female", SchoolFemale as "SCH Female", BoardingSchoolFemale as "B-SCH Female" from (SELECT 1 DisplayOrder, 'Girls menstruating' AS Indicator,
 count(CASE WHEN is_menstruating THEN 1 END) FILTER (WHERE gender_name = 'Female' and address_level_type = 'Village') AS VillageFemale, 
 count(CASE WHEN is_menstruating THEN 1 END) FILTER (WHERE gender_name = 'Female' and address_level_type = 'School') AS SchoolFemale, 
 count(CASE WHEN is_menstruating THEN 1 END) FILTER (WHERE gender_name = 'Female' and address_level_type = 'Boarding School') AS BoardingSchoolFemale 
 from (SELECT bool_or(coded_obs_contains(program_encounter.observations, 'Menstruation started', ARRAY ['Yes'])) AS is_menstruating, gender.name gender_name, address_level.type address_level_type from program_encounter
INNER JOIN program_enrolment ON program_encounter.program_enrolment_id = program_enrolment.id
INNER JOIN encounter_type ON program_encounter.encounter_type_id = encounter_type.id INNER JOIN program ON program_enrolment.program_id = program.id
INNER JOIN individual ON program_enrolment.individual_id = individual.id
INNER JOIN gender ON individual.gender_id = gender.id
INNER JOIN address_level ON address_level.id = individual.address_id
WHERE program.name = 'Adolescent' GROUP BY program_encounter.program_enrolment_id, gender.name, address_level.type) AS encounter_function_output UNION SELECT 2 DisplayOrder, 'Girls having menstrual disorder' AS Indicator,
 count(CASE WHEN has_menstrual_disorder THEN 1 END) FILTER (WHERE gender_name = 'Female' and address_level_type = 'Village') AS VillageFemale, 
 count(CASE WHEN has_menstrual_disorder THEN 1 END) FILTER (WHERE gender_name = 'Female' and address_level_type = 'School') AS SchoolFemale, 
 count(CASE WHEN has_menstrual_disorder THEN 1 END) FILTER (WHERE gender_name = 'Female' and address_level_type = 'Boarding School') AS BoardingSchoolFemale 
 from (SELECT bool_or(coded_obs_contains_any_except(program_encounter.observations, 'Menstrual disorders', ARRAY ['None'])) AS has_menstrual_disorder, gender.name gender_name, address_level.type address_level_type from program_encounter
INNER JOIN program_enrolment ON program_encounter.program_enrolment_id = program_enrolment.id
INNER JOIN encounter_type ON program_encounter.encounter_type_id = encounter_type.id INNER JOIN program ON program_enrolment.program_id = program.id
INNER JOIN individual ON program_enrolment.individual_id = individual.id
INNER JOIN gender ON individual.gender_id = gender.id
INNER JOIN address_level ON address_level.id = individual.address_id
WHERE program.name = 'Adolescent' GROUP BY program_encounter.program_enrolment_id, gender.name, address_level.type) AS encounter_function_output UNION SELECT 3 DisplayOrder, 'Girls having irregular menses' AS Indicator,
 count(CASE WHEN has_disorder THEN 1 END) FILTER (WHERE gender_name = 'Female' and address_level_type = 'Village') AS VillageFemale, 
 count(CASE WHEN has_disorder THEN 1 END) FILTER (WHERE gender_name = 'Female' and address_level_type = 'School') AS SchoolFemale, 
 count(CASE WHEN has_disorder THEN 1 END) FILTER (WHERE gender_name = 'Female' and address_level_type = 'Boarding School') AS BoardingSchoolFemale 
 from (SELECT bool_or(coded_obs_contains(program_encounter.observations, 'Menstrual disorders', ARRAY ['Irregular menses'])) AS has_disorder, gender.name gender_name, address_level.type address_level_type from program_encounter
INNER JOIN program_enrolment ON program_encounter.program_enrolment_id = program_enrolment.id
INNER JOIN encounter_type ON program_encounter.encounter_type_id = encounter_type.id INNER JOIN program ON program_enrolment.program_id = program.id
INNER JOIN individual ON program_enrolment.individual_id = individual.id
INNER JOIN gender ON individual.gender_id = gender.id
INNER JOIN address_level ON address_level.id = individual.address_id
WHERE program.name = 'Adolescent' GROUP BY program_encounter.program_enrolment_id, gender.name, address_level.type) AS encounter_function_output UNION SELECT 4 DisplayOrder, 'Girls having heavy bleeding' AS Indicator,
 count(CASE WHEN has_disorder THEN 1 END) FILTER (WHERE gender_name = 'Female' and address_level_type = 'Village') AS VillageFemale, 
 count(CASE WHEN has_disorder THEN 1 END) FILTER (WHERE gender_name = 'Female' and address_level_type = 'School') AS SchoolFemale, 
 count(CASE WHEN has_disorder THEN 1 END) FILTER (WHERE gender_name = 'Female' and address_level_type = 'Boarding School') AS BoardingSchoolFemale 
 from (SELECT bool_or(coded_obs_contains(program_encounter.observations, 'Menstrual disorders', ARRAY ['Heavy bleeding'])) AS has_disorder, gender.name gender_name, address_level.type address_level_type from program_encounter
INNER JOIN program_enrolment ON program_encounter.program_enrolment_id = program_enrolment.id
INNER JOIN encounter_type ON program_encounter.encounter_type_id = encounter_type.id INNER JOIN program ON program_enrolment.program_id = program.id
INNER JOIN individual ON program_enrolment.individual_id = individual.id
INNER JOIN gender ON individual.gender_id = gender.id
INNER JOIN address_level ON address_level.id = individual.address_id
WHERE program.name = 'Adolescent' GROUP BY program_encounter.program_enrolment_id, gender.name, address_level.type) AS encounter_function_output UNION SELECT 5 DisplayOrder, 'Girls having nausea and vomiting' AS Indicator,
 count(CASE WHEN has_disorder THEN 1 END) FILTER (WHERE gender_name = 'Female' and address_level_type = 'Village') AS VillageFemale, 
 count(CASE WHEN has_disorder THEN 1 END) FILTER (WHERE gender_name = 'Female' and address_level_type = 'School') AS SchoolFemale, 
 count(CASE WHEN has_disorder THEN 1 END) FILTER (WHERE gender_name = 'Female' and address_level_type = 'Boarding School') AS BoardingSchoolFemale 
 from (SELECT bool_or(coded_obs_contains(program_encounter.observations, 'Menstrual disorders', ARRAY ['Nausea and vomiting'])) AS has_disorder, gender.name gender_name, address_level.type address_level_type from program_encounter
INNER JOIN program_enrolment ON program_encounter.program_enrolment_id = program_enrolment.id
INNER JOIN encounter_type ON program_encounter.encounter_type_id = encounter_type.id INNER JOIN program ON program_enrolment.program_id = program.id
INNER JOIN individual ON program_enrolment.individual_id = individual.id
INNER JOIN gender ON individual.gender_id = gender.id
INNER JOIN address_level ON address_level.id = individual.address_id
WHERE program.name = 'Adolescent' GROUP BY program_encounter.program_enrolment_id, gender.name, address_level.type) AS encounter_function_output UNION SELECT 6 DisplayOrder, 'Girls having abnormal vaginal discharge' AS Indicator,
 count(CASE WHEN has_disorder THEN 1 END) FILTER (WHERE gender_name = 'Female' and address_level_type = 'Village') AS VillageFemale, 
 count(CASE WHEN has_disorder THEN 1 END) FILTER (WHERE gender_name = 'Female' and address_level_type = 'School') AS SchoolFemale, 
 count(CASE WHEN has_disorder THEN 1 END) FILTER (WHERE gender_name = 'Female' and address_level_type = 'Boarding School') AS BoardingSchoolFemale 
 from (SELECT bool_or(coded_obs_contains(program_encounter.observations, 'Menstrual disorders', ARRAY ['Abnormal vaginal discharge'])) AS has_disorder, gender.name gender_name, address_level.type address_level_type from program_encounter
INNER JOIN program_enrolment ON program_encounter.program_enrolment_id = program_enrolment.id
INNER JOIN encounter_type ON program_encounter.encounter_type_id = encounter_type.id INNER JOIN program ON program_enrolment.program_id = program.id
INNER JOIN individual ON program_enrolment.individual_id = individual.id
INNER JOIN gender ON individual.gender_id = gender.id
INNER JOIN address_level ON address_level.id = individual.address_id
WHERE program.name = 'Adolescent' GROUP BY program_encounter.program_enrolment_id, gender.name, address_level.type) AS encounter_function_output UNION SELECT 7 DisplayOrder, 'Girls having headache' AS Indicator,
 count(CASE WHEN has_disorder THEN 1 END) FILTER (WHERE gender_name = 'Female' and address_level_type = 'Village') AS VillageFemale, 
 count(CASE WHEN has_disorder THEN 1 END) FILTER (WHERE gender_name = 'Female' and address_level_type = 'School') AS SchoolFemale, 
 count(CASE WHEN has_disorder THEN 1 END) FILTER (WHERE gender_name = 'Female' and address_level_type = 'Boarding School') AS BoardingSchoolFemale 
 from (SELECT bool_or(coded_obs_contains(program_encounter.observations, 'Menstrual disorders', ARRAY ['Headache'])) AS has_disorder, gender.name gender_name, address_level.type address_level_type from program_encounter
INNER JOIN program_enrolment ON program_encounter.program_enrolment_id = program_enrolment.id
INNER JOIN encounter_type ON program_encounter.encounter_type_id = encounter_type.id INNER JOIN program ON program_enrolment.program_id = program.id
INNER JOIN individual ON program_enrolment.individual_id = individual.id
INNER JOIN gender ON individual.gender_id = gender.id
INNER JOIN address_level ON address_level.id = individual.address_id
WHERE program.name = 'Adolescent' GROUP BY program_encounter.program_enrolment_id, gender.name, address_level.type) AS encounter_function_output UNION SELECT 8 DisplayOrder, 'Girls having leg pain' AS Indicator,
 count(CASE WHEN has_disorder THEN 1 END) FILTER (WHERE gender_name = 'Female' and address_level_type = 'Village') AS VillageFemale, 
 count(CASE WHEN has_disorder THEN 1 END) FILTER (WHERE gender_name = 'Female' and address_level_type = 'School') AS SchoolFemale, 
 count(CASE WHEN has_disorder THEN 1 END) FILTER (WHERE gender_name = 'Female' and address_level_type = 'Boarding School') AS BoardingSchoolFemale 
 from (SELECT bool_or(coded_obs_contains(program_encounter.observations, 'Menstrual disorders', ARRAY ['Leg pain'])) AS has_disorder, gender.name gender_name, address_level.type address_level_type from program_encounter
INNER JOIN program_enrolment ON program_encounter.program_enrolment_id = program_enrolment.id
INNER JOIN encounter_type ON program_encounter.encounter_type_id = encounter_type.id INNER JOIN program ON program_enrolment.program_id = program.id
INNER JOIN individual ON program_enrolment.individual_id = individual.id
INNER JOIN gender ON individual.gender_id = gender.id
INNER JOIN address_level ON address_level.id = individual.address_id
WHERE program.name = 'Adolescent' GROUP BY program_encounter.program_enrolment_id, gender.name, address_level.type) AS encounter_function_output UNION SELECT 9 DisplayOrder, 'Girls having backache' AS Indicator,
 count(CASE WHEN has_disorder THEN 1 END) FILTER (WHERE gender_name = 'Female' and address_level_type = 'Village') AS VillageFemale, 
 count(CASE WHEN has_disorder THEN 1 END) FILTER (WHERE gender_name = 'Female' and address_level_type = 'School') AS SchoolFemale, 
 count(CASE WHEN has_disorder THEN 1 END) FILTER (WHERE gender_name = 'Female' and address_level_type = 'Boarding School') AS BoardingSchoolFemale 
 from (SELECT bool_or(coded_obs_contains(program_encounter.observations, 'Menstrual disorders', ARRAY ['Backache'])) AS has_disorder, gender.name gender_name, address_level.type address_level_type from program_encounter
INNER JOIN program_enrolment ON program_encounter.program_enrolment_id = program_enrolment.id
INNER JOIN encounter_type ON program_encounter.encounter_type_id = encounter_type.id INNER JOIN program ON program_enrolment.program_id = program.id
INNER JOIN individual ON program_enrolment.individual_id = individual.id
INNER JOIN gender ON individual.gender_id = gender.id
INNER JOIN address_level ON address_level.id = individual.address_id
WHERE program.name = 'Adolescent' GROUP BY program_encounter.program_enrolment_id, gender.name, address_level.type) AS encounter_function_output UNION SELECT 10 DisplayOrder, 'Girls having lower abdominal pain' AS Indicator,
 count(CASE WHEN has_disorder THEN 1 END) FILTER (WHERE gender_name = 'Female' and address_level_type = 'Village') AS VillageFemale, 
 count(CASE WHEN has_disorder THEN 1 END) FILTER (WHERE gender_name = 'Female' and address_level_type = 'School') AS SchoolFemale, 
 count(CASE WHEN has_disorder THEN 1 END) FILTER (WHERE gender_name = 'Female' and address_level_type = 'Boarding School') AS BoardingSchoolFemale 
 from (SELECT bool_or(coded_obs_contains(program_encounter.observations, 'Menstrual disorders', ARRAY ['Lower abdominal pain'])) AS has_disorder, gender.name gender_name, address_level.type address_level_type from program_encounter
INNER JOIN program_enrolment ON program_encounter.program_enrolment_id = program_enrolment.id
INNER JOIN encounter_type ON program_encounter.encounter_type_id = encounter_type.id INNER JOIN program ON program_enrolment.program_id = program.id
INNER JOIN individual ON program_enrolment.individual_id = individual.id
INNER JOIN gender ON individual.gender_id = gender.id
INNER JOIN address_level ON address_level.id = individual.address_id
WHERE program.name = 'Adolescent' GROUP BY program_encounter.program_enrolment_id, gender.name, address_level.type) AS encounter_function_output) AS Unordered ORDER BY Unordered.DisplayOrder