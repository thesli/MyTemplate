socket = io.connect("http://localhost:3333")
socket.on(
	"news"
	(data)->
		console.log(data)
	socket.emit(
		"return msg"
		"Hello" : "World"
		"I am" : "the user"
		)
	)