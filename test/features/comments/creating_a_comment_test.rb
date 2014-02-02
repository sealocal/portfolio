require "test_helper"

feature "Creating a Comment" do
  #This scenario is old because the new spec says that a user must sign in through twitter to comment.
  #scenario "As a site visitor I want to write a comment on a blog post page so that I can troll the author" do
  scenario "As a an owner I want visitors to comment only if they log in with Twitter" do
    #Given an unregistered visitor
    #When I visit a post
    visit post_path(posts(:http))
    #Then I can comment on the post page
    fill_in "Comment", with: comments(:sams_comment)
    click_on "Create Comment"
    page.text.must_include "You must log in with Twitter to comment!"
  end

  scenario "As an author I want to approve comments so that my blog does not have spam comments" do
    #Given an author role
    sign_in(:author)
    #When I visit a post path
    visit post_path(posts(:wd))
    #Then I will see an Approve button
    click_on "Approve"
  end

  scenario "As an editor I want to approve comments so that my blog does not have spam comments" do
    #Given an editor role
    sign_in(:editor)
    #When I visit a post path
    visit post_path(posts(:wd))
    #Then I will see an approval checkbox
    click_on "Approve"
  end

end
