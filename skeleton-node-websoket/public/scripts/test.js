

(function()
{
    var $text = $("#text");
    var $trigger = $("#trigger");
    var $console = $("#console");

    var isWsAvailable = function() {
        return location.protocol != "file:";
    }

    $trigger.bind("click", function()
    {
        var text = $text.get(0).value;

        if (text == "")
            return;

        var message = JSON.stringify({
            "text": text,
            "timestamp": new Date()
        });

        if (isWsAvailable())
            ws.send( message );

        $console.html(message);
    });


    if (isWsAvailable())
    {
        var host = location.origin.replace(/^http/, 'ws')
        var ws = new WebSocket(host);
        var $ping = $('#pings').get(0);

        ws.onmessage = function (event) {

            if ($ping.childNodes.length == 10)
                $('li', $ping).remove();

            var li = document.createElement('li');
            li.innerHTML = JSON.parse(event.data);
            document.querySelector('#pings').appendChild(li);
        };
    }
})();
