require "test_helper"

feature "As the site owner, I want to delete a portfolio item so that I can keep the list focused on my best work" do
  scenario "Delete a Project from the Index Page" do
    #Given all projects on one page
    sign_in(:editor)
    visit projects_path
    #When I delete a project
    page.find('a[href="/projects/9999"][data-method="delete"]').click
    #Then I will no longer see that project and an alert will be shown
    page.text.must_include "Project deleted!"
    page.wont_have_content "Code Fellows Portfolio"
    page.wont_have_content "Rails, Ruby, Git, Magic"
  end
end
