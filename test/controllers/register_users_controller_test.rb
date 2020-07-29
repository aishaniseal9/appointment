require 'test_helper'

class RegisterUsersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get register_users_index_url
    assert_response :success
  end

end
