const Order = require('../models/order')

const postOrder = async (request, response) => {
    const orders = await Order.createOrder()
    response.json(orders)
    // response.json('ok')
}

module.exports = {
    postOrder
}