require "test_helper"

feature "WelcomPage" do
  scenario "displays Welcome message" do
    visit root_path
    page.must_have_content "Welcome to my portfolio app!"
    page.wont_have_content "Welcome aboard"
  end
end
