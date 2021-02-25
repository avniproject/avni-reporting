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
        .withSubReportWithDenominator("Exited", "totalExited.sql", "serviceDelivery/totalInProgram.sql")
    .withSubReportWithDenominator("All menstruating girls",
        "started.sql",
        "absorbentMaterialUsed/totalFemaleAdolescent.sql")
    .withSubReportWithDenominator("MHM Kit Provided?",
        "kitProvided.sql",
        "absorbentMaterialUsed/totalFemaleAdolescent.sql")
    .withSubReportWithDenominator("MHM Kit Used",
        "kitUsed.sql",
        "absorbentMaterialUsed/started.sql")
    .build();

//Prevalence of Substance misuse
const addictionReport = new ReportBuilder()
    .withName("Addiction")
    .withDirName("addiction")
    .withSubReportWithDenominator("Adolescents Addicted to Tobacco", "tobaccoAddiction.sql", "addiction/totalNonExitedEnrolled.sql")
    .withSubReportWithDenominator("Adolescents Addicted to Alcohol", "alcoholAddiction.sql", "addiction/totalNonExitedEnrolled.sql")
    .withSubReportWithDenominator("Adolescents quited Tobacco", "tobaccoQuitter.sql", "addiction/tobaccoAddiction.sql")
    .withSubReportWithDenominator("Adolescents quited Alcohol", "alcoholQuitter.sql", "addiction/alcoholAddiction.sql")
    .build();

//Reasons for school dropout
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
    .withSubReportWithDenominator("Reason not mentioned", "reasonNotMentioned.sql", "education/totalAdolescentsDroppedOut.sql")
    .build();

//Menstrual disorders
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

//Menstrual Hygiene Practices
const absorbentMaterialUsedReport = new ReportBuilder()
    .withName("AbsorbentMaterialUsed")
    .withDirName("absorbentMaterialUsed")
    .withSubReportWithDenominator("Old Cloth", "oldCloth.sql", "absorbentMaterialUsed/started.sql")
    .withSubReportWithDenominator("Sanitary Pad", "sanitaryPad.sql", "absorbentMaterialUsed/started.sql")
    .withSubReportWithDenominator("Falalin", "falalin.sql", "absorbentMaterialUsed/started.sql")
    .withSubReportWithDenominator("All menstruating girls", "started.sql", "absorbentMaterialUsed/totalFemaleAdolescent.sql")
    .withSubReportWithDenominator("MHM Kit Provided?", "kitProvided.sql", "absorbentMaterialUsed/totalFemaleAdolescent.sql")
    .withSubReportWithDenominator("MHM Kit Used", "kitUsed.sql", "absorbentMaterialUsed/started.sql")
    .build();

const treatmentTakenForMenstrualDisorderReport = new ReportBuilder()
    .withName("TreatmentTakenForMenstrualDisorder")
    .withDirName("menstrualDisorderTreatment")
    .withSubReportWithDenominator("Disorder", "disorder.sql", "common/started.sql")
    .withSubReportWithDenominator("Treament Taken", "takingTreatment.sql", "common/started.sql")
    .withSubReportWithDenominator("Home Remedy", "homeRemedy.sql", "common/started.sql")
    .withSubReportWithDenominator("Consulted Doctor", "consultedDoctor.sql", "common/started.sql")
    .withSubReportWithDenominator("Tablet From Shop", "tabletFromShop.sql", "common/started.sql")
    .withSubReportWithDenominator("Tablet From Kit", "tabletFromKit.sql", "common/started.sql")
    .build();

//Prevalence of Malnutrition
const nutritionReport = new ReportBuilder()
    .withName("Nutrition")
    .withDirName("nutrition")
    .withSubReportWithDenominator("Severely Malnourished", "severelyMalnourished.sql", "nutrition/totalNonExitedEnrolled.sql")
    .withSubReportWithDenominator("Malnourished", "malnourished.sql", "nutrition/totalNonExitedEnrolled.sql")
    .withSubReportWithDenominator("Normal", "normal.sql", "nutrition/totalNonExitedEnrolled.sql")
    .withSubReportWithDenominator("Overweight", "overweight.sql", "nutrition/totalNonExitedEnrolled.sql")
    .withSubReportWithDenominator("Obese", "obese.sql", "nutrition/totalNonExitedEnrolled.sql")
    .withSubReportWithDenominator("BMI not done", "bmiNotDone.sql", "nutrition/bmiNotNormal.sql")
    .build();

