#!/usr/bin/env bash
mkdir -p views
mkdir -p public
mkdir -p assets/js
mkdir -p assets/css

home=${0%/*}/../easy-express

cp -fr $home/views/* views
cp -fr $home/public/* public
cp -fr $home/assets/* assets

cat<<EOF > package.json
{
  "name": "foobar",
  "version": "0.1.0",
  "dependencies": {
    "coffee-script": "*"
  }
}
EOF

cat<<EOF > .gitignore
.*.swp
node_modules
EOF

cat<<EOF > .env
nvm use 0.10
PATH=./node_modules/.bin:$PATH
EOF

cat<<EOF > index.coffee
#!/usr/bin/env coffee
easy = require("easy-express")(__dirname)

easy.jade.filters.some = (block, args)->
  "#{block}, #{args.type}"

easy.app.get "/", (req, res)->
  req.session.username = "John Doe"
  res.render "index"

easy.listen -> console.log "easy-express listening at " + easy.app.get("port")
EOF
chmod +x index.coffee

