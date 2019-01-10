const ReportBuilder = require('./builder/ReportBuilder');


const serviceDeliveryReport = new ReportBuilder()
    .withName("ServiceDelivery")
    .withDirName("serviceDelivery")
    .withSubReport("Total Adolescents Registered", "totalRegistered.sql")
    .withSubReportWithDenominator("Total Adolescents Enrolled", "totalNonExitedEnrolled.sql", "totalRegistered.sql")
    .withSubReportWithDenominator("Total Adolescents With Problems",
        "totalAdolescentsWithProblems.sql",
        "totalNonExitedEnrolled.sql")
    .withSubReportWithDenominator("Total Adolescents Referred",
        "totalAdolescentsWithReferralAdvice.sql",
        "totalNonExitedEnrolled.sql")
    .withSubReportWithDenominator("Total Adolescents needed Counselling",
        "totalAdolescentsWithCounsellingAdvice.sql",
        "totalNonExitedEnrolled.sql")
    .withSubReportWithDenominator("Total Adolescents Counselled",
        "totalAdolescentsCounselled.sql",
        "totalAdolescentsWithCounsellingAdvice.sql")
    .withSubReportWithDenominator("Total Adolescents Dropped Out",
        "totalAdolescentsDroppedOut.sql",
        "totalNonExitedEnrolled.sql")
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
    .withSubReportWithDenominator("Adolescents Addicted to Tobacco", "tobaccoAddiction.sql", "totalNonExitedEnrolled.sql")
    .withSubReportWithDenominator("Adolescents Addicted to Alcohol", "alcoholAddiction.sql", "totalNonExitedEnrolled.sql")
    .withSubReportWithDenominator("Adolescents Addicted to Both", "alcoholAndTobaccoAddiction.sql", "totalNonExitedEnrolled.sql")
    .withSubReportWithDenominator("Fathers Addicted", "fathersAddiction.sql", "totalNonExitedEnrolled.sql")
    .withSubReportWithDenominator("Mothers Addicted", "mothersAddiction.sql", "totalNonExitedEnrolled.sql")
    .build();

const educationReport = new ReportBuilder()
    .withName("Education")
    .withDirName("education")
    .withSubReportWithDenominator("Adolescents who discontinued education", "totalAdolescentsDroppedOut.sql", "totalNonExitedEnrolled.sql")
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
    .withSubReportWithDenominator("Menstruation Started", "started.sql", "totalNonExitedEnrolled.sql")
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
    .withName("AbsorbentMaterialUsed")
    .withDirName("absorbentMaterialUsed")
    .withSubReportWithDenominator("Old Cloth", "oldCloth.sql", "started.sql")
    .withSubReportWithDenominator("Sanitary Pad", "sanitaryPad.sql", "started.sql")
    .withSubReportWithDenominator("Falalin", "falalin.sql", "started.sql")
    .withSubReportWithDenominator("Kit Pad", "kitPad.sql", "started.sql")
    .withSubReportWithDenominator("MHM Kit Provided?", "kitProvided.sql", "started.sql")
    .withSubReportWithDenominator("MHM Kit Used", "kitUsed.sql", "kitProvided.sql")
    .build();

const treatmentTakenForMenstrualDisorderReport = new ReportBuilder()
    .withName("TreatmentTakenForMenstrualDisorder")
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
    .withSubReportWithDenominator("Severely Malnourished", "severelyMalnourished.sql", "totalNonExitedEnrolled.sql")
    .withSubReportWithDenominator("Malnourished", "malnourished.sql", "totalNonExitedEnrolled.sql")
    .withSubReportWithDenominator("Normal", "normal.sql", "totalNonExitedEnrolled.sql")
    .withSubReportWithDenominator("Overweight", "overweight.sql", "totalNonExitedEnrolled.sql")
    .withSubReportWithDenominator("Obese", "obese.sql", "totalNonExitedEnrolled.sql")
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
    .withName("SicklingTest")
    .withDirName("sickling")
    .withSubReportWithDenominator("Test Done", "sicklingTestDone.sql", "totalNonExitedEnrolled.sql")
    .withSubReportWithDenominator("Negative", "negative.sql", "sicklingTestDone.sql")
    .withSubReportWithDenominator("Trait", "trait.sql", "sicklingTestDone.sql")
    .withSubReportWithDenominator("Disease", "disease.sql", "sicklingTestDone.sql")
    .withSubReportWithDenominator("Counselling Done", "counsellingDone.sql", "diseaseOrTrait.sql")
    .withSubReportWithDenominator("Referred", "referralForSickling.sql", "diseaseOrTrait.sql")
    .build();

