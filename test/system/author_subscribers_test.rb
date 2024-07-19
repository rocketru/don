require "application_system_test_case"

class AuthorSubscribersTest < ApplicationSystemTestCase
  setup do
    @author_subscriber = author_subscribers(:one)
  end

  test "visiting the index" do
    visit author_subscribers_url
    assert_selector "h1", text: "Author subscribers"
  end

  test "should create author subscriber" do
    visit author_subscribers_url
    click_on "New author subscriber"

    fill_in "Author", with: @author_subscriber.author_id
    fill_in "Subscriber", with: @author_subscriber.subscriber_id
    click_on "Create Author subscriber"

    assert_text "Author subscriber was successfully created"
    click_on "Back"
  end

  test "should update Author subscriber" do
    visit author_subscriber_url(@author_subscriber)
    click_on "Edit this author subscriber", match: :first

    fill_in "Author", with: @author_subscriber.author_id
    fill_in "Subscriber", with: @author_subscriber.subscriber_id
    click_on "Update Author subscriber"

    assert_text "Author subscriber was successfully updated"
    click_on "Back"
  end

  test "should destroy Author subscriber" do
    visit author_subscriber_url(@author_subscriber)
    click_on "Destroy this author subscriber", match: :first

    assert_text "Author subscriber was successfully destroyed"
  end
end
