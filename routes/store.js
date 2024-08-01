var express = require('express');
var router = express.Router();
const storeController = require('../controllers/storeController')

/* GET users listing. */
router.get('/', storeController.getAllstores);
router.get('/:id', storeController.getStoreById);






module.exports = router;
