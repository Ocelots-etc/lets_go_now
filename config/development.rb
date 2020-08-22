google_places_key: AIzaSyCX6LHicmx6J9I8xcBEPTIchd-4Zb4xDnQ

require 'bundler'
Bundler.require

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
require_all 'lib'
ActiveRecord::Base.logger.level = 1