addEventListener("message", function(event){
	
    postMessage("the worker received: " + event.data);

}, false);