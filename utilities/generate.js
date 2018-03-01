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
    .build();


serviceDeliveryReport.generate();