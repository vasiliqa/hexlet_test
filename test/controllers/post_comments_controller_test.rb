require "test_helper"


  class CommentsControllerTest < ActionDispatch::IntegrationTest
    include Devise::Test::IntegrationHelpers
    setup do
      @post = posts(:one)
      @comment = post_comments(:one)
      @user = users(:one)
      sign_in @user
    end

    test "should create comment" do
        Rails.logger.info "Starting the test: should create comment"
      assert_difference('PostComment.count', 1) do
        post post_comments_url(@post), params: { post_comment: { content: 'New comment' } }
      end
      assert_redirected_to @post
    end
  
    test "should reply to comment" do
      assert_difference('PostComment.count', 1) do
        post reply_post_comment_url(@post, @comment), params: { post_comment: { content: 'Reply to comment', parent_id: @comment.id } }
      end
      assert_redirected_to @post
    end
  end
