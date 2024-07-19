require "test_helper"

class AuthorPostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @author_post = author_posts(:one)
  end

  test "should get index" do
    get author_posts_url
    assert_response :success
  end

  test "should get new" do
    get new_author_post_url
    assert_response :success
  end

  test "should create author_post" do
    assert_difference("AuthorPost.count") do
      post author_posts_url, params: { author_post: { author_id: @author_post.author_id, title: @author_post.title } }
    end

    assert_redirected_to author_post_url(AuthorPost.last)
  end

  test "should show author_post" do
    get author_post_url(@author_post)
    assert_response :success
  end

  test "should get edit" do
    get edit_author_post_url(@author_post)
    assert_response :success
  end

  test "should update author_post" do
    patch author_post_url(@author_post), params: { author_post: { author_id: @author_post.author_id, title: @author_post.title } }
    assert_redirected_to author_post_url(@author_post)
  end

  test "should destroy author_post" do
    assert_difference("AuthorPost.count", -1) do
      delete author_post_url(@author_post)
    end

    assert_redirected_to author_posts_url
  end
end
