// export * as encounterDecision from "./health_modules/encounterDecision";
// IT IS NOT MANDATORY THAT ALL THE SQL ARE GENERATED THIS FASHION. USE IT FOR ELIMINATING DUPLICATION OF CODE AND SCALE OF DUPLICATION
const fs = require('fs');
const render = require('./renderer').render;
const reportDefinition = require('./reportDefinition');

let masterTemplate = `SELECT Indicator, VillageMale as "Village - Male", VillageFemale as "Village - Female", VillageTotal as "Village - Total",
SchoolMale as "School - Male", SchoolFemale as "School - Female", SchoolTotal as "School - Total", 
BoardingSchoolMale as "Boarding School - Male", BoardingSchoolFemale as "Boarding School - Female", BoardingSchoolTotal as "Boarding School - Total" from 
({{#indicators}}SELECT {{displayOrder}} DisplayOrder, '{{indicator}}' AS Indicator,
 {{aggregateFn}} FILTER (WHERE {{genderColumn}} = 'Male' and {{addressTypeColumn}} = 'Village') AS VillageMale, 
 {{aggregateFn}} FILTER (WHERE {{genderColumn}} = 'Female' and {{addressTypeColumn}} = 'Village') AS VillageFemale, 
 {{aggregateFn}} FILTER (WHERE {{addressTypeColumn}} = 'Village') AS VillageTotal, 
 {{aggregateFn}} FILTER (WHERE {{genderColumn}} = 'Male' and {{addressTypeColumn}} = 'School') AS SchoolMale, 
 {{aggregateFn}} FILTER (WHERE {{genderColumn}} = 'Female' and {{addressTypeColumn}} = 'School') AS SchoolFemale, 
 {{aggregateFn}} FILTER (WHERE {{addressTypeColumn}} = 'School') AS SchoolTotal, 
 {{aggregateFn}} FILTER (WHERE {{genderColumn}} = 'Male' and {{addressTypeColumn}} = 'Boarding School') AS BoardingSchoolMale, 
 {{aggregateFn}} FILTER (WHERE {{genderColumn}} = 'Female' and {{addressTypeColumn}} = 'Boarding School') AS BoardingSchoolFemale, 
 {{aggregateFn}} FILTER (WHERE {{addressTypeColumn}} = 'Boarding School') AS BoardingSchoolTotal
 from {{from}} UNION {{/indicators}}) AS Unordered ORDER BY Unordered.DisplayOrder`;


let sql = render(masterTemplate, reportDefinition.serviceDelivery);
sql = sql.replace(" UNION )", ")");
fs.writeFileSync('generatedSQL/serviceDelivery.sql', sql);


// coded_obs_exists(program_encounter, 'Refer to hospital for') referred,
// encounter_type.name = 'Dropout Home Visit' AS home_visit_done
