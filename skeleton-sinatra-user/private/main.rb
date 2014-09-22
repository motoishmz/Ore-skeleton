# gems
require 'sinatra'
require 'sinatra/reloader'
require 'omniauth-twitter'
require 'active_record'

# model
require './model/report'

# helpers
require './private/apikey'


get '/' do
		# Report.create(name:'myname', uid:'123123123', report:'dnfksjndfkjn sdkfskldjfl sdfml')
		# Reports = Report.all
  '<a href="/login">login</a>'
end




configure do
  enable :sessions

  use OmniAuth::Builder do
    provider :twitter, YOUR_KEY, YOUR_SECRET
  end
end

helpers do
  # define a current_user method, so we can be sure if an user is authenticated
  def current_user
    !session[:uid].nil?
  end
end

before do
  # we do not want to redirect to twitter when the path info starts
  # with /auth/
  pass if request.path_info =~ /^\/auth\//
  pass if request.path_info =~ /^\/$/

  # /auth/twitter is captured by omniauth:
  # when the path info matches /auth/twitter, omniauth will redirect to twitter
  redirect to('/auth/twitter') unless current_user
end



# ･゜･*:.｡..:*･'｡. .｡.:*･゜･*
# Twitter
get '/auth/twitter/callback' do
  # probably you will need to create a user in the database too...
  session[:uid] = env['omniauth.auth']['uid']
  # this is the main endpoint to your application
  redirect to('/hello')
end

# ･゜･*:.｡..:*･'｡. .｡.:*･゜･*
# authorization
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

get '/hello' do
  'Hello omniauth-twitter!<br><a href="/logout">logout</a>'
end





get '/admin/migrate' do
  migrate
end