module.exports =
  getAccessToken: (bearerToken, callback)->
    token = "test token"
    callback false, token

  getClient: (clientId, clientSecret, callback)->
    client =
      clientId:     "test clientId"
      clientSecret: "test clientSecret"
    callback false, client

  grantTypeAllowed: (clientId, grantType, callback)->
    callback false, true

  saveAccessToken: (token, clientId, expires, userId, callback)->
    callback false, true

  getUser: (username, password, callback)->
    callback false, "test user"

  saveRefreshToken: (token, clientId, expires, userId, callback)->
    callback false, true

  getUserFromClient: (clientId, clientSecret, callback)->
    callback false, 'test user'
