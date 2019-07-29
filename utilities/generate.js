const ReportBuilder = require('./builder/ReportBuilder');


const serviceDeliveryReport = new ReportBuilder()
    .withName("ServiceDelivery")
    .withDirName("serviceDelivery")
    .withSubReport("Total Adolescents Registered", "totalRegistered.sql")
    .withSubReportWithDenominator("Total Adolescents Enrolled",
        "totalNonExitedEnrolled.sql",
        "serviceDelivery/totalRegistered.sql")
    .withSubReportWithDenominator("Total Adolescents With Problems",
        "totalAdolescentsWithProblems.sql",
        "serviceDelivery/totalNonExitedEnrolled.sql")
    .withSubReportWithDenominator("Total Adolescents Referred",
        "totalAdolescentsWithReferralAdvice.sql",
        "serviceDelivery/totalNonExitedEnrolled.sql")
    .withSubReportWithDenominator("Total Adolescents Dropped Out",
        "totalAdolescentsDroppedOut.sql",
        "serviceDelivery/totalNonExitedEnrolled.sql")
    .withSubReportWithDenominator("Total Adolescents With a Dropout Home Visit",
        "totalIndividualsWithDropOutHomeVisit.sql",
        "serviceDelivery/totalAdolescentsDroppedOut.sql")
    .withSubReportWithDenominator("Total Adolescents Started Going to School Again",
        "adolescentsStartedSchool.sql",
        "serviceDelivery/totalAdolescentsDroppedOut.sql")
    .build();


const addictionReport = new ReportBuilder()
    .withName("Addiction")
    .withDirName("addiction")
    .withSubReportWithDenominator("Adolescents Addicted to Tobacco", "tobaccoAddiction.sql", "common/totalNonExitedEnrolled.sql")
    .withSubReportWithDenominator("Adolescents Addicted to Alcohol", "alcoholAddiction.sql", "common/totalNonExitedEnrolled.sql")
    .withSubReportWithDenominator("Adolescents Addicted to Both", "alcoholAndTobaccoAddiction.sql", "common/totalNonExitedEnrolled.sql")
    .withSubReportWithDenominator("Fathers Addicted", "fathersAddiction.sql", "common/totalNonExitedEnrolled.sql")
    .withSubReportWithDenominator("Mothers Addicted", "mothersAddiction.sql", "common/totalNonExitedEnrolled.sql")
    .build();

const educationReport = new ReportBuilder()
    .withName("Education")
    .withDirName("education")
    .withSubReportWithDenominator("Adolescents who discontinued education", "totalAdolescentsDroppedOut.sql", "education/totalNonExitedEnrolled.sql")
    .withSubReportWithDenominator("Not interested in studies", "notInterestedInStudies.sql", "education/totalAdolescentsDroppedOut.sql")
    .withSubReportWithDenominator("Poor Economic Condition", "poorEconomicCondition.sql", "education/totalAdolescentsDroppedOut.sql")
    .withSubReportWithDenominator("Domestic Work", "domesticWork.sql", "education/totalAdolescentsDroppedOut.sql")
    .withSubReportWithDenominator("Migration", "migration.sql", "education/totalAdolescentsDroppedOut.sql")
    .withSubReportWithDenominator("Marriage", "marriage.sql", "education/totalAdolescentsDroppedOut.sql")
    .withSubReportWithDenominator("No School in Village", "noSchoolInVillage.sql", "education/totalAdolescentsDroppedOut.sql")
    .withSubReportWithDenominator("Study Completed", "studyCompleted.sql", "education/totalAdolescentsDroppedOut.sql")
    .withSubReportWithDenominator("Other Reason", "otherReason.sql", "education/totalAdolescentsDroppedOut.sql")
    .build();

const menstruationReport = new ReportBuilder()
    .withName("Menstruation")
    .withDirName("menstruation")
    .withSubReportWithDenominator("Menstruation Started", "started.sql", "menstruation/totalNonExitedEnrolled.sql")
    .withSubReportWithDenominator("Menstrual Disorder", "disorder.sql", "menstruation/started.sql")
    .withSubReportWithDenominator("Headache", "headache.sql", "menstruation/disorder.sql")
    .withSubReportWithDenominator("Heavy Bleeding", "heavyBleeding.sql", "menstruation/disorder.sql")
    .withSubReportWithDenominator("Lower Abdominal Pain", "lowerAbdominalPain.sql", "menstruation/disorder.sql")
    .withSubReportWithDenominator("Abnormal Discharge", "abnormalDischarge.sql", "menstruation/disorder.sql")
    .withSubReportWithDenominator("Backache", "backache.sql", "menstruation/disorder.sql")
    .withSubReportWithDenominator("Leg Pain", "legPain.sql", "menstruation/disorder.sql")
    .withSubReportWithDenominator("Nausea And Vomiting", "nauseaAndVomitting.sql", "menstruation/disorder.sql")
    .build();

