require "test_helper"

class UserexecutorsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get userexecutors_show_url
    assert_response :success
  end
end
