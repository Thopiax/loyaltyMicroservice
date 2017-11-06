require_relative 'api_tc_helper'

class PointsApiTestCase < ApiTestCaseHelper
  def test_post_points_with_correct_params_works
    post "/api/user/#{user_id}/points", :eurosSpent => "5.0", :isRide => "true"
    assert last_response.ok?
  end

  def test_post_points_with_no_params_fails
    post "/api/user/#{user_id}/points"
    assert_equal last_response.status, 400
    assert !last_response.ok?
  end

  def test_post_points_with_wrong_params_fails
    post "/api/user/#{user_id}/points", :eurosSpent => "true", :isRide => "5.0"
    assert_equal last_response.status, 400
    assert !last_response.ok?
  end

  def test_post_points_with_unknown_user_fails
    post "/api/user/no_such_user/points", :eurosSpent => "5.0", :isRide => "true"
    assert_equal last_response.status, 404
    assert !last_response.ok?
  end

  def test_get_points_with_correct_params_work
    get "/api/user/#{user_id}/points"
    assert_equal last_response.body, {"points" => 0}.to_json
    assert last_response.ok?
  end

  def test_get_points_with_unknown_user_fails
    get "/api/user/no_such_user/points", :eurosSpent => "5.0", :isRide => "true"
    assert_equal last_response.status, 404
    assert !last_response.ok?
  end
end
