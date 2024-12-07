require "test_helper"


  class CommentsControllerTest < ActionDispatch::IntegrationTest
    include Devise::Test::IntegrationHelpers
    setup do
      @post = posts(:one)
      @comment = post_comments(:deep_nested)
      @user = users(:one)
      sign_in @user
    end

    test "should create comment" do
      assert_difference("PostComment.count", 1) do
        post post_comments_url(@post),
         params: { post_comment: { content: @comment.content, post_id: @comment.post_id, user_id: @comment.user_id, ancestry: @comment.ancestry } }
      end
      assert_redirected_to @post
    end

    test "should reply to comment" do
      assert_difference("PostComment.count", 1) do
        post reply_post_comment_url(@post, @comment),
         params: { post_comment: { content: @comment.content, post_id: @comment.post_id, user_id: @comment.user_id, ancestry: @comment.ancestry } }
      end
      assert_redirected_to @post
    end
  end
