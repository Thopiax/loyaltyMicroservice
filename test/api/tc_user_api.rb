require_relative 'api_tc_helper'

class UserApiTestCase < ApiTestCaseHelper
  def test_post_user_works
    post "/api/user"
    assert last_response.ok?
  end
end
