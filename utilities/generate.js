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
    .withSubReportWithDenominator("Fathers Addicted", "fathersAddiction.sql", "totalEnrolled.sql")
    .withSubReportWithDenominator("Mothers Addicted", "mothersAddiction.sql", "totalEnrolled.sql")
    .build();

const educationReport = new ReportBuilder()
    .withName("Education")
    .withDirName("education")
    .withSubReportWithDenominator("Adolescents who discontinued education", "totalAdolescentsDroppedOut.sql", "totalEnrolled.sql")
    .withSubReportWithDenominator("Not interested in studies", "notInterestedInStudies.sql", "totalEnrolled.sql")
    .withSubReportWithDenominator("Poor Economic Condition", "poorEconomicCondition.sql", "totalEnrolled.sql")
    .withSubReportWithDenominator("Domestic Work", "domesticWork.sql", "totalEnrolled.sql")
    .withSubReportWithDenominator("Migration", "migration.sql", "totalEnrolled.sql")
    .withSubReportWithDenominator("Marriage", "marriage.sql", "totalEnrolled.sql")
    .withSubReportWithDenominator("No School in Village", "noSchoolInVillage.sql", "totalEnrolled.sql")
    .withSubReportWithDenominator("Study Completed", "studyCompleted.sql", "totalEnrolled.sql")
    .withSubReportWithDenominator("Other Reason", "otherReason.sql", "totalEnrolled.sql")
    .build();

const generate = () =>
    [
        serviceDeliveryReport,
        addictionReport,
        educationReport
    ].map((report) => report.generate());

module.exports = generate;