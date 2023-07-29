const moment = require('moment');

exports.fetchData = (req, res, params) => {
    const data = [{
        id: 1,
        name: "Sayur",
    }];

    res.json({ data });
}
