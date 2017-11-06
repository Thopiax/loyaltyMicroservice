require './spec/api/base_api_spec'

class PointsApiSpec < BaseApiSpec

  def test_post_points_with_correct_params_works
    setup_test_user
    post "/api/user/#{test_user_id}/points", :eurosSpent => 5, :isRide => true
    p last_response
    assert last_response.ok?
  end

  def test_post_points_with_no_params_fails
    post "/api/user/#{test_user_id}/points"
    assert !last_response.ok?
  end

  def test_post_points_with_wrong_params_fails
    post "/api/user/#{test_user_id}/points", :eurosSpent => true, :isRide => 5
    assert !last_response.ok?
  end

end