//Prevalence of Anemia
const hemoglobinReport = new ReportBuilder()
    .withName("Hemoglobin")
    .withDirName("hemoglobin")
    .withSubReportWithDenominator("<= 7", "hbLessThan7.sql", "hemoglobin/totalNonExitedEnrolled.sql")
    .withSubReportWithDenominator("7.1 - 10.0", "hbGreaterThan7LessThan10.sql", "hemoglobin/totalNonExitedEnrolled.sql")
    .withSubReportWithDenominator("10.1 - 11.9", "hbGreaterThan10LessThan11.9.sql", "hemoglobin/totalNonExitedEnrolled.sql")
    .withSubReportWithDenominator("12", "hbEqualsTo12.sql", "hemoglobin/totalNonExitedEnrolled.sql")
    .withSubReportWithDenominator("12.1 - 13.0", "hbGreaterThan12LessThan13.sql", "hemoglobin/totalNonExitedEnrolled.sql")
    .withSubReportWithDenominator("> 13", "hbGreaterThan13.sql", "hemoglobin/totalNonExitedEnrolled.sql")
    .withSubReportWithDenominator("HB not recorded", "noHb.sql", "hemoglobin/totalNonExitedEnrolled.sql")
    .build();

//Prevalence of Sickle cell Anemia
const sicklingReport = new ReportBuilder()
    .withName("SicklingTest")
    .withDirName("sickling")
    .withSubReportWithDenominator("Total Tested Adolescents", "sicklingTestDone.sql", "sickling/totalNonExitedEnrolled.sql")
    .withSubReportWithDenominator("Negative", "negative.sql", "sickling/sicklingTestDone.sql")
    .withSubReportWithDenominator("Counseling done for Trait", "counsellingDoneForTrait.sql", "sickling/trait.sql")
    .withSubReportWithDenominator("Counseling done for Disease", "counsellingDoneForDisease.sql", "sickling/disease.sql")
    .withSubReportWithDenominator("Referred", "referralForSickling.sql", "sickling/diseaseOrTrait.sql")
    .build();

//IFA distribution & Consumption
const severeModerateAnemiaIronTabletsReport = new ReportBuilder()
    .withName("IFADistribution&ConsumptionForSevereAndModerateAnemia")
    .withDirName("ifaDistributonAndConsumption")
    .withSubReportWithDenominator("Adolescents with Severe & Moderate Anemia", "severeAndModerate/totalSevereAndModerate.sql", "ifaDistributonAndConsumption/severeAndModerate/totalNonExitedEnrolledSevereAndModerate.sql")
    .withSubReportWithDenominator("Adolescents received IFA", "severeAndModerate/received.sql", "ifaDistributonAndConsumption/severeAndModerate/totalSevereAndModerate.sql")
    .withSubReportWithDenominator("Adolescents received and consumed IFA", "severeAndModerate/receivedAndConsumed.sql", "ifaDistributonAndConsumption/severeAndModerate/received.sql")
    .withSubReportWithDenominator("Adolescents consumed 1 to 10 tablet", "severeAndModerate/taken1To10.sql", "ifaDistributonAndConsumption/severeAndModerate/received.sql")
    .withSubReportWithDenominator("Adolescents consumed 11 to 20 tablets", "severeAndModerate/taken11To20.sql", "ifaDistributonAndConsumption/severeAndModerate/received.sql")
    .withSubReportWithDenominator("Adolescents consumed 21 to 30 tablets", "severeAndModerate/taken21To30.sql", "ifaDistributonAndConsumption/severeAndModerate/received.sql")
    .withSubReportWithDenominator("Adolescents consumed > 30 tablets ", "severeAndModerate/takenMoreThan30.sql", "ifaDistributonAndConsumption/severeAndModerate/received.sql")
    .withSubReportWithDenominator("Adolescents received Albendazol", "severeAndModerate/albendazole.sql", "ifaDistributonAndConsumption/severeAndModerate/totalSevereAndModerate.sql")
    .build();


//IFA distribution & Consumption
const normalMildAnemiaIronTabletsReport = new ReportBuilder()
    .withName("IFADistribution&ConsumptionForNormalAndMildAnemia")
    .withDirName("ifaDistributonAndConsumption")
    .withSubReportWithDenominator("Adolescents with Normal & Mild Anemia", "normalAndMild/totalNormalAndMild.sql", "ifaDistributonAndConsumption/normalAndMild/totalNonExitedEnrolledNormal.sql")
    .withSubReportWithDenominator("Adolescents received IFA", "normalAndMild/received.sql", "ifaDistributonAndConsumption/normalAndMild/totalNormalAndMild.sql")
    .withSubReportWithDenominator("Adolescents received and consumed IFA", "normalAndMild/received&consumed.sql", "ifaDistributonAndConsumption/normalAndMild/totalNormalAndMild.sql")
    .withSubReportWithDenominator("Adolescents consumed 1 to 6 tablet", "normalAndMild/taken1To6Tablet.sql", "ifaDistributonAndConsumption/normalAndMild/received.sql")
    .withSubReportWithDenominator("Adolescents consumed 7 to 11 tablets", "normalAndMild/taken7To11Tablet.sql", "ifaDistributonAndConsumption/normalAndMild/received.sql")
    .withSubReportWithDenominator("Adolescents consumed >= 12 (All) tablets", "normalAndMild/taken12AllTablet.sql", "ifaDistributonAndConsumption/normalAndMild/received.sql")
    .withSubReportWithDenominator("Adolescents received Albendazol", "normalAndMild/albendazole.sql", "ifaDistributonAndConsumption/normalAndMild/totalNormalAndMild.sql")
    .build();

