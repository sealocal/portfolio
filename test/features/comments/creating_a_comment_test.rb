require "test_helper"

feature "Creating a Comment" do
  scenario "As a site visitor I want to write a comment on a blog post page so that I can troll the author" do
    #Given an unregistored visitor
    #When I visit a post
    visit post_path(post(:http))
    #Then I can comment on the post page
    fill_in "Comment", with: comment(:sams_comment)
  end

  scenario "As an author I want to approve comments so that my blog does not have spam comments" do
    #Given an author role
    sign_in(:author)
    #When I visit a post path
    visit post_path(:wd)
    #Then I will see an approval checkbox
    page.must_have_text "Approved"
    check "Approved"
  end

  scenario "As an editor I want to approve comments so that my blog does not have spam comments" do
    #Given an editor role
    sign_in(:editor)
    #When I visit a post path
    visit post_path(:wd)
    #Then I will see an approval checkbox
    page.must_have_text "Approved"
    check "Approved"
  end
end
