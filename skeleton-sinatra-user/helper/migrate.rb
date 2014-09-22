require 'sinatra/base'

module Sinatra
	
	module MigrateHelper
		def migrate
			'yo'
		end
	end
	
	helpers MigrateHelper
end