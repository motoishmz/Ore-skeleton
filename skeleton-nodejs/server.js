var http = require('http'),
	fs = require('fs'),
	ejs = require('ejs');
var settings = require('./settings');
var server = http.createServer();
var templates = fs.readFileSync(__dirname + '/public_html/hello.ejs', 'utf-8');

var n = 0;

server.on('request', function(req, res)
{
	var data = ejs.render(templates, {
			title: "hi",
			content: "<strong></strong>",
			n: ++n
		});

	res.writeHead(200, {'Content-Type': 'text/html'});
	res.write(data);
	res.end();
});

server.listen(settings.port, settings.host);
console.log('lostening..');