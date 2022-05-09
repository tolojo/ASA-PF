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