//IFA distribution & Consumption
const severeAnemiaIronTabletsReport = new ReportBuilder()
    .withName("SevereAnemia")
    .withDirName("ironTablets")
    .withSubReportWithDenominator("Received", "severe/received.sql", "ironTablets/severe/totalNonExitedEnrolledSevere.sql")
    .withSubReportWithDenominator("Consumed", "severe/taken.sql", "ironTablets/severe/received.sql")
    .withSubReportWithDenominator("Albandazole Tablets Received", "severe/albendazole.sql", "ironTablets/severe/totalNonExitedEnrolledSevere.sql")
    .build();

const moderateAnemiaIronTabletsReport = new ReportBuilder()
    .withName("ModerateAnemia")
    .withDirName("ironTablets")
    .withSubReportWithDenominator("Received", "moderate/received.sql", "ironTablets/moderate/totalNonExitedEnrolledModerate.sql")
    .withSubReportWithDenominator("Consumed", "moderate/taken.sql", "ironTablets/moderate/received.sql")
    .withSubReportWithDenominator("Albandazole Tablets Received", "moderate/albendazole.sql", "ironTablets/moderate/totalNonExitedEnrolledModerate.sql")
    .build();

const mildAnemiaIronTabletsReport = new ReportBuilder()
    .withName("MildAnemia")
    .withDirName("ironTablets")
    .withSubReportWithDenominator("Received", "mild/received.sql", "ironTablets/mild/totalNonExitedEnrolledMild.sql")
    .withSubReportWithDenominator("Consumed", "mild/taken.sql", "ironTablets/mild/received.sql")
    .withSubReportWithDenominator("Albandazole Tablets Received", "mild/albendazole.sql", "ironTablets/mild/totalNonExitedEnrolledMild.sql")
    .build();

const normalAnemiaIronTabletsReport = new ReportBuilder()
    .withName("NormalAnemia")
    .withDirName("ironTablets")
    .withSubReportWithDenominator("Received", "normal/received.sql", "ironTablets/normal/totalNonExitedEnrolledNormal.sql")
    .withSubReportWithDenominator("Consumed", "normal/taken.sql", "ironTablets/normal/received.sql")
    .withSubReportWithDenominator("Albandazole Tablets Received", "normal/albendazole.sql", "ironTablets/normal/totalNonExitedEnrolledNormal.sql")
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

//Standard completed before dropping out of school
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
    .withSubReportWithDenominator("Either only mother or father alive", "parentsAlive.sql", "parentsAndStayStatus/totalNonExitedEnrolled.sql")
    .withSubReportWithDenominator("Both parents expired", "parentsExpired.sql", "parentsAndStayStatus/totalNonExitedEnrolled.sql")
    .withSubReportWithDenominator("Staying With Parents", "stayingWithParents.sql", "parentsAndStayStatus/totalNonExitedEnrolled.sql")
    .withSubReportWithDenominator("Staying In Hostel", "stayingInHostel.sql", "parentsAndStayStatus/totalNonExitedEnrolled.sql")
    .withSubReportWithDenominator("Staying With Relatives", "stayingWithRelatives.sql", "parentsAndStayStatus/totalNonExitedEnrolled.sql")
    .build();

//Signs of RTI and Early Pregnancy
const rti = new ReportBuilder()
    .withName("SignsOfRTIAndRiskOfEarlyPregnancy")
    .withDirName("rti")
    .withSubReportWithDenominator("Sexually Active", "sexuallyActive.sql", "rti/totalNonExitedEnrolled.sql")
    .withSubReportWithDenominator("Multiple Partners", "multiplePartners.sql", "rti/sexuallyActive.sql")
    .withSubReportWithDenominator("Unprotected Sex", "unprotectedSex.sql", "rti/sexuallyActive.sql")
    .withSubReportWithDenominator("Burning Micturition", "burningMicturition.sql", "rti/totalNonExitedEnrolled.sql")
    .withSubReportWithDenominator("Ulcer over Genetalia", "ulcer.sql", "rti/totalNonExitedEnrolled.sql")
    .withSubReportWithDenominator("Abnormal discharge from vagina/penis", "abnormalDischarge.sql", "rti/totalNonExitedEnrolled.sql")
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
    .withSubReportWithDenominator('Caste ST', 'casteST.sql', 'common/everyoneEnrolled.sql')
    .withSubReportWithDenominator('Caste SC', 'casteSC.sql', 'common/everyoneEnrolled.sql')
    .withSubReportWithDenominator('Caste OBC', 'casteOBC.sql', 'common/everyoneEnrolled.sql')
    .withSubReportWithDenominator('Caste General', 'casteGeneral.sql', 'common/everyoneEnrolled.sql')

    .withSubReportWithDenominator('Total', 'everyoneEnrolled.sql', 'common/everyoneEnrolled.sql')
    .build();

