require "test_helper"

feature "Deleting a Post" do
  scenario "post is deleted with a click" do
    #Given a signed-in user
    sign_in_a_user
    #Given an existing post
    visit posts_path
    #When the delete link is clicked
    page.find("tbody tr:last").click_on "Destroy"
    #Then the post is deleted
    page.wont_have_content "You need to sign in or sign up before continuing."
    page.wont_have_content "Code Rails"
    page.wont_have_content "This is how I learned web development!"
  end
end
