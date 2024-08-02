const { databaseConnection } = require('../utils/databaseConnection')


const createOrder = async (order) =>{
    const connection = await databaseConnection();
    // console.log(order)
    
    const result = await connection.query()
    return result
}

module.exports = {
    createOrder,
}