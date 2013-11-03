require 'sequential_id/version'
require 'sequential_id/generator'
require 'sequential_id/has_sequential_id'

ActiveRecord::Base.send(:include, SequentialID::HasSequentialID)
