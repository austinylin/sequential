require 'rails/generators/migration'


module SequentialID
  module Generators
    class ConfigGenerator < Rails::Generators::Base
      desc 'Creates a migration to create the seq_id_sequences table'

      source_root File.expand_path("../templates", __FILE__)
 
      def create_migration 
        migration_template "migration.rb", "db/migrate/create_seq_id_sequences.rb"
      end
    end
  end
end
