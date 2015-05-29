require 'bundler'
Bundler.require

module Sakane

	class Application < Sinatra::Base

    
		# routing!
    get '/' do
      @title = "title check eins zwei"
      @content = "this is a content"
      erb :index
    end
    
     

    get '/about' do
    	@title = "about"
    	@content = "about content"
    	@email = "motoi@nuafk.jp"
    	erb :about
    end
		
	end
end
