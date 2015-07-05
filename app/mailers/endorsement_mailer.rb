class EndorsementMailer < ActionMailer::Base
  add_template_helper(EmailHelper)
  default from: Settings.application.contact_email


  def contact_message(name, email, message, phone = nil)
    @name = name
    @email = email
    @message = message
    @phone = phone || "Not provided"

    mail to: "memikequinn@gmail.com", subject: "New message received at #{Settings.application.host}"
  end
end
