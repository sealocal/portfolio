require "test_helper"

feature "Editing a Post" do
  scenario "submit updates to an exisiting post, with fixtures" do
    #Given a signed-in user
    sign_in_a_user
    #Given an exisiting post
    visit post_path(posts(:cf))
    #When I click edit and submit changed data
    click_on "Edit"
    fill_in "Title", with: posts(:wd).title
    fill_in "Body", with: posts(:wd).body
    click_on "Update Post"
    #Then the post is updated
    page.text.must_include "Post was successfully updated"
    page.text.must_include posts(:wd).title
    page.text.must_include posts(:wd).body
  end
end
