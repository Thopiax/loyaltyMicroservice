require_relative 'base_api_spec'

class StatusApiSpec < BaseApiSpec
  def test_get_status_with_good_user_works
    setup_test_user do
      get "/api/user/#{user_id}/status"
      assert last_response.ok?
      assert_equal last_response.body, {"status" => "bronze"}.to_json
    end
  end

  def test_get_status_with_unknown_user_fails
    setup_test_user do
      get "/api/user/no_such_user/status"
      assert_equal last_response.status, 404
      assert !last_response.ok?
    end
  end
end
