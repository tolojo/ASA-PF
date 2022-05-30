var express = require('express');
var router = express.Router();
var mCid = require("../models/cidadaoModel");

/* GET users listing. */
router.get('/:id', async function(req, res, next) {
    let id = req.params.id;
    let result = await mCid.getCidadaoById(id);
    res.status(result.status).send(result.result);
});

router.post('/login',async function(req, res, next) {
    let cidadao = req.body;
    let result = await mCid.login(cidadao);
    res.status(result.status).send(result.result);
});


module.exports = router;