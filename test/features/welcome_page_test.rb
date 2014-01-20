require "test_helper"

feature "WelcomePage" do
  scenario "displays Welcome message" do
    visit "http://mikes-cf-portfolio.herokuapp.com/"
    page.must_have_content "Minimal Design"
    page.must_have_content "Lorem ipsum"
    page.wont_have_content "Leave me alone!"
  end
end
