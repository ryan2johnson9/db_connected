# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'db_connected/version'
#Moved all requires from here into spec/helper because deploying fails -ryan Mar 2015

Gem::Specification.new do |spec|
  spec.name = "db_connected"
  spec.version = DbConnected::VERSION
  spec.authors = ["Ryan Johnson"]
  spec.email = ["ryan2johnson9@hotmail.com"]
  spec.summary = %q{Provide class that checks connection and reconnects automatically to db.}
  spec.description = %q{more description to come}
  spec.homepage = "https://github.com/ryan2johnson9/db_connected"
  spec.license = "MIT"

  spec.files = `git ls-files -z`.split("\x0")
  spec.executables = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake", "~> 10.4"
  spec.add_development_dependency "rspec", ">= 0"
#  spec.add_development_dependency "rspec-core", '>= 0'
#spec.add_development_dependency 'rubinius-debugger', '~> 0'

#  spec.add_development_dependency "activemodel", ["~> 3.2"]
#  spec.add_runtime_dependency "activemodel",
#                              ["~> 3.2"]
#spec.add_runtime_dependency 'rails', '~> 3.2', '>= 3.2.11'
  spec.add_runtime_dependency 'activemodel', '>= 3'
  # spec.add_runtime_dependency 'phonelib'
  # spec.add_development_dependency "typhoeus"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "pry-nav"
end
