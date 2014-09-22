require "active_record"

do_migration = false

if do_migration then
	# データベースへの接続
	ActiveRecord::Base.establish_connection(
	  adapter:   'sqlite3',
	  database:  'db/test.sqlite'
	)

	# スキーマの設定
	class InitialSchema < ActiveRecord::Migration
	  def self.up
	    create_table :reports do |t|
				# binary
				# boolean
				# date
				# datetime
				# decimal
				# float
				# integer
				# primary_key
				# string
				# text
				# time
				# timestamp
	      t.string :name
	      t.string :uid
	      t.text :report
	      t.timestamp
	    end
	  end

	  def self.down
	    drop_table :reports
	  end
	end

	# マイグレーション
	InitialSchema.migrate(:up)
end



class Report < ActiveRecord::Base
end