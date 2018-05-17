var express = require('express');
var router = express.Router();
const axios = require('axios');

/* GET users listing. */
router.get('/', function (req, res, next) {
  res.send('respond with a resource');
});

router.get('/test', async function (req, res, next) {
  const res2 = await axios('https://api.ipify.org/?format=json');
  res.send(res2.data);
});

router.get('/test2', async function (req, res, next) {
  const res2 = await axios('https://api.ipify.org/?format=json');
  res.send(res2.data);
});

module.exports = router;