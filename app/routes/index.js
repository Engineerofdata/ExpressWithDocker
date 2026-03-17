var express = require('express');
var router = express.Router();



/* GET home page. */
router.get('/', function(req, res, next) {
  
  try{

    //Get the database connection from the app
    const db = req.app.get('db');
    const statment = db.prepare('SELECT * FROM accounts');
    const accounts = statment.all();

    res.render('index', { title: 'Show Accounts', accounts: accounts });



  }catch(err){
    console.error(err);
  }


});

module.exports = router;
