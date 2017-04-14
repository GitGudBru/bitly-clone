cclass AddIndexing < ActiveRecord::Migration
	def change
		add_index :urls, :shortened_url, unique: true
	end
end