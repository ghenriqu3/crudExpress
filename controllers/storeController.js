const Store = require('../models/store')

const getAllstores = async (request, response) => {
    const stores = await Store.getAll()
    response.json(stores)
}

const getStoreById = async (request, response) => {
    const storeId = parseInt(request.params.id)
    const stores = await Store.getStore(storeId)
    response.json(stores)
}

module.exports = {
    getAllstores,
    getStoreById,
}