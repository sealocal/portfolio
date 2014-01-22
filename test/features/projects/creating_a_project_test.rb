require "test_helper"

feature "As a site_owner, I want to add a portfolio item so that I can show off my work." do
  scenario "Create a New Project" do
    #Given a new project form
    visit projects_path
    click_on "New Project"
    #When I submit a new project
    fill_in "Name", with: "Code Fellows Portfolio"
    fill_in "Technologies used", with: "Rails, Ruby, Foundation, HTML5, CSS3"
    click_on "Create Project"
    #Then a new project will be created
    page.text.must_include "Code Fellows Portfolio"
    page.text.must_include "Rails, Ruby"
    page.must_have_content "Great, a new project has been added!"
    page.wont_have_content "Error"
  end

  scenario "New Project Has Invalid Data" do
    #Given invalid project data is entered in a form
    visit new_project_path
    #When the form is submitted with a short name and missing technologies_used field
    fill_in "Name", with: ""
    click_on "Create Project"
    #Then the form should be displayed again, with an error message
    current_path.must_match /projects$/
    page.text.must_include "Fix your project, it could not be saved!"
    page.text.must_include "Name is too short"
    page.text.must_include "Technologies used can't be blank"
  end
end
