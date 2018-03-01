const Report = require('../model/Report');
const SubReport = require('../model/SubReport');
const SubReportWithDenominator = require('../model/SubReportWithDenominator');

class ReportBuilder {
    constructor() {
        this.report = new Report();
    }

    withName(name) {
        this.report.name = name;
        return this;
    }

    withDirName(dirName) {
        this.report.dirName = dirName;
        return this;
    }

    withSubReportWithDenominator(name, fileName, denominatorFileName) {
        const subReport = new SubReportWithDenominator(name, fileName, denominatorFileName);
        this.report.subReports.push(subReport);
        return this;
    }

    withSubReport(name, fileName) {
        const subReport = new SubReport(name, fileName);
        this.report.subReports.push(subReport);
        return this;
    }

    build() {
        return this.report;
    }
}

module.exports = ReportBuilder;