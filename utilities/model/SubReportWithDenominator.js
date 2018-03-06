const fs = require("fs");
const _ = require("lodash");
const SubReport = require("./SubReport");
const Mustache = require("mustache");

class SubReportWithDenominator extends SubReport {
    constructor(name, fileName, denominatorFileName) {
        super(name, fileName);
        this.templateFileName = "frequencyAndPercentageWithDenominator.mustache";
        this.denominatorFileName = denominatorFileName;
    }

    getDenominatorQuerySQL(reportName) {
        switch (fs.existsSync(['baseSQL', 'common', this.denominatorFileName].join('/'))) {
            case true:
                return fs.readFileSync(['baseSQL', 'common', this.denominatorFileName].join('/'), 'utf-8');
            case false:
                return fs.readFileSync(['baseSQL', reportName, this.denominatorFileName].join('/'), 'utf-8');
        }
    }

    getWrappedSQL(reportName) {
        return Mustache.render(this._getTemplate(), {
            subreportName: this.name,
            mainQuery: this.getQuerySQL(reportName).replace(/'/g, "''"),
            denominatorQuery: this.getDenominatorQuerySQL(reportName).replace(/'/g, "''")
        });
    }
}

module.exports = SubReportWithDenominator;