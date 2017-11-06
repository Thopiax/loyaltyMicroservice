require 'loyalty_app'
require 'minitest/autorun'
require 'rack/test'

class BaseApiSpec < Minitest::Test
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end
end
