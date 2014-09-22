require 'sinatra/base'

module Sinatra
	
	module AppHelper
		def current_user
			!session[:uid].nil?
		end
	end
	
	helpers AppHelper
end