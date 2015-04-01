var WebSocketServer = require('ws').Server
var http = require('http')
var express = require('express')
var app = express()
var port = process.env.PORT || 5000;


app.use(express.static(__dirname + '/'));
app.use(express.static(__dirname + '/public'));


var server = http.createServer(app);
server.listen(port);
console.log('http server listening on %d', port);

var wss = new WebSocketServer({server: server});
console.log('websocket server created');

wss.on('connection', function(ws)
{
    console.log('websocket connection open');

    var id = setInterval(function()
    {
        ws.send(JSON.stringify(new Date()), function() {  });
    }, 3000);

    ws.on('close', function()
    {
        console.log('websocket connection close');
        clearInterval(id);
    });

    ws.on('message', function(msg)
    {
        console.log('received: ' + msg);
    });
});
