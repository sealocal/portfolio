require "test_helper"

feature "Editing a Post" do
  scenario "submit updates to an exisiting post" do
    #Given an exisiting post
    post = Post.create(title: "Becoming a Code Fellow", body: "Means striving for excellence.")
    visit post_path(post)
    #When I click edit and submit changed data
    click_on "Edit"
    fill_in "Title", with: "Becoming a Web Developer"
    click_on "Update Post"
    #Then the post is updated
    page.text.must_include "Post was successfully updated"
    page.text.must_include "Web Developer"
  end

  scenario "submit updates to an exisiting post, with fixtures" do
    #Given an exisiting post
    post = Post.create(title: posts(:cf).title, body: posts(:cf).body)
    visit post_path(post)
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
