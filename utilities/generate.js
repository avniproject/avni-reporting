const ReportBuilder = require('./builder/ReportBuilder');


const serviceDeliveryReport = new ReportBuilder()
    .withName("Service Delivery")
    .withDirName("serviceDelivery")
    .withSubReport("Total Adolescents Registered", "totalRegistered.sql")
    .withSubReportWithDenominator("Total Adolescents Enrolled", "totalEnrolled.sql", "totalRegistered.sql")
    .withSubReportWithDenominator("Total Adolescents With Problems",
        "totalAdolescentsWithProblems.sql",
        "totalEnrolled.sql")
    .withSubReportWithDenominator("Total Adolescents Referred",
        "totalAdolescentsWithReferralAdvice.sql",
        "totalAdolescentsWithProblems.sql")
    .withSubReportWithDenominator("Total Adolescents needed Counselling",
        "totalAdolescentsWithCounsellingAdvice.sql",
        "totalEnrolled.sql")
    .withSubReportWithDenominator("Total Adolescents Counselled",
        "totalAdolescentsCounselled.sql",
        "totalAdolescentsWithCounsellingAdvice.sql")
    .withSubReportWithDenominator("Total Adolescents Dropped Out",
        "totalAdolescentsDroppedOut.sql",
        "totalEnrolled.sql")
    .withSubReportWithDenominator("Total Adolescents With a Dropout Home Visit",
        "totalIndividualsWithDropOutHomeVisit.sql",
        "totalAdolescentsDroppedOut.sql")
    .withSubReportWithDenominator("Total Adolescents Started Going to School Again",
        "adolescentsStartedSchool.sql",
        "totalAdolescentsDroppedOut.sql")
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
    .withSubReportWithDenominator("Not interested in studies", "notInterestedInStudies.sql", "totalAdolescentsDroppedOut.sql")
    .withSubReportWithDenominator("Poor Economic Condition", "poorEconomicCondition.sql", "totalAdolescentsDroppedOut.sql")
    .withSubReportWithDenominator("Domestic Work", "domesticWork.sql", "totalAdolescentsDroppedOut.sql")
    .withSubReportWithDenominator("Migration", "migration.sql", "totalAdolescentsDroppedOut.sql")
    .withSubReportWithDenominator("Marriage", "marriage.sql", "totalAdolescentsDroppedOut.sql")
    .withSubReportWithDenominator("No School in Village", "noSchoolInVillage.sql", "totalAdolescentsDroppedOut.sql")
    .withSubReportWithDenominator("Study Completed", "studyCompleted.sql", "totalAdolescentsDroppedOut.sql")
    .withSubReportWithDenominator("Other Reason", "otherReason.sql", "totalAdolescentsDroppedOut.sql")
    .build();

const menstruationReport = new ReportBuilder()
    .withName("Menstruation")
    .withDirName("menstruation")
    .withSubReportWithDenominator("Menstruation Started", "started.sql", "totalEnrolled.sql")
    .withSubReportWithDenominator("Menstrual Disorder", "disorder.sql", "started.sql")
    .withSubReportWithDenominator("Headache", "headache.sql", "disorder.sql")
    .withSubReportWithDenominator("Heavy Bleeding", "heavyBleeding.sql", "disorder.sql")
    .withSubReportWithDenominator("Lower Abdominal Pain", "lowerAbdominalPain.sql", "disorder.sql")
    .withSubReportWithDenominator("Abnormal Discharge", "abnormalDischarge.sql", "disorder.sql")
    .withSubReportWithDenominator("Backache", "backache.sql", "disorder.sql")
    .withSubReportWithDenominator("Leg Pain", "legPain.sql", "disorder.sql")
    .withSubReportWithDenominator("Nausea And Vomiting", "nauseaAndVomitting.sql", "disorder.sql")
    .build();

const absorbentMaterialUsedReport = new ReportBuilder()
    .withName("Absorbent Material Used")
    .withDirName("absorbentMaterialUsed")
    .withSubReportWithDenominator("Old Cloth", "oldCloth.sql", "started.sql")
    .withSubReportWithDenominator("Sanitary Pad", "sanitaryPad.sql", "started.sql")
    .withSubReportWithDenominator("Falalin", "falalin.sql", "started.sql")
    .withSubReportWithDenominator("Kit Pad", "kitPad.sql", "started.sql")
    .withSubReportWithDenominator("MHM Kit Provided?", "kitProvided.sql", "started.sql")
    .withSubReportWithDenominator("MHM Kit Used", "kitUsed.sql", "kitProvided.sql")
    .build();

