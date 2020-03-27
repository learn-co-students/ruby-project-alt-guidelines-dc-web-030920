require 'bundler'
require 'awesome_print'
require 'tty-prompt'
Bundler.require

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
require_all 'lib'

#stops the logging of sql in the console
ActiveRecord::Base.logger = nil

