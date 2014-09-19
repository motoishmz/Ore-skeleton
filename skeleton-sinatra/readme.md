## setup

**src**: `/user/motoishmz/sinatra-src` <-- must include `public` dir  
**public**: `/var/www/example.com/public/myservice`   

	$ vi /etc/httpd/conf.d/passenger.conf
		RackBaseURI /myservice
		
	$ ln -s \
	  /user/motoishmz/sinatra-src/public \
	  /var/www/example.com/public/myservice

## note
- If you have `always_restart.txt` in the `tmp` dir, our app always reload restart when it receives a request.