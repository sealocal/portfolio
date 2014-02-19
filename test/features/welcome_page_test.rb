require "test_helper"

feature "WelcomePage" do
  scenario "displays Welcome message" do
    #Give a welcome page
    #When the home page is visited
    visit root_path
    #Then the welcome message should be displayed
    page.must_have_content "Mike Taylor"
    page.wont_have_content "Leave me alone!"
  end
end
