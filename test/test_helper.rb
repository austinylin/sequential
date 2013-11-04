#Configure Rails Environment
ENV['RAILS_ENV'] = 'test'
ENV['RAILS_ROOT'] = File.expand_path('../dummy',  __FILE__)

require File.expand_path('../dummy/config/environment.rb',  __FILE__)
require 'rails/test_help'
require 'rails/generators'
Rails.backtrace_cleaner.remove_silencers!

ActiveRecord::Migrator.migrate(File.expand_path('../dummy/db/migrate/', __FILE__))

# Load support files
Dir['#{File.dirname(__FILE__)}/support/**/*.rb'].each { |f| require f }
