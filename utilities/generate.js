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
    .withSubReport("Not interested in studies", "notInterestedInStudies.sql")
    .withSubReport("Poor Economic Condition", "poorEconomicCondition.sql")
    .withSubReport("Domestic Work", "domesticWork.sql")
    .withSubReport("Migration", "migration.sql")
    .withSubReport("Marriage", "marriage.sql")
    .withSubReport("No School in Village", "noSchoolInVillage.sql")
    .withSubReport("Study Completed", "studyCompleted.sql")
    .withSubReport("Other Reason", "otherReason.sql")
    .build();

const menstruationReport = new ReportBuilder()
    .withName("Menstruation")
    .withDirName("menstruation")
    .withSubReport("Menstruation Started", "started.sql")
    .withSubReport("Menstrual Disorder", "disorder.sql")
    .withSubReport("Headache", "headache.sql")
    .withSubReport("Heavy Bleeding", "heavyBleeding.sql")
    .withSubReport("Lower Abdominal Pain", "lowerAbdominalPain.sql")
    .withSubReport("Abnormal Discharge", "abnormalDischarge.sql")
    .withSubReport("Backache", "backache.sql")
    .withSubReport("Leg Pain", "legPain.sql")
    .withSubReport("Nausea And Vomiting", "nauseaAndVomitting.sql")
    .build();

const absorbentMaterialUsedReport = new ReportBuilder()
    .withName("Absorbent Material Used")
    .withDirName("absorbentMaterialUsed")
    .withSubReport("Old Cloth", "oldCloth.sql")
    .withSubReport("Sanitary Pad", "sanitaryPad.sql")
    .withSubReport("Falalin", "falalin.sql")
    .withSubReport("Kit Pad", "kitPad.sql")
    .withSubReport("MHM Kit Provided?", "kitProvided.sql")
    .withSubReport("MHM Kit Used", "kitUsed.sql")
    .build();

const treatmentTakenForMenstrualDisorderReport = new ReportBuilder()
    .withName("Treatment Taken for Menstrual Disorder")
    .withDirName("menstrualDisorderTreatment")
    .withSubReport("Disorder", "disorder.sql")
    .withSubReport("Treament Taken", "takingTreatment.sql")
    .withSubReport("Home Remedy", "homeRemedy.sql")
    .withSubReport("Consulted Doctor", "consultedDoctor.sql")
    .withSubReport("Tablet From Shop", "tabletFromShop.sql")
    .withSubReport("Tablet From Kit", "tabletFromKit.sql")
    .build();

const nutritionReport = new ReportBuilder()
    .withName("Nutrition")
    .withDirName("nutrition")
    .withSubReport("Severely Malnourished", "severelyMalnourished.sql")
    .withSubReport("Malnourished", "malnourished.sql")
    .withSubReport("Normal", "normal.sql")
    .withSubReport("Overweight", "overweight.sql")
    .withSubReport("Obese", "obese.sql")
    .build();

const hemoglobinReport = new ReportBuilder()
    .withName("Hemoglobin")
    .withDirName("hemoglobin")
    .withSubReport("< 7", "hb<7.sql")
    .withSubReport("7.1 - 10.0", "hb>7hb<10.sql")
    .withSubReport("10.1 - 11.9", "hb>10hb<11.9.sql")
    .withSubReport("12", "hb=12.sql")
    .withSubReport("12.1 - 13.0", "hb>12hb<13.sql")
    .withSubReport("> 13", "hb>13.sql")
    .build();

const generate = () =>
    [
        serviceDeliveryReport,
        addictionReport,
        educationReport,
        menstruationReport,
        absorbentMaterialUsedReport,
        treatmentTakenForMenstrualDisorderReport,
        nutritionReport,
        hemoglobinReport
    ].map((report) => report.generate());

module.exports = generate;