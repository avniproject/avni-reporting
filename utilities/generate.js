const fs = require('fs');
const _ = require('lodash');
const ReportBuilder = require('./builder/ReportBuilder');


const serviceDeliveryReport = new ReportBuilder()
    .withName("Service Delivery")
    .withDirName("serviceDelivery")
    .withSubReport("Total Adolescents Registered", "totalEnrolled.sql")
    .withSubReport("Total Adolescents Enrolled", "totalRegistered.sql")
    .withSubReportWithDenominator("Total Adolescents With Problems",
        "totalAdolescentsWithProblems.sql",
        "totalEnrolled.sql")
    .withSubReportWithDenominator("Total Adolescents Referred",
        "totalAdolescentsWithReferralAdvice.sql",
        "totalEnrolled.sql")
    .withSubReportWithDenominator("Total Adolescents needed Counselling",
        "totalAdolescentsWithCounsellingAdvice.sql",
        "totalEnrolled.sql")
    .withSubReportWithDenominator("Total Adolescents Counselled",
        "totalAdolescentsCounselled.sql",
        "totalEnrolled.sql")
    .withSubReportWithDenominator("Total Adolescents Dropped Out",
        "totalAdolescentsDroppedOut.sql",
        "totalEnrolled.sql")
    .withSubReportWithDenominator("Total Adolescents With a Dropout Home Visit",
        "totalIndividualsWithDropOutHomeVisit.sql",
        "totalEnrolled.sql")
    .build();


const addictionReport = new ReportBuilder()
    .withName("Addiction")
    .withDirName("addiction")
    .withSubReportWithDenominator("Adolescents Addicted to Tobacco", "tobaccoAddiction.sql", "totalEnrolled.sql")
    .withSubReportWithDenominator("Adolescents Addicted to Alcohol", "alcoholAddiction.sql", "totalEnrolled.sql")
    .withSubReportWithDenominator("Adolescents Addicted to Both", "alcoholAndTobaccoAddiction.sql", "totalEnrolled.sql")
    .withSubReportWithDenominator("Adolescents Addicted to Both", "alcoholAndTobaccoAddiction.sql", "totalEnrolled.sql")
    .withSubReportWithDenominator("Fathers Addicted", "fathersAddiction.sql", "totalEnrolled.sql")
    .withSubReportWithDenominator("Mothers Addicted", "mothersAddiction.sql", "totalEnrolled.sql")
    .build();

serviceDeliveryReport.generate();
addictionReport.generate();