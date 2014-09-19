// console.log(1123);

//! non-blocking
//! 時間がかかりそうな処理はresponseを止めてしまうのでnon-blockingで
/*
setTimeout(function()
{
	console.log("hello");
}, 1000);

console.log("world");
*/

//! blocking
/*
var start  = new Date().getTime();
while (new Date().getTime() < start + 1000) {}
console.log(12);
*/

var http = require('http'),
	fs = require('fs'),
	ejs = require('ejs');
var server = http.createServer();

server.on('request', function(req, res)
{
	res.writeHead(200, {'Content-Type': 'text/html'});
	res.write(req.url);
	res.end();
});

server.listen(8000, "localhost");
console.log('lostening..');