// export * as encounterDecision from "./health_modules/encounterDecision";
// IT IS NOT MANDATORY THAT ALL THE SQL ARE GENERATED THIS FASHION. USE IT FOR ELIMINATING DUPLICATION OF CODE AND SCALE OF DUPLICATION
let mustache = require('mustache');

let programEncounterJoin = `FROM program_encounter
INNER JOIN program_enrolment ON program_encounter.program_enrolment_id = program_enrolment.id
INNER JOIN encounter_type ON program_encounter.encounter_type_id = encounter_type.id
INNER JOIN program ON program_enrolment.program_id = program.id
WHERE program.name = 'Adolescent'`;

let serviceDelivery = {
    indicators: [
        {
            indicator: 'Total adolescents Enrolled',
            from: 'adolescents',
            whereClause: ''
        },
        {
            indicator: 'Total adolescents having problem',
            from: 'adolescent_visit_summary',
            whereClause: ''
        }
    ]
};

let template = `{{#indicators}}SELECT '{{indicator}}',
 count(*) FILTER (WHERE gender = 'Male' and catchment_type = 'Village') AS "Village - Male", 
 count(*) FILTER (WHERE gender = 'Female' and catchment_type = 'Village') AS "Village - Female", 
 count(*) FILTER (catchment_type = 'Village') AS "Village - Total", 
 count(*) FILTER (WHERE gender = 'Male' and catchment_type = 'School') AS "School - Male", 
 count(*) FILTER (WHERE gender = 'Female' and catchment_type = 'School') AS "School - Female", 
 count(*) FILTER (catchment_type = 'School') AS "School - Total", 
 count(*) FILTER (WHERE gender = 'Male' and catchment_type = 'Boarding School') AS "Village - Male", 
 count(*) FILTER (WHERE gender = 'Female' and catchment_type = 'Boarding School') AS "Village - Female", 
 count(*) FILTER (catchment_type = 'Boarding School') AS "Boarding School - Total"
 from {{from}}  
{{/indicators}}`;

console.log(mustache.render(template, serviceDelivery));

// coded_obs_exists(program_encounter, 'Refer to hospital for') referred,
// encounter_type.name = 'Dropout Home Visit' AS home_visit_done
