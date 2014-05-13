class NotificationsMailer < ActionMailer::Base
  default from:       ENV["GMAIL_USER_NAME"]
  default to:         ENV["GMAIL_USER_NAME"]
  default cc:         ENV["GMAIL_USER_NAME"]
  default reply_to:   ENV["GMAIL_USER_NAME"]

  def new_message(message)
    @message = message
    mail(subject: "Message from visitor at [miketaylor.io]")
  end
end
