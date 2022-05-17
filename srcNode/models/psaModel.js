var pool = require("./connection");

module.exports.getPSAs = async function () {
    try {
        let sql = "select tc_nome,caracteristicas_caracteristica,psa_nome_provisorio from caracteristicas_psa inner join psa p on p.psa_id = caracteristicas_psa.caracteristicas_psa_psa_id inner join caracteristicas c on c.caracteristicas_id = caracteristicas_psa.caracteristicas_psa_caracteristicas_id inner join tipo_caracteristicas tc on tc.tc_id = c.caracteristicas_tc_id";
        let result = await pool.query(sql);
        let PSAs = result.rows;
        return {
            status: 200,
            result: PSAs
        };
    } catch (err) {
        console.log(err);
        return {
            status: 500,
            result: err
        };
    }
}


module.exports.getPSA = async function (id) {
    try {
        let sql = "select tc_nome,caracteristicas_caracteristica,psa_nome_provisorio from caracteristicas_psa inner join psa p on p.psa_id = caracteristicas_psa.caracteristicas_psa_psa_id inner join caracteristicas c on c.caracteristicas_id = caracteristicas_psa.caracteristicas_psa_caracteristicas_id inner join tipo_caracteristicas tc on tc.tc_id = c.caracteristicas_tc_id where caracteristicas_psa_psa_id=$1";
        let result = await pool.query(sql,[id]);
        let PSA = result.rows;
        return {
            status: 200,
            result: PSA
        };
    } catch (err) {
        console.log(err);
        return {
            status: 500,
            result: err
        };
    }
}



module.exports.regNomePSA = async function (nome) {
    try {
        let sql = "$insert into psa(psa_nome_provisorio) values ($1)";
        let result = await pool.query(sql,[nome]);
        let PSA = result.rows;
        return {
            status: 200,
            result: PSA
        };
    } catch (err) {
        console.log(err);
        return {
            status: 500,
            result: err
        };
    }
}


module.exports.getPSACarac = async function () {
    try {
        let sql = "select tc_nome,caracteristicas_caracteristica from caracteristicas inner join tipo_caracteristicas tc on tc.tc_id = caracteristicas.caracteristicas_tc_id";
        let result = await pool.query(sql);
        let PSA = result.rows;
        return {
            status: 200,
            result: PSA
        };
    } catch (err) {
        console.log(err);
        return {
            status: 500,
            result: err
        };
    }
}



module.exports.regPSA = async function (PSA) {
    try {
        
        let sql = "insert into caracteristicas_psa(caracteristicas_psa_caracteristicas_id, caracteristicas_psa_psa_id) VALUES ($1,$2)";
        let result = await pool.query(sql,[PSA.caracteristicas_psa_caracteristicas_id,PSA.caracteristicas_psa_psa_id]);
        let PSA = result.rows;
        return {
            status: 200,
            result: PSA
        };
    } catch (err) {
        console.log(err);
        return {
            status: 500,
            result: err
        };
    }
}
