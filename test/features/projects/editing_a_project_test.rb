require "test_helper"

feature "As a site_owner, I want to edit a portfolio item so that I can update new project details." do
  scenario "Edit a Project" do
    #Given an existing project
    visit edit_project_path(projects(:portfolio))
    #When an edit to the project is submitted
    fill_in "Name", with: "My Personal Website"
    click_on "Update"
    #Then the changes should be saved and shown
    page.text.must_include "Your project has been updated!"
    page.text.must_include "My Personal Website"
    page.text.wont_include "Code Fellows Portfolio"
  end

  scenario "Edit a Project with Bad Data" do
    #Given an existing project
    visit edit_project_path(9999) #Check it out! I'm using a fixture by :id.
    #When I submit invalid edits
    fill_in "Name", with: ""
    fill_in "Technologies used", with: ""
    click_on "Update"
    #Then the changes should not be saved, an error
    #should be displayed, and I should be shown the edit page again
    page.text.must_include "You goofed it up!"
  end

end
