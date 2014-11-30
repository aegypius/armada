express    = require "express"
bodyParser = require "body-parser"
morgan     = require "morgan"
oauth2     = require "oauth2-server"
routes     = require "./routes"
app        = express()

app.use morgan('short')
app.use bodyParser.json()
app.use bodyParser.urlencoded { extended: true }

app.oauth2 = oauth2 {
  model: require "./models/oauth2.coffee"
  debug: true
  passthroughErrors: true
  grants: [
    "password"
    "refresh_token"
    "client_credential"
  ]
}

app.all "/oauth2/token", app.oauth2.grant()
app.use "/api", app.oauth2.authorise(), routes.api
app.get '/', (req, res)->
  res.send "Hello World"

app.use app.oauth2.errorHandler()

# Handles Non-Grant OAuth2 Errors
app.use (err, req, res, next)->
  next() unless err.name is 'OAuth2Error'
  res.status 401
  res.send {
    status: "failure"
    code:   err.code
    error:  err.message
  }

module.exports = app