const absorbentMaterialUsedReport = new ReportBuilder()
    .withName("AbsorbentMaterialUsed")
    .withDirName("absorbentMaterialUsed")
    .withSubReportWithDenominator("Old Cloth", "oldCloth.sql", "common/started.sql")
    .withSubReportWithDenominator("Sanitary Pad", "sanitaryPad.sql", "common/started.sql")
    .withSubReportWithDenominator("Falalin", "falalin.sql", "common/started.sql")
    .withSubReportWithDenominator("Kit Pad", "kitPad.sql", "common/started.sql")
    .withSubReportWithDenominator("MHM Kit Provided?", "kitProvided.sql", "common/started.sql")
    .withSubReportWithDenominator("MHM Kit Used", "kitUsed.sql", "absorbentMaterialUsed/kitProvided.sql")
    .build();

const treatmentTakenForMenstrualDisorderReport = new ReportBuilder()
    .withName("TreatmentTakenForMenstrualDisorder")
    .withDirName("menstrualDisorderTreatment")
    .withSubReportWithDenominator("Disorder", "disorder.sql", "common/started.sql")
    .withSubReportWithDenominator("Treament Taken", "takingTreatment.sql", "menstrualDisorderTreatment/disorder.sql")
    .withSubReportWithDenominator("Home Remedy", "homeRemedy.sql", "menstrualDisorderTreatment/disorder.sql")
    .withSubReportWithDenominator("Consulted Doctor", "consultedDoctor.sql", "menstrualDisorderTreatment/disorder.sql")
    .withSubReportWithDenominator("Tablet From Shop", "tabletFromShop.sql", "menstrualDisorderTreatment/disorder.sql")
    .withSubReportWithDenominator("Tablet From Kit", "tabletFromKit.sql", "menstrualDisorderTreatment/disorder.sql")
    .build();

const nutritionReport = new ReportBuilder()
    .withName("Nutrition")
    .withDirName("nutrition")
    .withSubReportWithDenominator("Severely Malnourished", "severelyMalnourished.sql", "common/totalNonExitedEnrolled.sql")
    .withSubReportWithDenominator("Malnourished", "malnourished.sql", "common/totalNonExitedEnrolled.sql")
    .withSubReportWithDenominator("Normal", "normal.sql", "common/totalNonExitedEnrolled.sql")
    .withSubReportWithDenominator("Overweight", "overweight.sql", "common/totalNonExitedEnrolled.sql")
    .withSubReportWithDenominator("Obese", "obese.sql", "common/totalNonExitedEnrolled.sql")
    .build();

const hemoglobinReport = new ReportBuilder()
    .withName("Hemoglobin")
    .withDirName("hemoglobin")
    .withSubReportWithDenominator("< 7", "hbLessThan7.sql", "common/totalNonExitedEnrolled.sql")
    .withSubReportWithDenominator("7.1 - 10.0", "hbGreaterThan7LessThan10.sql", "common/totalNonExitedEnrolled.sql")
    .withSubReportWithDenominator("10.1 - 11.9", "hbGreaterThan10LessThan11.9.sql", "common/totalNonExitedEnrolled.sql")
    .withSubReportWithDenominator("12", "hbEqualsTo12.sql", "common/totalNonExitedEnrolled.sql")
    .withSubReportWithDenominator("12.1 - 13.0", "hbGreaterThan12LessThan13.sql", "common/totalNonExitedEnrolled.sql")
    .withSubReportWithDenominator("> 13", "hbGreaterThan13.sql", "common/totalNonExitedEnrolled.sql")
    .build();

const sicklingReport = new ReportBuilder()
    .withName("SicklingTest")
    .withDirName("sickling")
    .withSubReportWithDenominator("Test Done", "sicklingTestDone.sql", "common/totalNonExitedEnrolled.sql")
    .withSubReportWithDenominator("Negative", "negative.sql", "sickling/sicklingTestDone.sql")
    .withSubReportWithDenominator("Trait", "trait.sql", "sickling/sicklingTestDone.sql")
    .withSubReportWithDenominator("Disease", "disease.sql", "sickling/sicklingTestDone.sql")
    .withSubReportWithDenominator("Counselling Done", "counsellingDone.sql", "sickling/diseaseOrTrait.sql")
    .withSubReportWithDenominator("Referred", "referralForSickling.sql", "sickling/diseaseOrTrait.sql")
    .build();

