require_relative '../test_helper'

class ApiTestCaseHelper < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    LoyaltyApp
  end

  def setup
    create_user(id: user_id)
  end

  def user_id
    "test#{self.class}#{self}"
  end
end
