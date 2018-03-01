const fs = require("fs");
const Mustache = require("mustache");

class Report {
    constructor() {
        this.name = "";
        this.dirName = "";
        this.subReports = [];
    }

    getSQL() {
        const pivotTemplate = fs.readFileSync(["templates", "pivotToGenderAndAddress.mustache"].join("/"), "utf-8");
        let allSubQueries = `${this.subReports.map((subReport) => subReport.getWrappedSQL(this.dirName)).join("\nUNION ALL\n")}`;
        return Mustache.render(pivotTemplate, {
            allSubQueries: allSubQueries.replace(/'/g, "''")
        });
    }

}

module.exports = Report;