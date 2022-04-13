var pool = require("./connection");

module.exports.getCidadaoById = async function (id) {
    try {
        let sql = "Select * from cidadao where cidadao_id = $1";
        let result = await pool.query(sql, [id]);
        let cidadao = result.rows[0];
        return {
            status: 200,
            result: cidadao
        };
    } catch (err) {
        console.log(err);
        return {
            status: 500,
            result: err
        };
    }
}