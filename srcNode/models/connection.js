var pg = require('pg');

const connectionString = "postgres://postgres:jpmptr0508@localhost:5432/ASA"

const Pool = pg.Pool
const pool = new Pool({
    connectionString,
    max: 20
    
})

module.exports = pool;