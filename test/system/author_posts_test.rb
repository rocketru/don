require "application_system_test_case"

class AuthorPostsTest < ApplicationSystemTestCase
  setup do
    @author_post = author_posts(:one)
  end

  test "visiting the index" do
    visit author_posts_url
    assert_selector "h1", text: "Author posts"
  end

  test "should create author post" do
    visit author_posts_url
    click_on "New author post"

    fill_in "Author", with: @author_post.author_id
    fill_in "Title", with: @author_post.title
    click_on "Create Author post"

    assert_text "Author post was successfully created"
    click_on "Back"
  end

  test "should update Author post" do
    visit author_post_url(@author_post)
    click_on "Edit this author post", match: :first

    fill_in "Author", with: @author_post.author_id
    fill_in "Title", with: @author_post.title
    click_on "Update Author post"

    assert_text "Author post was successfully updated"
    click_on "Back"
  end

  test "should destroy Author post" do
    visit author_post_url(@author_post)
    click_on "Destroy this author post", match: :first

    assert_text "Author post was successfully destroyed"
  end
end
