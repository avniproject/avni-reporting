module.exports = {};

let dimensionsBase = `INNER JOIN program ON program_enrolment.program_id = program.id
INNER JOIN individual ON program_enrolment.individual_id = individual.id
INNER JOIN gender ON individual.gender_id = gender.id
INNER JOIN address_level ON address_level.id = individual.address_id
WHERE program.name = 'Adolescent'`;

let programEncounterBase = `program_encounter
INNER JOIN program_enrolment ON program_encounter.program_enrolment_id = program_enrolment.id
INNER JOIN encounter_type ON program_encounter.encounter_type_id = encounter_type.id ${dimensionsBase} GROUP BY program_encounter.program_enrolment_id, gender.name, address_level.type`;

let programEnrolmentBase = `program_enrolment ${dimensionsBase}`;

let programEncounterFunctionTemplate = `(SELECT {{fact}}, gender.name gender_name, address_level.type address_level_type from ${programEncounterBase}) AS encounter_function_output`;


module.exports.dimesionBase = dimensionsBase;
module.exports.programEncounterBase = programEncounterBase;
module.exports.programEnrolmentBase = programEnrolmentBase;
module.exports.programEncounterFunctionTemplate = programEncounterFunctionTemplate;