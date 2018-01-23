// export * as encounterDecision from "./health_modules/encounterDecision";

let x = `SELECT 'Total Adolescents registered', count(*) FILTER (WHERE gender = 'Male' and catchment_type = 'Foo') AS "Village Male", count(*) FILTER (WHERE gender = 'Male' and catchment_type = 'Foo') AS "Village Female" from adolescents;`;
console.log(x);