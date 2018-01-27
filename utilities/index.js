// export * as encounterDecision from "./health_modules/encounterDecision";
// IT IS NOT MANDATORY THAT ALL THE SQL ARE GENERATED THIS FASHION. USE IT FOR ELIMINATING DUPLICATION OF CODE AND SCALE OF DUPLICATION
const fs = require('fs');
const render = require('./renderer').render;
const reportDefinition = require('./reportDefinition');


const nonTotalIndicatorTemplate = `concat({{addressType}}{{gender}}, ' (',(({{addressType}}{{gender}}*100)/(CASE WHEN {{addressType}}Total=0 THEN 1 ELSE {{addressType}}Total END)), '%)')`;
const nonTotalIndicators = {
    villageMale: {
        addressType: 'Village',
        gender: 'Male'
    },
    villageFemale: {
        addressType: 'Village',
        gender: 'Female'
    },
    schoolMale: {
        addressType: 'School',
        gender: 'Male'
    },
    schoolFemale: {
        addressType: 'School',
        gender: 'Female'
    },
    boardingSchoolMale: {
        addressType: 'BoardingSchool',
        gender: 'Male'
    },
    boardingSchoolFemale: {
        addressType: 'BoardingSchool',
        gender: 'Female'
    }
};

let generateSQL = function (report) {
    let sql = render(masterTemplate, reportDefinition[report]);
    sql = sql.replace(" UNION )", ")");
    fs.writeFileSync(`generatedSQL/${report}.sql`, sql);
};

let renderIndicatorColumn = function (indicatorColumn) {
    return render(nonTotalIndicatorTemplate, indicatorColumn);
};

//concat(VillageMale, ' ',((VillageMale*100)/(CASE WHEN VillageTotal=0 THEN 1 ELSE VillageTotal END)), '%')

let masterTemplate = `SELECT Indicator, ${renderIndicatorColumn(nonTotalIndicators.villageMale)} as "VLG Male", ${renderIndicatorColumn(nonTotalIndicators.villageFemale)} as "VLG Female", VillageTotal as "VLG Total", ${renderIndicatorColumn(nonTotalIndicators.schoolMale)} as "SCH Male", ${renderIndicatorColumn(nonTotalIndicators.schoolFemale)} as "SCH Female", SchoolTotal as "SCH Total", ${renderIndicatorColumn(nonTotalIndicators.boardingSchoolFemale)} as "B-SCH Male", ${renderIndicatorColumn(nonTotalIndicators.boardingSchoolFemale)} as "B-SCH Female", BoardingSchoolTotal as "B-SCH Total" from ({{#indicators}}SELECT {{displayOrder}} DisplayOrder, '{{indicator}}' AS Indicator,
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



generateSQL('serviceDelivery');
generateSQL('addiction');

// coded_obs_exists(program_encounter, 'Refer to hospital for') referred,
// encounter_type.name = 'Dropout Home Visit' AS home_visit_done
