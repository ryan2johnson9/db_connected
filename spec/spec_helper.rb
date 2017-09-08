require 'rubygems'
require 'bundler/setup'

# Strange that we have to require all these here - there must be something wrong with the setup-
# we DO hax the development_dependencies setup in the .gemspec file but still does not work without below requires

require 'active_model'
require 'active_model/naming'
require 'active_model/attribute_methods'
require 'active_model/validations'
require 'active_model/callbacks'
require 'active_model/translation'
require 'active_support/callbacks'
require "active_support/core_ext"
require 'typhoeus'

# END Strange part - ryan Mar 2015

# Bundler.setup
# Bundler.require(:default, :development)

require 'db_connected'

RSpec.configure do |config|
  # some (optional) config here
end
