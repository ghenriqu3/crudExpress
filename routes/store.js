var express = require('express');
var router = express.Router();
const storeController = require('../controllers/storeController')
const orderController = require('../controllers/orderController')

/* GET stores*/
router.get('/', storeController.getAllstores);
router.get('/:id/:item', storeController.getStoreById);


/* post orders */ 
router.post('/orders/:id', orderController.postOrder);






module.exports = router;
