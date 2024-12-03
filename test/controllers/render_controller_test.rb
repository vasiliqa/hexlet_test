require "test_helper"

class RenderControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test "should get index" do
    get user_root_url
    assert_response :success
  end
end
