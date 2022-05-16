var express = require('express');
var router = express.Router();
var mPSA = require("../models/psaModel");

router.get('/', async function(req, res, next) {
    let result = await mPSA.getPSAs();
    res.status(result.status).send(result.result);
});

router.get('/:id', async function(req, res, next) {
    id = req.params.id;
    let result = await mPSA.getPSA(id);
    res.status(result.status).send(result.result);
});

router.post('/savePsaName', async function(req,res,next) {
    let psa = req.body;
    let result = await mPSA.regNomePSA(psa);
    res.status(result.status).send(result.result);

    
})

router.get('/getCarac', async function(req, res, next) {
    let result = await mPSA.getPSACarac();
    res.status(result.status).send(result.result);
});

router.post('/savePsa', async function(req,res,next) {
    let psa = req.body;
    let result = await mPSA.regNomePSA(psa);
    res.status(result.status).send(result.result);

    
})





module.exports = router;