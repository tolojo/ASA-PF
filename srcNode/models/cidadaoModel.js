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

module.exports.login = async function (cidadao) {
    try {
        let sql = "Select * from cidadao where cidadao_email = $1 and cidadao_password = $2";
        let result = await pool.query(sql, [cidadao.email, cidadao.password]);
        if (result.rows.length > 0)
            return {
                status: 200,
                result: result.rows[0]
            };
        else return {
            status: 401,
            result: {
                msg: "Email ou password incorreta"
            }
        };
    } catch (err) {
        console.log(err);
        return {
            status: 500,
            result: err
        };
    }
}
