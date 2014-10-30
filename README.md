# README
Easy-express is a light-weigth generator for express app having pre-configured middlewares.
Generated apps support as follow.
- jade template engine
- stylus and coffee-script with [assets-pipeline](https://github.com/adunkman/connect-assets)

Configured directory layout is like this.

    ./--
       |-- views
       |    `-- index.jade
       |-- public
       |    `-- my.js
       `-- asserts
            |-- css
	    `-- js

The main purpose of this module is to prepare how to configure express in ver.4 because I don't remember it :-P.


# Getting Started

    $ mkdir my-app; cd !$
    $ nvm use 0.10
    $ npm install git://github.com/tmtk75/easy-express
    $ ./node_modules/.bin/easy-express-init my-app
    $ npm install
    $ . .env
    $ ./app.coffee
    my-app listening at 3000

As a matter of cause, you can clone this repository and tweak any files.


# Why I need
This is very cheap template but all I want for express.
You know, yaoman is as a famous boilerplate generator, but it's too much for me.

