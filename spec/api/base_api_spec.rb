require './spec/spec_helper'

class BaseApiSpec < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    LoyaltyApp
  end

  def user_id
    "test#{self.class}"
  end

  def setup_test_user
    fetch_user
    yield
  end

  private

  def fetch_user
    User.create(id: user_id)
  rescue Mongo::Error::OperationFailure => e
    p e
  end
end
