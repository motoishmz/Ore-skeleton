# rubygems
require 'sinatra'
require 'sinatra/reloader'
require 'omniauth-twitter'
require 'active_record'

# model
require './model/report'

# helpers
require './helper/migrate'
require './helper/general'

# ...
require './private/apikey'

class MyApp < Sinatra::Base
	
	configure do
	  enable :sessions
		set :environment, :production
	
	  use OmniAuth::Builder do
	    provider :twitter, YOUR_KEY, YOUR_SECRET
	  end
	end
	
	helpers Sinatra::AppHelper
	helpers Sinatra::MigrateHelper
	
	before do
	  pass if request.path_info =~ /^\/auth\//
	  pass if request.path_info =~ /^\/$/
	  redirect to('/auth/twitter') unless current_user
	end

	get '/' do
			# Report.create(name:'myname', uid:'123123123', report:'dnfksjndfkjn sdkfskldjfl sdfml')
			# Reports = Report.all
	  '<a href="/login">login</a>'
	end
	
	get '/auth/twitter/callback' do
	  # probably you will need to create a user in the database too...
	  session[:uid] = env['omniauth.auth']['uid']
	  # this is the main endpoint to your application
	  redirect to('/home')
	end

	get '/auth/failure' do
	  # omniauth redirects to /auth/failure when it encounters a problem
	  # so you can implement this as you please
	end

	get '/login' do

	end

	get '/logout' do
	  session[:uid] = nil
	  redirect to('/')
	end

	get '/home' do
		migrate
	  # 'Hello omniauth-twitter!<br><a href="/logout">logout</a>'
	end
end


MyApp.run!