const ironTabletsReport = new ReportBuilder()
    .withName("IronTables")
    .withDirName("ironTablets")
    .withSubReportWithDenominator("Received", "received.sql", "totalNonExitedEnrolled.sql")
    .withSubReportWithDenominator("Consumed", "taken.sql", "received.sql")
    .withSubReportWithDenominator("Albandazole Tablets Received", "albendazole.sql", "totalNonExitedEnrolled.sql")
    .build();

const vulnerability = new ReportBuilder()
    .withName("Vulnerabilities")
    .withDirName("vulnerability")
    .withSubReportWithDenominator("Vulnerable Adolescents", "vulnerable.sql", "totalNonExitedEnrolled.sql")
    .withSubReportWithDenominator("School Dropout", "dropout.sql", "vulnerable.sql")
    .withSubReportWithDenominator("Addiction", "addiction.sql", "vulnerable.sql")
    .withSubReportWithDenominator("Early Pregnancy and RTI", "rti.sql", "vulnerable.sql")
    .withSubReportWithDenominator("Early Marriage", "earlyMarriage.sql", "vulnerable.sql")
    .withSubReportWithDenominator("Road Traffic Accident", "accident.sql", "vulnerable.sql")
    .build();

const standard = new ReportBuilder()
    .withName("DropoutStandard")
    .withDirName("standard")
    .withSubReportWithDenominator("<7", "6.sql", "discontinued.sql")
    .withSubReportWithDenominator("7", "7.sql", "discontinued.sql")
    .withSubReportWithDenominator("8", "8.sql", "discontinued.sql")
    .withSubReportWithDenominator("9", "9.sql", "discontinued.sql")
    .withSubReportWithDenominator("10", "10.sql", "discontinued.sql")
    .withSubReportWithDenominator("11", "11.sql", "discontinued.sql")
    .withSubReportWithDenominator("12", "12.sql", "discontinued.sql")
    .build();

const followup = new ReportBuilder()
    .withName("FollowUpVisits")
    .withDirName("followupVisit")
    .withSubReportWithDenominator("Total Adolescents With Followup Visits", "all.sql", "adolescentsStartedSchool.sql")
    .withSubReportWithDenominator("1 Visit", "1Visit.sql", "adolescentsStartedSchool.sql")
    .withSubReportWithDenominator("2 Visit", "2Visit.sql", "adolescentsStartedSchool.sql")
    .withSubReportWithDenominator("3 Visit", "3Visit.sql", "adolescentsStartedSchool.sql")
    .withSubReportWithDenominator("4 Visit", "4Visit.sql", "adolescentsStartedSchool.sql")
    .withSubReportWithDenominator("5 Visit", "5Visit.sql", "adolescentsStartedSchool.sql")
    .build();

const parentsAndStayStatus = new ReportBuilder()
    .withName("StatusOfParentsAndStay")
    .withDirName("parentsAndStayStatus")
    .withSubReportWithDenominator("Either only mother or father alive", "parentsAlive.sql", "totalNonExitedEnrolled.sql")
    .withSubReportWithDenominator("Both parents expired", "parentsExpired.sql", "totalNonExitedEnrolled.sql")
    .withSubReportWithDenominator("Staying With Parents", "stayingWithParents.sql", "totalNonExitedEnrolled.sql")
    .withSubReportWithDenominator("Staying In Hostel", "stayingInHostel.sql", "totalNonExitedEnrolled.sql")
    .withSubReportWithDenominator("Staying With Relatives", "stayingWithRelatives.sql", "totalNonExitedEnrolled.sql")
    .build();

