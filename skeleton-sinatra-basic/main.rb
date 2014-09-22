require 'sinatra'
# require 'sinatra/reloader'


# ･゜･*:.｡..:*･'｡. .｡.:*･゜･*
before do
	@author = "motoishmz"
	@sitename = "Sinatra skeleton"
end

before '/admin/*' do
	@msg = "admin area!"
end

after do
	logger.info "page displayed successfully"
end


# ･゜･*:.｡..:*･'｡. .｡.:*･゜･*

helpers do
		def strong(s)
			"<strong>#{s}</strong>"
		end
end 


# ･゜･*:.｡..:*･'｡. .｡.:*･゜･*
get '/' do
	@title = "title check eins zwei"
	@content = "this is a content by " + strong(@author)
	erb :index
end

get '/about' do
	@title = "about"
	@content = "about content " + strong(@author)
	@email = "motoi@nuafk.jp"
	erb :about
end



# ･゜･*:.｡..:*･'｡. .｡.:*･゜･*
get '/hello/:name' do |n|
	"hello #{n}"
	erb :index
end

get '/hello/:name/:index' do |n, i|
	"hello #{n} #{i}"
	erb :index
end

get '/from/*/to/*' do |f, t|
	"from #{f} to #{t}"
	erb :index
end

get %r{/userid/([0-9]*)} do |i|
	"userid = #{i}"
	erb :index
end