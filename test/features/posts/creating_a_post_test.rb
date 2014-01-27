require "test_helper"

feature "Creating a Post" do
  scenario "submit form data to create a new post" do
    #Given a signed-in user
    sign_in_a_user
    #Given a completed new post form
    visit new_post_path
    fill_in "Title", with: "Code Rails"
    fill_in "Body", with: "This is how I learned to make Rails apps."
    #When I submit the form
    click_on "Create Post"
    #Then a new post should be created and displayed
    page.text.must_include "Post was successfully created"
    page.text.must_include "how I learned to make Rails apps"
    page.must_have_css "#author"
    page.text.must_include users(:one).email
  end

  scenario "submit form data to create a new post, using fixtures" do
    #Given a signed-in user
    sign_in_a_user
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
  end
end
