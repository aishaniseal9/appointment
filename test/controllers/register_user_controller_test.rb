require 'test_helper'

class RegisterUserControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get register_user_index_url
    assert_response :success
  end

end
