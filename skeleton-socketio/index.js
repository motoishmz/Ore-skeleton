var express = require('express');
var app = express();
var http = require('http').Server(app);
var io = require('socket.io')(http);

app.use(express.static(__dirname + '/public'));

app.get('/', function(req, res){
  res.sendfile('public/index.html');
});

http.listen(3000, function(){
  console.log('listening on *:3000');
});

io.on('connection', function(socket){
  console.log('a user connected');

	var stdint = setInterval(function(){
    	io.emit('chat message', "test");
	}, 1000);
	
  socket.on('disconnect', function(){
    console.log('user disconnected');
	clearInterval(stdint)
	stdint = null;
  });

  socket.on('chat message', function(msg){
    console.log('message: ' + msg);
  });

});
