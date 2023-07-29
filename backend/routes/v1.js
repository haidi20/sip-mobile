const ProductController = require("../controllers/ProductController");

const express = require('express');
const router = express.Router();

router.get('/', (req, res) => {
  res.json({ message: 'Welcome to API version 1' });
});

router.get('/products',
  (req, res) => ProductController.fetchData(req, res));

module.exports = router;