const rti = new ReportBuilder()
    .withName("SignsOfRTIAndRiskOfEarlyPregnancy")
    .withDirName("rti")
    .withSubReportWithDenominator("Sexually Active", "sexuallyActive.sql", "totalNonExitedEnrolled.sql")
    .withSubReportWithDenominator("Multiple Partners", "multiplePartners.sql", "sexuallyActive.sql")
    .withSubReportWithDenominator("Unprotected Sex", "unprotectedSex.sql", "sexuallyActive.sql")
    .withSubReportWithDenominator("Burning Micturition", "burningMicturition.sql", "totalNonExitedEnrolled.sql")
    .withSubReportWithDenominator("Ulcer over Genetalia", "ulcer.sql", "totalNonExitedEnrolled.sql")
    .withSubReportWithDenominator("Abnormal discharge from vagina/penis", "abnormalDischarge.sql", "totalNonExitedEnrolled.sql")
    .build();

const rta = new ReportBuilder()
    .withName("RiskOfRTA")
    .withDirName("rta")
    .withSubReportWithDenominator("Driving Vehicle", "vehicle.sql", "totalNonExitedEnrolled.sql")
    .withSubReportWithDenominator("With Helmet", "withHelmet.sql", "vehicle.sql")
    .withSubReportWithDenominator("With License", "withLicense.sql", "vehicle.sql")
    .withSubReportWithDenominator("Had Accident", "hadAccident.sql", "vehicle.sql")
    .build();

const helpline = new ReportBuilder()
    .withName("AssessmentOfHelplineServices")
    .withDirName("helpline")
    .withSubReportWithDenominator("Utilization of helpline", "utilised.sql", "totalNonExitedEnrolled.sql")
    .withSubReportWithDenominator("Satisfied with helpline", "satisfied.sql", "utilised.sql")
    .build();

const caste = new ReportBuilder()
    .withName('SocioDemographicsCaste')
    .withDirName('caste')
    .withSubReportWithDenominator('Caste ST', 'casteST.sql', 'everyone.sql')
    .withSubReportWithDenominator('Caste SC', 'casteSC.sql', 'everyone.sql')
    .withSubReportWithDenominator('Caste OBC', 'casteOBC.sql', 'everyone.sql')
    .withSubReportWithDenominator('Caste General', 'casteGeneral.sql', 'everyone.sql')
    .build();

const age = new ReportBuilder()
    .withName('SocioDemographicsAge')
    .withDirName('age')
    .withSubReportWithDenominator('Age 10-14', 'ageFrom10To14.sql', 'everyone.sql')
    .withSubReportWithDenominator('Age 15-19', 'ageFrom15To19.sql', 'everyone.sql')
    .build();

const religion = new ReportBuilder()
    .withName('SocioDemographicsReligion')
    .withDirName('religion')
    .withSubReportWithDenominator('Christian', 'christian.sql', 'everyone.sql')
    .withSubReportWithDenominator('Hindu', 'hindu.sql', 'everyone.sql')
    .withSubReportWithDenominator('Jain', 'jain.sql', 'everyone.sql')
    .withSubReportWithDenominator('Muslim', 'muslim.sql', 'everyone.sql')
    .withSubReportWithDenominator('Other', 'other.sql', 'everyone.sql')
    .withSubReportWithDenominator('Sikh', 'sikh.sql', 'everyone.sql')
    .build();

const rationCard = new ReportBuilder()
    .withName('SocioDemographicsRationCard')
    .withDirName('rationCard')
    .withSubReportWithDenominator('APL', 'apl.sql', 'everyone.sql')
    .withSubReportWithDenominator('BPL', 'bpl.sql', 'everyone.sql')
    .withSubReportWithDenominator('Antyodaya', 'antyodaya.sql', 'everyone.sql')
    .withSubReportWithDenominator('No', 'no.sql', 'everyone.sql')
    .build();


const standard_8_9_10 = new ReportBuilder()
    .withName("Standard8And9And10")
    .withDirName("schoolGoing")
    .withSubReportWithDenominator("8", "8.sql", "allSchoolGoing.sql")
    .withSubReportWithDenominator("9", "9.sql", "allSchoolGoing.sql")
    .withSubReportWithDenominator("10", "10.sql", "allSchoolGoing.sql")
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
        vulnerability,
        standard,
        followup,
        parentsAndStayStatus,
        rti,
        rta,
        helpline,
        caste,
        age,
        religion,
        rationCard,
        standard_8_9_10
    ].map((report) => report.generate());

module.exports = generate;