require "test_helper"

feature "Creating a Post" do
  scenario "submitting form data creates a new post (using fixtures)" do
    #Given a signed-in user
    sign_in(users(:author))
    #Given a completed new post form
    visit new_post_path
    fill_in "Title", with: posts(:cr).title
    fill_in "Body", with: posts(:cr).body
    # When I submit the form
    click_on "Create Post"
    # Then a new post should be created and displayed
    page.text.must_include "Post was successfully created"
    page.text.must_include posts(:cr).title
    page.must_have_content posts(:cr).title
    page.must_have_css "#author", true
    page.text.must_include users(:one).email
    page.text.must_include "Status: Unpublished"
  end

  scenario "unauthenticated site visitors cannot visit new_post_path" do
    #When an unauth user visits new_post_path
    visit new_post_path
    #Then they are alerted to sign in
    page.must_have_content "You need to sign up before continuing"
  end

  scenario "unauth site visitors cannot see new post button" do
    #When I visit the blog index page
    visit posts_path
    #Then I should not see the "New Post" button
    page.wont_have_link "New Post"
  end

  scenario "authors can't publish" do
    # Given an author's account
    sign_in(:author)
    # When I visit the new page
    visit new_post_path
    # Then there is no checkbox for published
    page.wont_have_field('published')
  end

  scenario "editors can publish" do
    #Given an editor's account
    sign_in(:editor)
    #When I visit the new page
    visit new_post_path
    #Then there is a checkbox for published
    page.must_have_field("Published")


    # When I submit the form
    fill_in "Title", with: posts(:cr).title
    fill_in "Body", with: posts(:cr).body
    check "Published"
    click_on "Create Post"

    # Then the published post should be shown
    page.text.must_include "Status: Published"
  end
end