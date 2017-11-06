require_relative 'api_tc_helper'

class StatusApiTestCase < ApiTestCaseHelper
  def test_get_status_with_good_user_works
    get "/api/user/#{user_id}/status"
    assert last_response.ok?
    assert_equal last_response.body, {"status" => "bronze"}.to_json
  end

  def test_get_status_with_unknown_user_fails
    get "/api/user/no_such_user/status"
    assert_equal last_response.status, 404
    assert !last_response.ok?
  end
end