const treatmentTakenForMenstrualDisorderReport = new ReportBuilder()
    .withName("Treatment Taken for Menstrual Disorder")
    .withDirName("menstrualDisorderTreatment")
    .withSubReportWithDenominator("Disorder", "disorder.sql", "started.sql")
    .withSubReportWithDenominator("Treament Taken", "takingTreatment.sql", "disorder.sql")
    .withSubReportWithDenominator("Home Remedy", "homeRemedy.sql", "disorder.sql")
    .withSubReportWithDenominator("Consulted Doctor", "consultedDoctor.sql", "disorder.sql")
    .withSubReportWithDenominator("Tablet From Shop", "tabletFromShop.sql", "disorder.sql")
    .withSubReportWithDenominator("Tablet From Kit", "tabletFromKit.sql", "disorder.sql")
    .build();

const nutritionReport = new ReportBuilder()
    .withName("Nutrition")
    .withDirName("nutrition")
    .withSubReportWithDenominator("Severely Malnourished", "severelyMalnourished.sql", "totalEnrolled.sql")
    .withSubReportWithDenominator("Malnourished", "malnourished.sql", "totalEnrolled.sql")
    .withSubReportWithDenominator("Normal", "normal.sql", "totalEnrolled.sql")
    .withSubReportWithDenominator("Overweight", "overweight.sql", "totalEnrolled.sql")
    .withSubReportWithDenominator("Obese", "obese.sql", "totalEnrolled.sql")
    .build();

const hemoglobinReport = new ReportBuilder()
    .withName("Hemoglobin")
    .withDirName("hemoglobin")
    .withSubReportWithDenominator("< 7", "hb<7.sql", "totalEnrolled.sql")
    .withSubReportWithDenominator("7.1 - 10.0", "hb>7hb<10.sql", "totalEnrolled.sql")
    .withSubReportWithDenominator("10.1 - 11.9", "hb>10hb<11.9.sql", "totalEnrolled.sql")
    .withSubReportWithDenominator("12", "hb=12.sql", "totalEnrolled.sql")
    .withSubReportWithDenominator("12.1 - 13.0", "hb>12hb<13.sql", "totalEnrolled.sql")
    .withSubReportWithDenominator("> 13", "hb>13.sql", "totalEnrolled.sql")
    .build();

const sicklingReport = new ReportBuilder()
    .withName("Sickling Test")
    .withDirName("sickling")
    .withSubReportWithDenominator("Test Done", "sicklingTestDone.sql", "totalEnrolled.sql")
    .withSubReportWithDenominator("Negative", "negative.sql", "sicklingTestDone.sql")
    .withSubReportWithDenominator("Trait", "trait.sql", "sicklingTestDone.sql")
    .withSubReportWithDenominator("Disease", "disease.sql", "sicklingTestDone.sql")
    .build();

const ironTabletsReport = new ReportBuilder()
    .withName("Iron Tables")
    .withDirName("ironTablets")
    .withSubReportWithDenominator("Received", "received.sql", "totalEnrolled.sql")
    .withSubReportWithDenominator("Consumed", "taken.sql", "received.sql")
    .build();

const vulnerability = new ReportBuilder()
    .withName("Vulnerabilities")
    .withDirName("vulnerability")
    .withSubReportWithDenominator("Vulnerable Adolescents", "vulnerable.sql", "totalEnrolled.sql")
    .withSubReportWithDenominator("School Dropout", "dropout.sql", "vulnerable.sql")
    .withSubReportWithDenominator("Addiction", "addiction.sql", "vulnerable.sql")
    .withSubReportWithDenominator("Early Pregnancy and RTI", "rti.sql", "vulnerable.sql")
    .withSubReportWithDenominator("Early Marriage", "earlyMarriage.sql", "vulnerable.sql")
    .withSubReportWithDenominator("Road Traffic Accident", "accident.sql", "vulnerable.sql")
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
        hemoglobinReport,
        sicklingReport,
        ironTabletsReport,
        vulnerability
    ].map((report) => report.generate());

module.exports = generate;