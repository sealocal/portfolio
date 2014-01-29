require "test_helper"

feature "Deleting a Post" do
  scenario "post is deleted with a click" do
    #Given a signed-in user
    sign_in(:editor)
    #Given an existing post
    visit posts_path
    #When the delete link is clicked
    page.find("tbody tr:last").click_on "Destroy"
    #Then the post is deleted
    page.wont_have_content "You need to sign in or sign up before continuing."
    page.wont_have_content "Code Rails"
    page.wont_have_content "This is how I learned web development!"
  end

  scenario "As a site visitor I should not be able to delete posts so that I can't modify a site I don't own" do
    #When I visit the posts index page
    visit posts_path
    #Then I should not see the "New Post" button
    page.wont_have_link "Destroy"
  end

  scenario "As an author I should not be able to delete posts so that I can give the editor publishing control" do
    #Given an author role
    sign_in(:author)
    #When I visit the posts index page
    visit posts_path
    #Then I should not see the "Destroy" link
    page.wont_have_link "Destroy"
  end

  scenario "As an editor I want to delete posts so that I can remove opium-fueled Jabberwocky" do
    #Given an author role
    sign_in(:editor)
    #When I visit the blog index page
    visit posts_path
    #Then I should see the "Edit" link and visit an edit_post_path
    page.must_have_link "Destroy"
  end
end
