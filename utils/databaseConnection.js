const mysql = require('mysql2/promise')

const databaseConnection = async () => {
    return await mysql.createConnection({
        host: 'localhost',
        user: 'root',
        password: '1234',
        database: 'ifome',
    })
    
}

module.exports = {
    databaseConnection,
}