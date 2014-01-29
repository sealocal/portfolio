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
    #TODO: I don't know if this is best practice, but it works!
    Post.all do |post|
      page.text.must_include post.title
      page.text.must_include post.body
    end
  end

  scenario "As an editor I want to see all posts regardless of published status in the blog index so that I can choose which posts to publish" do
    #Given editor role
    sign_in(:editor)
    #WWhen I visit the posts index
    visit posts_path
    #Then I should see all posts, regardless of publish flag
    Post.where(published: false).each do |post|
      page.text.wont_include post.title
      page.text.wont_include post.body
    end
  end

  scenario "As an author I want to only see my own posts so that I can focus on my work" do
    #Given author role
    sign_in(:author)
    #WWhen I visit the posts index
    visit posts_path
    #Then I should see all posts, regardless of publish flag
    Post.all.where(author: users(:author).email) do |post|
      page.text.must_include post.title
      page.text.must_include post.body
    end
  end
end
