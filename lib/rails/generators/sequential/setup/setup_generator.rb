require 'rails/generators/active_record'

module Sequential
  module Generators
    class SetupGenerator < ActiveRecord::Generators::Base

      # Ignore the required name param
      argument :name, type: :string, default: 'random_name'
      
      desc 'Creates a migration to create the sequential table'

      source_root File.expand_path("../templates", __FILE__)
 
      def create_migration 
        migration_template "migration.rb", "db/migrate/create_sequential.rb"
      end
    end
  end
end
