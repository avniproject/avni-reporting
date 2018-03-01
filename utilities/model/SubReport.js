const fs = require("fs");
const _ = require("lodash");
const Mustache = require("mustache");

class SubReport {
    constructor(name, fileName) {
        this.name = name;
        this.fileName = fileName;
        this.templateFileName = "frequencyAndPercentage.mustache";
    }

    getQuerySQL(reportName) {
        return fs.readFileSync(['baseSQL', reportName, this.fileName].join('/'), 'utf-8');
    }

    _getTemplate() {
        return fs.readFileSync(['templates', this.templateFileName].join('/'), 'utf-8');
    }

    getWrappedSQL(reportName) {
        return Mustache.render(this._getTemplate(), {
            subreportName: this.name,
            mainQuery: this.getQuerySQL(reportName).replace(/'/g, "''")
        });
    }
}

module.exports = SubReport;