require "test_helper"

feature "Visiting the Post Index" do
  scenario "As a site visitor (user) I want to view (read) posts so that I can enjoy quality content" do
    #Given existing posts (from fixtures)
    #When I visit /posts
    visit posts_path
    #Then the exisiting posts should be loaded
    page.text.must_include posts(:cf).title
    page.text posts(:cf).body
  end

  scenario "As a site visitor I want to only see published posts so that I don't see crap drafts" do
    #Given existing posts
    #When I visit /posts (from fixtures)
    visit posts_path
    #Then I should not see posts with published attribute set to falses
    page.text.must_include posts(:cf).title
    page.text posts(:cf).body
    #TODO: I don't know if this is best pracice, but it works!
    Post.where(published: false).each do |post|
      page.text.wont_include post.title
      page.text.wont_include post.body
    end
  end
end
