Code in this repo is used to generate reports for Adolescent program. 

### If you are looking for the Avni hosted service's reporting login page, you will find links at https://app.avniproject.org. 

In these reports we need things like pivoting based on address type and gender. We also have a concept of denominator and numerator in these reports. E.g. We want to see how many girls have started Menstruation and also want to know what percentage it is of total enrolments. For this we use two different queries and pass them to a function named frequency_and_percentage which does the calculation and returns percentage and numbers and also aggregates them by gender and address type. Look at https://reporting.openchs.org/question/85 for an example report.

Reports are defined in `utilities/generate.js`. We use builder pattern to build reports based on different queries. Existing reports can be used as a reference point to create a new report.

Starting point to generate this reports is `utilities/index.js`. You can run this script by doing `node index.js`.

### Some weird things:

- There are two custom operators we are using named q1 and q4 in some sql queries.  We replace q1 with one single quote and q4 with four single quotes in generated queries. This is weird but needed in some metabase queries using filters. We replace literal single quotes found in our queries to with two single quotes for escaping because our queries are wrapped in crosstab and frequency_and_percentage functions as string. q1 and q4 is useful when we don't want our single quotes to get replaced by two single quotes. These are used in reports in metabase that needs filters.
