require "test_helper"

feature "Check for Zurb" do
  scenario "found columns on the home page" do
    visit root_path
    page.must_have_content '<meta class=\"foundation-mq-'
  end
end
