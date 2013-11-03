require 'sequential_id/version'
require 'sequential_id/generator'
require 'sequential_id/has_sequential_id'
require 'sequential_id/sequence'

ActiveRecord::Base.send(:include, SequentialId::HasSequentialId)
