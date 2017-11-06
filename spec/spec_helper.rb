ENV['RACK_ENV'] = "test"

require './loyalty_app'
require 'rack/test'
require 'test/unit'

Mongoid.purge!
