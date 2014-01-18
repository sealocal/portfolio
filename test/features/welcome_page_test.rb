require "test_helper"

feature "WelcomePage" do
  scenario "displays Welcome message" do
    visit root_path
    page.must_have_content "Minimal Design"
    page.must_have_content "Lorem ipsum"
    page.wont_have_content "Leave me alone!"
  end
end
