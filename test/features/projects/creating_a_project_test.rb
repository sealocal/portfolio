require "test_helper"

feature "Projects::CreatingAProject" do
  scenario "" do
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
    page.must_have_content "Project has been created"
    page.wont_have_content "Error"
  end
end
