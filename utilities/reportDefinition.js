const bases = require('./bases');
const render = require('./renderer').render;

const serviceDelivery = {
    indicators: [
        {
            displayOrder: 1,
            indicator: 'Total adolescents enrolled',
            genderColumn: 'gender.name',
            addressTypeColumn: 'address_level.type',
            aggregateFn: 'count(*)',
            from: bases.programEnrolmentBase
        },
        {
            displayOrder: 2,
            indicator: 'Total adolescents having problem',
            genderColumn: 'gender_name',
            addressTypeColumn: 'address_level_type',
            aggregateFn: 'count(CASE WHEN has_problem THEN 1 END)',
            from: render(bases.programEncounterFunctionTemplate, {fact: 'bool_and(has_problem(program_encounter.observations)) AS has_problem'})
        },
        {
            displayOrder: 3,
            indicator: 'Total adolescents counselled',
            genderColumn: 'gender_name',
            addressTypeColumn: 'address_level_type',
            aggregateFn: 'count(CASE WHEN is_counselled THEN 1 END)',
            from: render(bases.programEncounterFunctionTemplate, {fact: 'bool_and(is_counselled(program_encounter.observations)) AS is_counselled'})
        },
        {
            displayOrder: 4,
            indicator: 'Total adolescents dropped out',
            genderColumn: 'gender_name',
            addressTypeColumn: 'address_level_type',
            aggregateFn: 'count(CASE WHEN has_dropped_out THEN 1 END)',
            from: render(bases.programEncounterFunctionTemplate, {fact: 'bool_and(has_dropped_out(program_enrolment.observations, program_encounter.observations)) AS has_dropped_out'})
        },
        {
            displayOrder: 5,
            indicator: 'Total adolescents whose home visits done',
            genderColumn: 'gender_name',
            addressTypeColumn: 'address_level_type',
            aggregateFn: 'count(CASE WHEN home_visit_done THEN 1 END)',
            from: render(bases.programEncounterFunctionTemplate, {fact: `bool_and(encounter_type.name = 'Dropout Home Visit') AS home_visit_done`})
        },
        {
            displayOrder: 6,
            indicator: 'Total adolescents referred',
            genderColumn: 'gender_name',
            addressTypeColumn: 'address_level_type',
            aggregateFn: 'count(CASE WHEN is_referred THEN 1 END)',
            from: render(bases.programEncounterFunctionTemplate, {fact: `bool_and(coded_obs_exists(program_encounter, 'Refer to hospital for')) AS is_referred`})
        }
    ]
};

module.exports = {
    serviceDelivery: serviceDelivery
};
