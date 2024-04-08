var express = require('express');
var router = express.Router();
const USER = require('../model/user')
const bcrypt = require('bcryptjs')

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'Express' });
});

router.get('/add',(req,res) => {
  res.render('index')
})

router.post('/add', async (req,res) => {

  req.body.password = await bcrypt.hash(req.body.password,7)

  await USER.create(req.body)

  res.redirect('/')

})

router.get('/login',(req,res) => {
  res.render('login')
})

router.post('/login', async (req,res) => {

  const data = await USER.findOne({email:req.body.email})

  if(!data)
  {
   return res.send("plase enter valid email")
  }

  const checkpass = await bcrypt.compare(req.body.password,data.password)

  if(!checkpass)
  {
    return res.send("plase enter valid password")
  }else
  {
    return res.send("user login successfully")
  }
})

module.exports = router;
