var express = require('express');
var router = express.Router();
var mAlert = require("../models/alertaModel");

/* GET users listing. */
router.get('/', async function(req, res, next) {
    let result = await mAlert.getAlertas();
    res.status(result.status).send(result.result);
});

router.get('/:id', async function(req, res, next) {
    id = req.params.id;
    let result = await mAlert.getAlertaById(id);
    res.status(result.status).send(result.result);
});

module.exports = router;