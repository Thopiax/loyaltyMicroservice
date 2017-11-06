require './spec/api/base_api_spec'

class PointsApiSpec < BaseApiSpec

  def test_post_points_with_correct_params_works
    setup_test_user
    post "/api/user/#{test_user_id}/points", :eurosSpent => 5, :isRide => true
    assert last_response.ok?
  end

  def test_post_points_with_no_params_fails
    setup_test_user
    post "/api/user/#{test_user_id}/points"
    assert !last_response.ok?
    assert_equal last_response.status, 400
  end

  def test_post_points_with_wrong_params_fails
    setup_test_user
    post "/api/user/#{test_user_id}/points", :eurosSpent => true, :isRide => 5
    assert !last_response.ok?
    assert_equal last_response.status, 400
  end

  def test_post_points_with_unknown_user_fails
    setup_test_user
    post "/api/user/no_such_user/points", :eurosSpent => 5, :isRide => true
    assert !last_response.ok?
    assert_equal last_response.status, 404
  end

  def test_get_points_with_correct_params_work
    setup_test_user
    get "/api/user/#{test_user_id}/points"
    assert last_response.ok?
    assert_equal last_response.body, {"points" => 0}.to_json
  end

end
