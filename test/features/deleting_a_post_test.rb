require "test_helper"

feature "Deleting a Post" do
  scenario "post is deleted with a click" do
    #Given an existing post
    post = Post.create(title: "Becoming a Code Fellow", body: "Means striving for excellence.")
    visit posts_path
    #When the delete link is clicked
    click_on "Destroy"
    #Then the post is deleted
    page.wont_have_content "Becoming a Code Fellow"
    page.wont_have_content "Means striving for excellence."
  end
end
