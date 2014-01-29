require "test_helper"

feature "Creating a Post" do
  scenario "As an author I want to create posts so that I can share great content with the world" do
    #Given a signed-in user
    role = :author
    sign_in(role)
    #Given a completed new post form
    visit new_post_path
    fill_in "Title", with: posts(:cr).title
    fill_in "Body", with: posts(:cr).body
    # When I submit the form
    click_on "Create Post"
    # Then a new post should be created and displayed
    verify_post_creation(role)
  end

  scenario "As an editor I want to create posts so that I can share great content with the world" do
    #Given a signed-in user
    role = :editor
    sign_in(role)
    #Given a completed new post form
    visit new_post_path
    fill_in "Title", with: posts(:cr).title
    fill_in "Body", with: posts(:cr).body
    # When I submit the form
    click_on "Create Post"
    # Then a new post should be created and displayed
    verify_post_creation(role)
  end

  scenario "unauthenticated site visitors cannot visit new_post_path" do
    #When an unauth user visits new_post_path
    visit new_post_path
    #Then they are alerted to sign in
    page.must_have_content "You need to sign in or sign up before continuing."
  end

  scenario "As a site visitor I should not be able to create posts so that I can't modify a site I don't own" do
    #When I visit the blog index page
    visit posts_path
    #Then I should not see the "New Post" button
    page.wont_have_link "New Post"
  end

  scenario "As an author I should not be able to publish posts so that I can give the editor publishing control" do
    # Given an author's account
    sign_in(:author)
    # When I visit the new page
    visit new_post_path
    # Then there is no checkbox for published
    page.wont_have_field("Published")
    # And I should see a 'not authorized' message if I try to hack it
    # TODO: I don't know how to submit an HTTP DELETE request!
    #post '/foo', data: "here"
  end

  scenario "As an editor I want to publish posts so that I can make posts live on the site" do
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
