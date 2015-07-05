class ContactMailer < ActionMailer::Base
  add_template_helper(EmailHelper)
  default from: Settings.application.contact_email

  def contact_message(name, email, message, phone = nil)
    @name = name
    @email = email
    @message = message
    @phone = phone || "Not provided"
    _sending_email = Mail::Address.new(email)
    _sending_email.display_name = name
    MailLogger.info "Sending mail from #{email}"
    mail(to: "memikequinn@gmail.com", subject: "New message received at #{Settings.application.host}", from: _sending_email.format)
  end
end