const ironTabletsReport = new ReportBuilder()
    .withName("IronTables")
    .withDirName("ironTablets")
    .withSubReportWithDenominator("Received", "received.sql", "common/totalNonExitedEnrolled.sql")
    .withSubReportWithDenominator("Consumed", "taken.sql", "ironTablets/received.sql")
    .withSubReportWithDenominator("Albandazole Tablets Received", "albendazole.sql", "common/totalNonExitedEnrolled.sql")
    .build();

const vulnerability = new ReportBuilder()
    .withName("Vulnerabilities")
    .withDirName("vulnerability")
    .withSubReportWithDenominator("Vulnerable Adolescents", "vulnerable.sql", "common/totalNonExitedEnrolled.sql")
    .withSubReportWithDenominator("School Dropout", "dropout.sql", "vulnerability/vulnerable.sql")
    .withSubReportWithDenominator("Addiction", "addiction.sql", "vulnerability/vulnerable.sql")
    .withSubReportWithDenominator("Early Pregnancy and RTI", "rti.sql", "vulnerability/vulnerable.sql")
    .withSubReportWithDenominator("Early Marriage", "earlyMarriage.sql", "vulnerability/vulnerable.sql")
    .withSubReportWithDenominator("Road Traffic Accident", "accident.sql", "vulnerability/vulnerable.sql")
    .build();

const standard = new ReportBuilder()
    .withName("DropoutStandard")
    .withDirName("standard")
    .withSubReportWithDenominator("<7", "6.sql", "common/discontinued.sql")
    .withSubReportWithDenominator("7", "7.sql", "common/discontinued.sql")
    .withSubReportWithDenominator("8", "8.sql", "common/discontinued.sql")
    .withSubReportWithDenominator("9", "9.sql", "common/discontinued.sql")
    .withSubReportWithDenominator("10", "10.sql", "common/discontinued.sql")
    .withSubReportWithDenominator("11", "11.sql", "common/discontinued.sql")
    .withSubReportWithDenominator("12", "12.sql", "common/discontinued.sql")
    .build();

const followup = new ReportBuilder()
    .withName("FollowUpVisits")
    .withDirName("followupVisit")
    .withSubReportWithDenominator("Total Adolescents With Followup Visits", "all.sql", "followupVisit/adolescentsStartedSchool.sql")
    .withSubReportWithDenominator("1 Visit", "1Visit.sql", "followupVisit/adolescentsStartedSchool.sql")
    .withSubReportWithDenominator("2 Visit", "2Visit.sql", "followupVisit/adolescentsStartedSchool.sql")
    .withSubReportWithDenominator("3 Visit", "3Visit.sql", "followupVisit/adolescentsStartedSchool.sql")
    .withSubReportWithDenominator("4 Visit", "4Visit.sql", "followupVisit/adolescentsStartedSchool.sql")
    .withSubReportWithDenominator("5 Visit", "5Visit.sql", "followupVisit/adolescentsStartedSchool.sql")
    .build();

const parentsAndStayStatus = new ReportBuilder()
    .withName("StatusOfParentsAndStay")
    .withDirName("parentsAndStayStatus")
    .withSubReportWithDenominator("Either only mother or father alive", "parentsAlive.sql", "common/totalNonExitedEnrolled.sql")
    .withSubReportWithDenominator("Both parents expired", "parentsExpired.sql", "common/totalNonExitedEnrolled.sql")
    .withSubReportWithDenominator("Staying With Parents", "stayingWithParents.sql", "common/totalNonExitedEnrolled.sql")
    .withSubReportWithDenominator("Staying In Hostel", "stayingInHostel.sql", "common/totalNonExitedEnrolled.sql")
    .withSubReportWithDenominator("Staying With Relatives", "stayingWithRelatives.sql", "common/totalNonExitedEnrolled.sql")
    .build();

const rti = new ReportBuilder()
    .withName("SignsOfRTIAndRiskOfEarlyPregnancy")
    .withDirName("rti")
    .withSubReportWithDenominator("Sexually Active", "sexuallyActive.sql", "common/totalNonExitedEnrolled.sql")
    .withSubReportWithDenominator("Multiple Partners", "multiplePartners.sql", "rti/sexuallyActive.sql")
    .withSubReportWithDenominator("Unprotected Sex", "unprotectedSex.sql", "rti/sexuallyActive.sql")
    .withSubReportWithDenominator("Burning Micturition", "burningMicturition.sql", "common/totalNonExitedEnrolled.sql")
    .withSubReportWithDenominator("Ulcer over Genetalia", "ulcer.sql", "common/totalNonExitedEnrolled.sql")
    .withSubReportWithDenominator("Abnormal discharge from vagina/penis", "abnormalDischarge.sql", "common/totalNonExitedEnrolled.sql")
    .build();

