{DATABASE_PATH} = require './config'
levelup         = require 'levelup'
db              = levelup(DATABASE_PATH)

module.exports  = db