const age = new ReportBuilder()
    .withName('SocioDemographicsAge')
    .withDirName('age')
    .withSubReportWithDenominator('Age Less Than 10 ', 'ageLessThan10.sql', 'age/totalInProgram.sql')
    .withSubReportWithDenominator('Age From 10 To 13 ', 'ageFrom10To13.sql', 'age/totalInProgram.sql')
    .withSubReportWithDenominator('Age From 14 To 17 ', 'ageFrom14To17.sql', 'age/totalInProgram.sql')
    .withSubReportWithDenominator('Age From 18 To 21 ', 'ageFrom18To21.sql', 'age/totalInProgram.sql')
    .withSubReportWithDenominator('Age Above 21 ', 'ageAbove21.sql', 'age/totalInProgram.sql')
    .withSubReportWithDenominator('Total ', 'totalInProgram.sql', 'age/totalInProgram.sql')

    .build();

const religion = new ReportBuilder()
    .withName('SocioDemographicsReligion')
    .withDirName('religion')
    .withSubReportWithDenominator('Christian', 'christian.sql', 'common/everyoneEnrolled.sql')
    .withSubReportWithDenominator('Hindu', 'hindu.sql', 'common/everyoneEnrolled.sql')
    .withSubReportWithDenominator('Jain', 'jain.sql', 'common/everyoneEnrolled.sql')
    .withSubReportWithDenominator('Muslim', 'muslim.sql', 'common/everyoneEnrolled.sql')
    .withSubReportWithDenominator('Other', 'other.sql', 'common/everyoneEnrolled.sql')
    .withSubReportWithDenominator('Sikh', 'sikh.sql', 'common/everyoneEnrolled.sql')
    .withSubReportWithDenominator('Total', 'everyoneEnrolled.sql', 'common/everyoneEnrolled.sql')
    .build();

const rationCard = new ReportBuilder()
    .withName('SocioDemographicsRationCard')
    .withDirName('rationCard')
    .withSubReportWithDenominator('APL', 'apl.sql', 'rationCard/everyone.sql')
    .withSubReportWithDenominator('BPL', 'bpl.sql', 'rationCard/everyone.sql')
    .withSubReportWithDenominator('Antyodaya', 'antyodaya.sql', 'rationCard/everyone.sql')
    .withSubReportWithDenominator('No', 'no.sql', 'rationCard/everyone.sql')
    .withSubReportWithDenominator('Data Not Available', 'dataNotAvailable.sql', 'rationCard/everyone.sql')
    .withSubReportWithDenominator('Total', 'everyone.sql', 'rationCard/everyone.sql')
    .build();

//Socio Demographic - Standards 8,9,10
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
    .withSubReportWithDenominator("Taking treatment regularly", "takingTreatment.sql", "chronicSickness/totalNonExitedEnrolledChronicSickness.sql")
    .withSubReportWithDenominator("Fever", "fever.sql", "chronicSickness/totalNonExitedEnrolled.sql")
    .withSubReportWithDenominator("Cough-cold", "coughCold.sql", "chronicSickness/totalNonExitedEnrolled.sql")
    .withSubReportWithDenominator("Jaundice", "jaundice.sql", "chronicSickness/totalNonExitedEnrolled.sql")
    .withSubReportWithDenominator("Abdominal pain", "abdominalPain.sql", "chronicSickness/totalNonExitedEnrolled.sql")
    .withSubReportWithDenominator("Diarrhoea", "diarrhoea.sql", "chronicSickness/totalNonExitedEnrolled.sql")
    .withSubReportWithDenominator("Other Sickness", "otherSickness.sql", "chronicSickness/totalNonExitedEnrolled.sql")
    .withSubReportWithDenominator("Hospitalization", "hospitalization.sql", "chronicSickness/totalNonExitedEnrolledChronicSickness.sql")
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
        severeAnemiaIronTabletsReport,
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
        schoolDropoutAndReadmission,
        moderateAnemiaIronTabletsReport,
        mildAnemiaIronTabletsReport,
        normalAnemiaIronTabletsReport,
        severeModerateAnemiaIronTabletsReport,
            normalMildAnemiaIronTabletsReport
    ].map((report) => report.generate());

module.exports = generate;
