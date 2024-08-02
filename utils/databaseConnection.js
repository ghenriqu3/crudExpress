const mysql = require('mysql2/promise')

const databaseConnection = async () => {
    return await mysql.createConnection({
        host: 'localhost',
        user: 'root',
        password: 'root',
        database: 'ifome',
        port: '3307'
    })
    
}

module.exports = {
    databaseConnection,
}