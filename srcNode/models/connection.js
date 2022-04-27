var pg = require('pg');

const connectionString = "postgres://qgdztskwskqsnf:c8f2e5c9469627648df673e388c231fa8d02d2e91b8e97730f111877b798d3c9@ec2-63-32-248-14.eu-west-1.compute.amazonaws.com:5432/dev63vgku6a0rm"

const Pool = pg.Pool
const pool = new Pool({
    connectionString,
    max: 20
    
})

module.exports = pool;