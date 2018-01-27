const mustache = require('mustache');

let replacements = new Map();
replacements.set('&#x3D;', '=');
replacements.set('&#39;', '\'');

let render = function(template, data) {
    let sql = mustache.render(template, data);
    replacements.forEach((value, key) => {
        sql = sql.split(key).join(value);
    });
    return sql;
};

module.exports = {
    render: render
};
