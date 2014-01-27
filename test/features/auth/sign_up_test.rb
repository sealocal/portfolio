require "test_helper"

feature("As a user, I want to sign up for an account
  so that I can perform actions that require me to be logged in.") do

  scenario "SignUp" do
    #Given a reg form
    visit root_path
    click_on "Sign Up"
    #When I register with valid info
    fill_in "Email", with: "user4@example.com"
    fill_in "Password", with: "password4"
    fill_in "Password confirmation", with: "password4"
    click_on "Sign up"
    #Then I should be signed up
    page.must_have_content "Sign Out"
    page.must_have_content "Welcome! You have signed up successfully."
    page.wont_have_content "There was a problem with your sign up"

  end
end
