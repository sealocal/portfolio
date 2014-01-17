require "test_helper"

feature "Check for Zrub" do
  scenario "found columns on the home page" do
    visit root_path
    page.must_have_content "columns"
  end
end
