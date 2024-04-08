const mongoose = require('mongoose')
const Schema = mongoose.Schema

const user = new Schema({
    name:String,
    email:{
     type:String,
     unique:true
    },
    password:String
})

const USER = mongoose.model('user',user)

module.exports = USER