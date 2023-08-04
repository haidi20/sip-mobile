const moment = require('moment');

exports.fetchData = (req, res, params) => {
    const data = [
        {
            id: 1,
            name: "Beras",
            price: "10K",
            img_url: "https://images.unsplash.com/photo-1587334207407-deb137a955ba?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=880&q=80"
        },
        {
            id: 2,
            name: "Ubi Ungu",
            price: "20K",
            img_url: "https://images.unsplash.com/photo-1587334207407-deb137a955ba?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=880&q=80"
        },
    ];

    res.json({ success: true, data });
}
