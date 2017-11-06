require_relative 'api_tc_helper'

class RidesApiTestCase < ApiTestCaseHelper
  def test_get_rides_with_good_user_works
    get "/api/user/#{user_id}/rides"
    assert last_response.ok?
    assert_equal last_response.body, {"rideCount" => 0, "ridesRemaining" => 10}.to_json
  end

  def test_get_rides_with_unknown_user_fails
    get "/api/user/no_such_user/rides"
    assert_equal last_response.status, 404
    assert !last_response.ok?
  end
end
