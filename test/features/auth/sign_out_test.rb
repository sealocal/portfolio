require "test_helper"

feature("As a site visitor, I want to sign out of my account
so that my session is secure.") do
  scenario "Sign Out Sucessfully" do
    #Given a signed up and signed in user,
    visit new_user_session_path
    fill_in "Email", with: users(:one).email
    fill_in "Password", with: "password1"
    click_on "Sign in"
    page.text.must_include "Sign Out"
    #When I click on the Sign Out link
    click_on "Sign Out"
    #Then I should be signed out
    page.must_have_content "Signed out successfully."
  end
end
