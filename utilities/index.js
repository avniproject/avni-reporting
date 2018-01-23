// export * as encounterDecision from "./health_modules/encounterDecision";
// IT IS NOT MANDATORY THAT ALL THE SQL ARE GENERATED THIS FASHION. USE IT FOR ELIMINATING DUPLICATION OF CODE AND SCALE OF DUPLICATION
let mustache = require('mustache');

let serviceDelivery = {
    indicators: [
        {
            indicator: 'Total Adolescents Enrolled',
            from: 'adolescents',
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