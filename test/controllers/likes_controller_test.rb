require "test_helper"

class LikesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @post = posts(:one)
    @user = users(:one)
    @post.liked_users = []
    sign_in @user
  end

  test "should add like to post" do
    assert_difference("@post.liked_users.count", +1) do
      post like_post_url(@post)
    end
    assert_redirected_to @post
  end

  test "should remove like from post" do
    @post.liked_users << @user
    assert_difference("@post.liked_users.count", -1) do
      delete unlike_post_url(@post)
    end
    assert_redirected_to @post
  end
end
