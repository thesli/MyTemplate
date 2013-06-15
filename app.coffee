express = require("express")
app = express()
io = require("socket.io").listen(app)
swig = require("swig")
cons = require("consolidate")
redis = require("redis")

app.listen(80)

app.configure(
	()->
		app.set("title","Really")
		app.engine(".html",cons.swig)
		app.set("view engine","html")
		app.use("/css",express.static(__dirname+"/css"))
		app.use("/js",express.static(__dirname+"/js"))
		)
swig.init(
	"allowError" : false
	"autoescape" : true
	"cache" : true
	"encoding" : "utf8"
	"filters" : {}
	"root" : "/"
	"tags" : {}
	"extensions" : {}
	"tzOffset" : 0
	)

io.socket.on(
	"connection"
	(socket)->
		socket.emit(
			"news"
			"new" : "NO NEWS IS GOOD NEWS"
			)
	)