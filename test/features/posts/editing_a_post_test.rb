require "test_helper"

feature "Editing a Post" do
  scenario "submit updates to an exisiting post, with fixtures" do
    #Given a signed-in user
    sign_in(:author)
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

  scenario "As a site visitor I should not be able to edit posts so that I can't modify a site I don't own" do
    #When I visit the blog index page
    visit posts_path
    #Then I should not see the "Edit" link and I should not visit the edit_post_path
    page.wont_have_link "Edit"
    current_path.wont_include "edit"
  end

  scenario "As an author I want to update posts so that I can fix typos" do
    #Given an author role
    sign_in(:author)
    #When I visit the blog index page
    visit posts_path
    #Then I should see the "Edit" link and visit an edit_post_path
    page.must_have_link "Edit"
    page.all('a', :text => 'Edit')[0].click
    current_path.must_include "edit"
    #Then I can click update
    fill_in "Title", with: "lorem ipsum"
    fill_in "Body", with: "boring stuff"
    click_on "Update Post"
  end
end
