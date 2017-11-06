require_relative '../spec_helper'

class BaseApiSpec < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    LoyaltyApp
  end

  def user_id
    "test#{self.class}#{self}"
  end

  def setup_test_user
    create_user(id: user_id)
    yield
  end
end
