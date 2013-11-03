require 'rails/generators/active_record'


module SequentialId
  module Generators
    class SetupGenerator < ActiveRecord::Generators::Base

      # Ignore the required name param
      argument :name, type: :string, default: 'random_name'
      
      desc 'Creates a migration to create the seq_id_sequences table'

      source_root File.expand_path("../templates", __FILE__)
 
      def create_migration 
        migration_template "migration.rb", "db/migrate/create_seq_id_sequences.rb"
      end
    end
  end
end
