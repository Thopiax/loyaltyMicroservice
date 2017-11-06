require_relative "base_api_spec"

class RidesApiSpec < BaseApiSpec
  def test_get_rides_with_good_user_works
    setup_test_user do
      get "/api/user/#{user_id}/rides"
      assert last_response.ok?
      assert_equal last_response.body, {"rideCount" => 0, "ridesRemaining" => 10}.to_json
    end
  end

  def test_get_rides_with_unknown_user_fails
    setup_test_user do
      get "/api/user/no_such_user/rides"
      assert_equal last_response.status, 404
      assert !last_response.ok?
    end
  end
end
