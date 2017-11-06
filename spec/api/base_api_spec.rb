require './spec/spec_helper'

class BaseApiSpec < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    LoyaltyApp
  end

  def initialize(param)
    super(param)
  end

  def test_user_id
    "test#{self.class}"
  end

  private

  def setup_test_user
    User.find(test_user_id)
  rescue Mongoid::Errors::DocumentNotFound
    User.create(id: test_user_id)
  end
end