const rta = new ReportBuilder()
    .withName("RiskOfRTA")
    .withDirName("rta")
    .withSubReportWithDenominator("Driving Vehicle", "vehicle.sql", "common/totalNonExitedEnrolled.sql")
    .withSubReportWithDenominator("With Helmet", "withHelmet.sql", "rta/vehicle.sql")
    .withSubReportWithDenominator("With License", "withLicense.sql", "rta/vehicle.sql")
    .withSubReportWithDenominator("Had Accident", "hadAccident.sql", "rta/vehicle.sql")
    .build();

const helpline = new ReportBuilder()
    .withName("AssessmentOfHelplineServices")
    .withDirName("helpline")
    .withSubReportWithDenominator("Utilization of helpline", "utilised.sql", "common/totalNonExitedEnrolled.sql")
    .withSubReportWithDenominator("Satisfied with helpline", "satisfied.sql", "helpline/utilised.sql")
    .build();

const caste = new ReportBuilder()
    .withName('SocioDemographicsCaste')
    .withDirName('caste')
    .withSubReportWithDenominator('Caste ST', 'casteST.sql', 'common/everyone.sql')
    .withSubReportWithDenominator('Caste SC', 'casteSC.sql', 'common/everyone.sql')
    .withSubReportWithDenominator('Caste OBC', 'casteOBC.sql', 'common/everyone.sql')
    .withSubReportWithDenominator('Caste General', 'casteGeneral.sql', 'common/everyone.sql')
    .build();

const age = new ReportBuilder()
    .withName('SocioDemographicsAge')
    .withDirName('age')
    .withSubReportWithDenominator('Age 10-14', 'ageFrom10To14.sql', 'common/everyone.sql')
    .withSubReportWithDenominator('Age 15-19', 'ageFrom15To19.sql', 'common/everyone.sql')
    .build();

const religion = new ReportBuilder()
    .withName('SocioDemographicsReligion')
    .withDirName('religion')
    .withSubReportWithDenominator('Christian', 'christian.sql', 'common/everyone.sql')
    .withSubReportWithDenominator('Hindu', 'hindu.sql', 'common/everyone.sql')
    .withSubReportWithDenominator('Jain', 'jain.sql', 'common/everyone.sql')
    .withSubReportWithDenominator('Muslim', 'muslim.sql', 'common/everyone.sql')
    .withSubReportWithDenominator('Other', 'other.sql', 'common/everyone.sql')
    .withSubReportWithDenominator('Sikh', 'sikh.sql', 'common/everyone.sql')
    .build();

const rationCard = new ReportBuilder()
    .withName('SocioDemographicsRationCard')
    .withDirName('rationCard')
    .withSubReportWithDenominator('APL', 'apl.sql', 'common/everyone.sql')
    .withSubReportWithDenominator('BPL', 'bpl.sql', 'common/everyone.sql')
    .withSubReportWithDenominator('Antyodaya', 'antyodaya.sql', 'common/everyone.sql')
    .withSubReportWithDenominator('No', 'no.sql', 'common/everyone.sql')
    .build();


const standard_8_9_10 = new ReportBuilder()
    .withName("Standard_8_9_10")
    .withDirName("schoolGoing")
    .withSubReportWithDenominator("8", "8.sql", "schoolGoing/allSchoolGoing.sql")
    .withSubReportWithDenominator("9", "9.sql", "schoolGoing/allSchoolGoing.sql")
    .withSubReportWithDenominator("10", "10.sql", "schoolGoing/allSchoolGoing.sql")
    .build();


const exitReason = new ReportBuilder()
    .withName("ExitReason")
    .withDirName("exitReason")
    .withSubReportWithDenominator("Age more than 20 years", "ageMoreThan20.sql", "exitReason/totalExited.sql")
    .withSubReportWithDenominator("Death", "death.sql", "exitReason/totalExited.sql")
    .withSubReportWithDenominator("Migration", "migration.sql", "exitReason/totalExited.sql")
    .withSubReportWithDenominator("Marriage", "marriage.sql", "exitReason/totalExited.sql")
    .withSubReportWithDenominator("Pregnancy", "pregnancy.sql", "exitReason/totalExited.sql")
    .withSubReportWithDenominator("Lost to follow-up", "lostToFollowUp.sql", "exitReason/totalExited.sql")
    .build();

