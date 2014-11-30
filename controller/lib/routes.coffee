{Router} = require "express"

module.exports =
  api: ->
    router = new Router
    router.get '/', ->
      "Hello World"
