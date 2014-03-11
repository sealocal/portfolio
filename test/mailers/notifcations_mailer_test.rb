require "test_helper"

feature "NotificationsMailer" do
  scenario "As an owner, I want users to be able to send emails to me through a contact form." do
    #Given the conact page
    visit connect_path
    #When the form is submitted
    fill_in :name, with: "Pat"
    fill_in "Email", with: users(:pat).email
    fill_in "Message", with: "ruby -Itest test/mailers/* passed!"
    click_on "Submit"
    #Then the success message should be displayed
    page.must_have_content "sent"
    page.wont_have_content "error"
  end
end
