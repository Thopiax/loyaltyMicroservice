require './spec/test_helper'

class BaseApiSpec < Minitest::Test
  include Rack::Test::Methods

  def app
    LoyaltyApp
  end
end
