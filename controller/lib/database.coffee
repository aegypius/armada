{database} = require './config'
levelup         = require 'levelup'
db              = levelup(database.path)

module.exports  = db
