unless process.env.NODE_ENV is 'production'
  (require 'dotenv').load()

path = require 'path'

module.exports = config =
  DATABASE_PATH: process.env.DATABASE_PATH or path.join __dirname, '..',  'data'
