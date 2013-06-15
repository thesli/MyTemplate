// Generated by CoffeeScript 1.6.3
(function() {
  var app, cons, express, io, redis, swig;

  express = require("express");

  app = express();

  io = require("socket.io").listen(app);

  swig = require("swig");

  cons = require("consolidate");

  redis = require("redis");

  app.listen(80);

  app.configure(function() {
    app.set("title", "Really");
    app.engine(".html", cons.swig);
    app.set("view engine", "html");
    app.use("/css", express["static"](__dirname + "/css"));
    return app.use("/js", express["static"](__dirname + "/js"));
  });

  swig.init({
    "allowError": false,
    "autoescape": true,
    "cache": true,
    "encoding": "utf8",
    "filters": {},
    "root": "/",
    "tags": {},
    "extensions": {},
    "tzOffset": 0
  });

  io.socket.on("connection", function(socket) {
    return socket.emit("news", {
      "new": "NO NEWS IS GOOD NEWS"
    });
  });

}).call(this);