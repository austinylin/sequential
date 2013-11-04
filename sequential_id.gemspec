# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sequential_id/version'

Gem::Specification.new do |spec|
  spec.name          = "sequential_id"
  spec.version       = SequentialId::VERSION
  spec.authors       = ["Austin Lin"]
  spec.email         = ["austin@austinylin.com"]
  spec.description   = %q{Generates scoped, threadsafe sequential ids for 
                          ActiveRecord models}
  spec.summary       = %q{SequentialID enables the use of scoped, threadsafe 
                          sequential ids for ActiveRecord models using a 
                          seperate sequence table and row-level locking}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rails", ">= 4.0"
  spec.add_development_dependency "sqlite3"
end
