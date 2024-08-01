const { databaseConnection } = require('../utils/databaseConnection')

const getAll = async () => {
    const connection = await databaseConnection();
    const [ result ] = await connection.query('select * from store')
    return result
}

const getStore = async (id) => {
    const connection = await databaseConnection(); 
    const [ result ] = await connection.query('select * from store where id = ' + id)
    return result
}

module.exports ={
    getAll,
    getStore,
}