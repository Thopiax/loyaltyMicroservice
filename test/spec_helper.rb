ENV['RACK_ENV'] = "test"

require './loyalty_app'
require 'rack/test'
require 'test/unit'

def create_user(params)
  User.create(params)
rescue Mongo::Error::OperationFailure => e
  p "An error occured: #{e}. If it's a duplicate key error no need to worry."
end
