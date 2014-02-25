require "simplecov"
SimpleCov.start 'rails'

ENV["RAILS_ENV"] = "test"
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require "minitest/rails"
require "minitest/rails/capybara"
#require "minitest-matchers"
require "email_spec"


class ActiveSupport::TestCase
  include EmailSpec::Helpers
  include EmailSpec::Matchers
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...

  #Given a signed-in user
  #Argument expects a :fixture
  def sign_in(role = :editor)
    visit new_user_session_path
    fill_in "Email", with: users(role).email
    fill_in "Password", with: "password"
    click_on "Sign in"
  end

  def edit_a_post
    #Then I should see the "Edit" link and visit an edit_post_path
    page.must_have_link "Edit"
    page.all('a', :text => 'Edit')[0].click
    current_path.must_include "edit"
  end

  def fill_in_and_update_post
    #Then I can fil in new info and click update
    fill_in "Title", with: "lorem ipsum"
    fill_in "Body", with: "boring stuff"
    click_on "Update Post"
  end

  def verify_post_creation(role)
    # Then a new post should be created and displayed
    page.text.must_include "Post was successfully created"
    page.text.must_include posts(:cr).title
    page.must_have_content posts(:cr).title
    page.must_have_css "#author", true
    page.text.must_include users(role).email
    page.text.must_include "Status: Unpublished"
  end
end

class ActionDispatch::IntegrationTest
  include Capybara::DSL
  include Capybara::Assertions
end

