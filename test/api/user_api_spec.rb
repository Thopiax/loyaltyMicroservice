require_relative "base_api_spec"

class UserApiSpec < BaseApiSpec
  def test_post_user_works
    setup_test_user do
      post "/api/user"
      assert last_response.ok?
    end
  end
end
