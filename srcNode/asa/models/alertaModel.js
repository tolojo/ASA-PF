var pool = require("./connection");

module.exports.getAlertas = async function () {
    try {
        let sql = "Select * from alerta";
        let result = await pool.query(sql);
        let alertas = result.rows;
        return {
            status: 200,
            result: alertas
        };
    } catch (err) {
        console.log(err);
        return {
            status: 500,
            result: err
        };
    }
}

module.exports.getAlertaById = async function (id) {
    try {
        let sql = "Select * from alerta where alerta_id = $1";
        let result = await pool.query(sql,[id]);
        let alerta = result.rows[0];
        return {
            status: 200,
            result: alerta
        };
    } catch (err) {
        console.log(err);
        return {
            status: 500,
            result: err
        };
    }
}