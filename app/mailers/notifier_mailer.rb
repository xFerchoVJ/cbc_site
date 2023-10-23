class NotifierMailer < ApplicationMailer
  def contact_message(name, email, subject, message)
    mail(
      to: "cbc.colima@gmail.com",
      subject: subject,
      from: email,
      body: message
    )
  end
end
