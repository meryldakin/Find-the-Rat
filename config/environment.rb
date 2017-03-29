require 'bundler'
Bundler.require
require 'json'

ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: 'db/development.db')

ActiveRecord::Base.logger = nil

require_all 'lib'

Dir[File.join(File.dirname(__FILE__), "../app/models", "*.rb")].each {|f| require f}
Dir[File.join(File.dirname(__FILE__), "../lib", "*.rb")].each {|f| require f}
Dir[File.join(File.dirname(__FILE__), "../lib/adapters", "*.rb")].each {|f| require f}
