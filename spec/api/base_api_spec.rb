require './spec/spec_helper'
require './lib/models/user'

class BaseApiSpec < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    LoyaltyApp
  end

  def setup_test_user
    User.create(id: test_user_id)
  end

  def test_user_id
    "test"
  end
end
