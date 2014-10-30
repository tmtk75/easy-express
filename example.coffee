#!/usr/bin/env coffee
easy = require("./init")(__dirname)

easy.jade.filters.some = (block, args)->
  "#{block}, #{args.type}"

easy.app.get "/", (req, res)->
  req.session.username = "John Doe"
  res.render "index"

easy.listen -> console.log "Express server listening on port " + easy.app.get("port")

