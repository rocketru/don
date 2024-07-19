require "test_helper"

class AuthorSubscribersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @author_subscriber = author_subscribers(:one)
  end

  test "should get index" do
    get author_subscribers_url
    assert_response :success
  end

  test "should get new" do
    get new_author_subscriber_url
    assert_response :success
  end

  test "should create author_subscriber" do
    assert_difference("AuthorSubscriber.count") do
      post author_subscribers_url, params: { author_subscriber: { author_id: @author_subscriber.author_id, subscriber_id: @author_subscriber.subscriber_id } }
    end

    assert_redirected_to author_subscriber_url(AuthorSubscriber.last)
  end

  test "should show author_subscriber" do
    get author_subscriber_url(@author_subscriber)
    assert_response :success
  end

  test "should get edit" do
    get edit_author_subscriber_url(@author_subscriber)
    assert_response :success
  end

  test "should update author_subscriber" do
    patch author_subscriber_url(@author_subscriber), params: { author_subscriber: { author_id: @author_subscriber.author_id, subscriber_id: @author_subscriber.subscriber_id } }
    assert_redirected_to author_subscriber_url(@author_subscriber)
  end

  test "should destroy author_subscriber" do
    assert_difference("AuthorSubscriber.count", -1) do
      delete author_subscriber_url(@author_subscriber)
    end

    assert_redirected_to author_subscribers_url
  end
end
