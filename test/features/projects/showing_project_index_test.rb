require "test_helper"

feature "As an employer, I want to see this developer's portfolio so that I can judge their work." do
  scenario "View All Projects Page" do
    #Given multiple projects (fixtures)
    #When I visit the projects index
    visit projects_path
    #Then I should see the project's name and tech
    page.must_have_content "MyFace"
    page.must_have_content "Code Fellows Portfolio"
    page.wont_have_content "Error"
  end
end
