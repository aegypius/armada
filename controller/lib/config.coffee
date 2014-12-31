unless process.env.NODE_ENV is 'production'
  (require 'dotenv').load()

path = require 'path'

module.exports = config =
  # Database configuration
  database: {
    path: process.env.DATABASE_PATH or path.join __dirname, '..',  'data'
  }

  # Docker configuration
  docker: {
    host:  process.env.DOCKER_HOST  or "/var/run/docker.sock"
    image: process.env.DOCKER_IMAGE or "aegypius/armada"
  }
