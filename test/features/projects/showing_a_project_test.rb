require "test_helper"

feature "As an employer, I want to see an individual project so that I can evaluate it." do
  scenario "Show a Project Page" do
    #Given a project (fixture)
    #When I visit a project's page
    visit project_path(projects(:social_network))
    #Then I should see the project's name and tech
    page.must_have_content "MyFace"
    page.must_have_content "Social Networks, Rails, Hammers, Nails"
    page.wont_have_content "Error"
  end
end

