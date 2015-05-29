
# ゼロから

	$ bundle init
	
	# gemfileに適当に追加
	
	$ bundle install --path vendor/bundle
	
## app.rb
	require 'bundler'
	Bundler.require


	module Sakane

		class Application < Sinatra::Base
	    
			# routing!
			get '/' do
				footages = Sakane::Footage.all
				erb :list, :locals => {:footages => footages}
			end
		end
	end

	
## config.ru
	require './app'
	run Sakane::Application


## .gitignore
	.DS_Store
	db/database.yml

	*.rbc
	capybara-*.html
	.rspec
	log
	tmp
	db/*.sqlite3
	db/*.sqlite3-journal
	public/system
	coverage/
	spec/tmp
	**.orig
	rerun.txt
	pickle-email-*.html

	# TODO Comment out these rules if you are OK with secrets being uploaded to the repo
	config/initializers/secret_token.rb
	config/secrets.yml

	## Environment normalisation:
	.bundle
	vendor/bundle

	# these should all be checked in to normalise the environment:
	# Gemfile.lock, .ruby-version, .ruby-gemset

	# unless supporting rvm < 1.11.0 or doing something fancy, ignore this:
	.rvmrc

	# if using bower-rails ignore default bower_components path bower.json files
	vendor/assets/bower_components
	*.bowerrc
	bower.json

	# Ignore pow environment settings
	.powenv
	
## views
適当に追加

## 実行
bundle exec rackup