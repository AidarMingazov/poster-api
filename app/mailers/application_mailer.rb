class ApplicationMailer < ActionMailer::Base
  layout "mailer"
  default from: "no-reply@poster-base.herokuapp.com",
          bcc: "aidar.mingazov@flatstack.com"

  def contact(message, email)
    @message = message
    @email = email
    mail(to: :bcc)
  end
end
