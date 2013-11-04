require 'sequential/version'
require 'sequential/generator'
require 'sequential/sequential_include'
require 'sequential/sequence'

ActiveRecord::Base.send(:include, Sequential::SequentialInclude)
