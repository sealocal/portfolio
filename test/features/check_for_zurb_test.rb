require "test_helper"

feature "Zurb Foundation" do
  scenario "found columns on the home page" do
    visit root_path
    page.must_have_selector 'section.top-bar-section'
  end
end
