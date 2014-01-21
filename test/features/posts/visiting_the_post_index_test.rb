require "test_helper"

feature "Visiting the Post Index" do
  scenario "with existing posts, show list" do
    #Given existing posts
    Post.create(title: "Becoming a Code Fellow", body: "Means striving for excellence.")
    #When I visit /posts
    visit posts_path
    #Then the exisiting posts should be loaded
    page.must_have_content Post.first.title
    page.must_have_content Post.first.body
    page.wont_have_content "Error Message"
  end

  scenario "with existing posts, show list" do
    #Given existing posts
    Post.create(title: posts(:cf).title, body: posts(:cf).body)
    #When I visit /posts
    visit posts_path
    #Then the exisiting posts should be loaded
    page.text.must_include posts(:cf).title
    page.text posts(:cf).body
  end
end
