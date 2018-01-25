// export * as encounterDecision from "./health_modules/encounterDecision";
// IT IS NOT MANDATORY THAT ALL THE SQL ARE GENERATED THIS FASHION. USE IT FOR ELIMINATING DUPLICATION OF CODE AND SCALE OF DUPLICATION
const mustache = require('mustache');
const fs = require('fs');

let replacements = new Map();
replacements.set('&#x3D;', '=');
replacements.set('&#39;', '\'');

function render(template, data) {
    let sql = mustache.render(template, data);
    replacements.forEach((value, key) => {
        sql = sql.split(key).join(value);
    });
    return sql;
}

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

let serviceDelivery = {
    indicators: [
        {
            indicator: 'Total adolescents enrolled',
            genderColumn: 'gender.name',
            addressTypeColumn: 'address_level.type',
            aggregateFn: 'count(*)',
            from: programEnrolmentBase
        },
        {
            indicator: 'Total adolescents having problem',
            genderColumn: 'gender_name',
            addressTypeColumn: 'address_level_type',
            aggregateFn: 'count(CASE WHEN has_problem THEN 1 END)',
            from: render(programEncounterFunctionTemplate, {fact: 'bool_and(has_problem(program_encounter.observations)) AS has_problem'})
        },
        {
            indicator: 'Total adolescents counselled',
            genderColumn: 'gender_name',
            addressTypeColumn: 'address_level_type',
            aggregateFn: 'count(CASE WHEN is_counselled THEN 1 END)',
            from: render(programEncounterFunctionTemplate, {fact: 'bool_and(is_counselled(program_encounter.observations)) AS is_counselled'})
        },
        {
            indicator: 'Total adolescents dropped out',
            genderColumn: 'gender_name',
            addressTypeColumn: 'address_level_type',
            aggregateFn: 'count(CASE WHEN has_dropped_out THEN 1 END)',
            from: render(programEncounterFunctionTemplate, {fact: 'bool_and(has_dropped_out(program_enrolment.observations, program_encounter.observations)) AS has_dropped_out'})
        },
        {
            indicator: 'Total adolescents whose home visits done',
            genderColumn: 'gender_name',
            addressTypeColumn: 'address_level_type',
            aggregateFn: 'count(CASE WHEN home_visit_done THEN 1 END)',
            from: render(programEncounterFunctionTemplate, {fact: `bool_and(encounter_type.name = 'Dropout Home Visit') AS home_visit_done`})
        },
        {
            indicator: 'Total adolescents referred',
            genderColumn: 'gender_name',
            addressTypeColumn: 'address_level_type',
            aggregateFn: 'count(CASE WHEN is_referred THEN 1 END)',
            from: render(programEncounterFunctionTemplate, {fact: `bool_and(coded_obs_exists(program_encounter, 'Refer to hospital for')) AS is_referred`})
        }
    ]
};

let template = `{{#indicators}}SELECT '{{indicator}}',
 {{aggregateFn}} FILTER (WHERE {{genderColumn}} = 'Male' and {{addressTypeColumn}} = 'Village') AS "Village - Male", 
 {{aggregateFn}} FILTER (WHERE {{genderColumn}} = 'Female' and {{addressTypeColumn}} = 'Village') AS "Village - Female", 
 {{aggregateFn}} FILTER (WHERE {{addressTypeColumn}} = 'Village') AS "Village - Total", 
 {{aggregateFn}} FILTER (WHERE {{genderColumn}} = 'Male' and {{addressTypeColumn}} = 'School') AS "School - Male", 
 {{aggregateFn}} FILTER (WHERE {{genderColumn}} = 'Female' and {{addressTypeColumn}} = 'School') AS "School - Female", 
 {{aggregateFn}} FILTER (WHERE {{addressTypeColumn}} = 'School') AS "School - Total", 
 {{aggregateFn}} FILTER (WHERE {{genderColumn}} = 'Male' and {{addressTypeColumn}} = 'Boarding School') AS "Village - Male", 
 {{aggregateFn}} FILTER (WHERE {{genderColumn}} = 'Female' and {{addressTypeColumn}} = 'Boarding School') AS "Village - Female", 
 {{aggregateFn}} FILTER (WHERE {{addressTypeColumn}} = 'Boarding School') AS "Boarding School - Total"
 from {{from}} UNION 
{{/indicators}}`;

let sql = render(template, serviceDelivery);
sql = sql.substring(0, sql.length - " UNION ".length);
fs.writeFileSync('generatedSQL/serviceDelivery.sql', sql);


// coded_obs_exists(program_encounter, 'Refer to hospital for') referred,
// encounter_type.name = 'Dropout Home Visit' AS home_visit_done
