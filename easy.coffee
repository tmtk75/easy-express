express        = require "express"
jade           = require "jade"
assets         = require "connect-assets"
bodyParser     = require 'body-parser'
methodOverride = require 'method-override'
logger         = require "morgan"
cookieParser   = require "cookie-parser"
cookieSession  = require "cookie-session"
serveFavicon   = require "serve-favicon"
path           = require "path"
http           = require "http"
#session        = require 'express-session'
#MemoryStore    = require('express-session').MemoryStore
#log4js         = require "log4js"

module.exports = (dir)->
  app = express()
  app.set 'port', (process.env.PORT || 3000)
  app.set "views", path.join(dir, 'views')
  app.set "view engine", "jade"
  app.use bodyParser.json()
  app.use bodyParser.urlencoded extended: true
  app.use methodOverride()
  #app.use express.query()
  app.use cookieParser()
  app.use cookieSession keys: ['adf19dfe1a4bbdd949326870e3997d799b758b9b']
  app.use logger 'dev'
  #app.use session store: new MemoryStore(reapInterval: 5 * 60 * 1000), secret: 'abracadabra', resave: true, saveUninitialized: true
  app.use require "./locals"
  app.use assets()
  app.use '/public', express.static path.join(dir, "public")
  app.use require "./text"
  #app.use serveFavicon()

  listen = (cb)-> http.createServer(app).listen app.get("port"), cb
  app:app, listen:listen, jade:jade
