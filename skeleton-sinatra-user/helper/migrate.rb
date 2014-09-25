require 'sinatra/base'
require 'active_record'
require './model/report'

class InitialSchema < ActiveRecord::Migration
  def self.up
    create_table :reports do |t|
      t.string :name
      t.string :uid
      t.string :report
      t.timestamp :timestamp
    end
  end

  def self.down
    drop_table :users
    drop_table :report
    drop_table :reports
  end
end


module Sinatra
	
	module MigrateHelper
		def migrate
			

			# マイグレーション
			InitialSchema.migrate(:up)
		end
		
		def post
			Report.create(
			name:'myname',
			uid:'123123123',
			report:'dnfksjndfkjn sdkfskldjfl sdfml',
			timestamp: Time.now)
		end
	end
	
	helpers MigrateHelper
end