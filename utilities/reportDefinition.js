const bases = require('./bases');
const render = require('./renderer').render;

module.exports = {};

module.exports.serviceDelivery = {
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
            indicator: 'Adolescents having problem',
            genderColumn: 'gender_name',
            addressTypeColumn: 'address_level_type',
            aggregateFn: 'count(CASE WHEN has_problem THEN 1 END)',
            from: render(bases.programEncounterFunctionTemplate, {fact: 'bool_or(has_problem(program_encounter.observations)) AS has_problem'})
        },
        {
            displayOrder: 3,
            indicator: 'Adolescents counselled',
            genderColumn: 'gender_name',
            addressTypeColumn: 'address_level_type',
            aggregateFn: 'count(CASE WHEN is_counselled THEN 1 END)',
            from: render(bases.programEncounterFunctionTemplate, {fact: 'bool_or(is_counselled(program_encounter.observations)) AS is_counselled'})
        },
        {
            displayOrder: 4,
            indicator: 'Adolescents dropped out',
            genderColumn: 'gender_name',
            addressTypeColumn: 'address_level_type',
            aggregateFn: 'count(CASE WHEN has_dropped_out THEN 1 END)',
            from: render(bases.programEncounterFunctionTemplate, {fact: 'bool_or(has_dropped_out(program_enrolment.observations, program_encounter.observations)) AS has_dropped_out'})
        },
        {
            displayOrder: 5,
            indicator: 'Adolescents whose home visits done',
            genderColumn: 'gender_name',
            addressTypeColumn: 'address_level_type',
            aggregateFn: 'count(CASE WHEN home_visit_done THEN 1 END)',
            from: render(bases.programEncounterFunctionTemplate, {fact: `bool_or(encounter_type.name = 'Dropout Home Visit') AS home_visit_done`})
        },
        {
            displayOrder: 6,
            indicator: 'Adolescents referred',
            genderColumn: 'gender_name',
            addressTypeColumn: 'address_level_type',
            aggregateFn: 'count(CASE WHEN is_referred THEN 1 END)',
            from: render(bases.programEncounterFunctionTemplate, {fact: `bool_or(coded_obs_exists(program_encounter, 'Refer to hospital for')) AS is_referred`})
        }
    ]
};

module.exports.addiction = {
    comment: `Ideally we should be taking the last value. This will need fixing in a year.`,
    indicators: [
        {
            displayOrder: 1,
            indicator: 'Adolescents addicted of tobacco',
            genderColumn: 'gender_name',
            addressTypeColumn: 'address_level_type',
            aggregateFn: 'count(CASE WHEN is_addicted_of_tobacco THEN 1 END)',
            from: render(bases.programEncounterFunctionTemplate, {fact: `bool_or(coded_obs_contains(program_encounter.observations, 'Addiction Details', ARRAY ['Tobacco'])) AS is_addicted_of_tobacco`})
        },
        {
            displayOrder: 2,
            indicator: 'Adolescents addicted of alcohol',
            genderColumn: 'gender_name',
            addressTypeColumn: 'address_level_type',
            aggregateFn: 'count(CASE WHEN is_addicted_of_alcohol THEN 1 END)',
            from: render(bases.programEncounterFunctionTemplate, {fact: `bool_or(coded_obs_contains(program_encounter.observations, 'Addiction Details', ARRAY ['Alcohol'])) AS is_addicted_of_alcohol`})
        },
        {
            displayOrder: 3,
            indicator: 'Father\'\'s addiction',
            genderColumn: 'gender_name',
            addressTypeColumn: 'address_level_type',
            aggregateFn: 'count(CASE WHEN is_father_addicted THEN 1 END)',
            from: render(bases.programEncounterFunctionTemplate, {fact: `bool_or(coded_obs_contains(program_encounter.observations, 'Father''s Addiction', ARRAY ['Tobacco', 'Alcohol', 'Both'])) AS is_father_addicted`})
        },
        {
            displayOrder: 4,
            indicator: 'Mother\'\'s addiction',
            genderColumn: 'gender_name',
            addressTypeColumn: 'address_level_type',
            aggregateFn: 'count(CASE WHEN is_mother_addicted THEN 1 END)',
            from: render(bases.programEncounterFunctionTemplate, {fact: `bool_or(coded_obs_contains(program_encounter.observations, 'Mother''s Addiction', ARRAY ['Tobacco', 'Alcohol', 'Both'])) AS is_mother_addicted`})
        }
    ]
};

module.exports.mensturation = {
    forGender: 'Female',
    indicators: [
        {
            displayOrder: 1,
            indicator: 'Girls menstruating',
            genderColumn: 'gender_name',
            addressTypeColumn: 'address_level_type',
            aggregateFn: 'count(CASE WHEN is_menstruating THEN 1 END)',
            from: render(bases.programEncounterFunctionTemplate, {fact: `bool_or(coded_obs_contains(program_encounter.observations, 'Menstruation started', ARRAY ['Yes'])) AS is_menstruating`})
        },
        {
            displayOrder: 2,
            indicator: 'Girls having menstrual disorder',
            genderColumn: 'gender_name',
            addressTypeColumn: 'address_level_type',
            aggregateFn: 'count(CASE WHEN has_menstrual_disorder THEN 1 END)',
            from: render(bases.programEncounterFunctionTemplate, {fact: `bool_or(coded_obs_contains_any_except(program_encounter.observations, 'Menstrual disorders', ARRAY ['None'])) AS has_menstrual_disorder`})
        }
    ]
};

let menstrualDisorders = ['Irregular menses', 'Heavy bleeding', 'Nausea and vomiting', 'Abnormal vaginal discharge', 'Headache', 'Leg pain', 'Backache', 'Lower abdominal pain'];
for (let i = 0; i < menstrualDisorders.length; i++) {
    let indicator = {
        displayOrder: i + 3,
        indicator: `Girls having ${menstrualDisorders[i].toLowerCase()}`,
        genderColumn: 'gender_name',
        addressTypeColumn: 'address_level_type',
        aggregateFn: 'count(CASE WHEN has_disorder THEN 1 END)',
        from: render(bases.programEncounterFunctionTemplate, {fact: `bool_or(coded_obs_contains(program_encounter.observations, 'Menstrual disorders', ARRAY ['${menstrualDisorders[i]}'])) AS has_disorder`})
    };
    module.exports.mensturation.indicators.push(indicator);
}