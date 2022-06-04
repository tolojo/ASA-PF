var pool = require("./connection");

module.exports.getPSAs = async function () {
    try {
        let sql = "select psa_nome_provisorio, psa_id from psa";
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
        let result = await pool.query(sql, [id]);
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

module.exports.regNomePSA = async function (psa) {
    try {
        console.log(psa.name);
        var nomePSA = psa.name

        let sql = "insert into psa(psa_nome_provisorio) values ($1)";
        let result = await pool.query(sql, [nomePSA]);
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
        let sql = "select caracteristicas_caracteristica from caracteristicas inner join tipo_caracteristicas tc on tc.tc_id = caracteristicas.caracteristicas_tc_id";
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
    console.log(PSA);
    try {
        let sql = "select max(psa_id) from psa";
        let result = await pool.query(sql, []);
        let PSAid = result.rows[0];
        console.log(PSA);
        let caracs;
        for (i = 0; i < PSA.length; i++) {
            let carac = PSA[i];
            console.log(carac);
            let sql = "insert into caracteristicas_psa(caracteristicas_psa_caracteristicas_id, caracteristicas_psa_psa_id) VALUES ($1,$2)";
            let result = await pool.query(sql, [carac, PSAid.max]);
            caracs = result.rows;
        }
        return {
            status: 200,
            result: caracs
        };
    } catch (err) {
        console.log(err);
        return {
            status: 500,
            result: err
        };
    }
}

module.exports.getPSAByName = async function (nome) {
    console.log(nome);
    try {
        let sql = "select psa_id, psa_nome_provisorio from psa WHERE psa_nome_provisorio LIKE '%"+nome+"%'";
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

module.exports.getPSAByAlertId = async function (id) {
    try {
        let sql = "select caracteristicas_caracteristica,tc_nome, psa_nome_provisorio from caracteristicas inner join tipo_caracteristicas tc on tc.tc_id = caracteristicas.caracteristicas_tc_id inner join caracteristicas_psa cp on caracteristicas.caracteristicas_id = cp.caracteristicas_psa_caracteristicas_id inner join psa p on cp.caracteristicas_psa_psa_id = p.psa_id inner join psa_alerta pa on p.psa_id = pa.psa_alerta_psa_id where psa_alerta_alerta_id = $1";
        let result = await pool.query(sql,[id]);
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