const schoolGoingChildren = new ReportBuilder()
    .withName("SchoolGoingChildren")
    .withDirName("schoolGoingChildren")
    .withSubReportWithDenominator("Standard 5", "standard5.sql", "schoolGoingChildren/totalNonExitedEnrolled.sql")
    .withSubReportWithDenominator("Standard 6", "standard6.sql", "schoolGoingChildren/totalNonExitedEnrolled.sql")
    .withSubReportWithDenominator("Standard 7", "standard7.sql", "schoolGoingChildren/totalNonExitedEnrolled.sql")
    .withSubReportWithDenominator("Standard 8", "standard8.sql", "schoolGoingChildren/totalNonExitedEnrolled.sql")
    .withSubReportWithDenominator("Standard 9", "standard9.sql", "schoolGoingChildren/totalNonExitedEnrolled.sql")
    .withSubReportWithDenominator("Standard 10", "standard10.sql", "schoolGoingChildren/totalNonExitedEnrolled.sql")
    .build();

const enrolledExited = new ReportBuilder()
    .withName("EnrolledExited")
    .withDirName("enrolledExited")
    .withSubReportWithDenominator("In program", "totalInProgram.sql", "enrolledExited/totalRegistered.sql")
    .withSubReportWithDenominator("Exited in this period", "totalExited.sql", "enrolledExited/totalInProgram.sql")
    .build();

const chronicSickness = new ReportBuilder()
    .withName("ChronicSickness")
    .withDirName("chronicSickness")
    .withSubReportWithDenominator("Heart problem", "heartProblem.sql", "chronicSickness/totalNonExitedEnrolled.sql")
    .withSubReportWithDenominator("Kidney problem", "kidneyProblem.sql", "chronicSickness/totalNonExitedEnrolled.sql")
    .withSubReportWithDenominator("Other Problem", "otherProblem.sql", "chronicSickness/totalNonExitedEnrolled.sql")
    .withSubReportWithDenominator("Convulsion", "convulsion.sql", "chronicSickness/totalNonExitedEnrolled.sql")
    .withSubReportWithDenominator("Taking treatment regularly", "takingTreatment.sql", "chronicSickness/totalNonExitedEnrolled.sql")
    .withSubReportWithDenominator("Fever", "fever.sql", "chronicSickness/totalNonExitedEnrolled.sql")
    .withSubReportWithDenominator("Cough-cold", "coughCold.sql", "chronicSickness/totalNonExitedEnrolled.sql")
    .withSubReportWithDenominator("Jaundice", "jaundice.sql", "chronicSickness/totalNonExitedEnrolled.sql")
    .withSubReportWithDenominator("Abdominal pain", "abdominalPain.sql", "chronicSickness/totalNonExitedEnrolled.sql")
    .withSubReportWithDenominator("Diarrhoea", "diarrhoea.sql", "chronicSickness/totalNonExitedEnrolled.sql")
    .withSubReportWithDenominator("Other Sickness", "otherSickness.sql", "chronicSickness/totalNonExitedEnrolled.sql")
    .withSubReportWithDenominator("Hospitalization", "hospitalization.sql", "chronicSickness/totalNonExitedEnrolled.sql")
    .build();

const schoolDropoutAndReadmission = new ReportBuilder()
    .withName("SchoolDropoutAndReadmission")
    .withDirName("schoolDropoutAndReadmission")
    .withSubReportWithDenominator("Adolescents who came back after one visit", "firstVisitReadmission.sql", "schoolDropoutAndReadmission/totalDroppedOut.sql")
    .withSubReportWithDenominator("Adolescents who came back after two visit", "secondVisitReadmission.sql", "schoolDropoutAndReadmission/totalDroppedOut.sql")
    .withSubReportWithDenominator("Adolescents who came back after three visit", "thirdVisitReadmission.sql", "schoolDropoutAndReadmission/totalDroppedOut.sql")
    .withSubReportWithDenominator("Adolescents who came back after 4 visits", "fourthVisitReadmission.sql", "schoolDropoutAndReadmission/totalDroppedOut.sql")
    .withSubReportWithDenominator("Adolescents who came back after 5 visits", "fifthVisitReadmission.sql", "schoolDropoutAndReadmission/totalDroppedOut.sql")
    .withSubReportWithDenominator("Did not come back", "noReadmission.sql", "schoolDropoutAndReadmission/totalDroppedOut.sql")
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
        standard_8_9_10,
        exitReason,
        schoolGoingChildren,
        enrolledExited,
        chronicSickness,
        schoolDropoutAndReadmission
    ].map((report) => report.generate());

module.exports = generate;
