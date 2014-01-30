require "test_helper"

feature("As a visitor, I want to sign in to my account
  so that I can see my previous activity.") do

  scenario "SignUp" do
    #Given a reg form
    visit root_path
    click_on "Sign In"
    #When I register with valid info
    fill_in "Email", with: users(:pat).email
    fill_in "Password", with: "password"
    click_on "Sign in"
    #Then I should be signed in
    page.text.must_include "Sign Out"
    page.wont_have_content "There was a problem with your sign in"

  end
end
