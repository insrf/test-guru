class FeedbackMailer < ApplicationMailer

  default from: %{"TestGuru" <mail@testguru.com>}
  layout 'feedback_mailer'

  def feedback_send(first_name, email, content)
    @first_name = first_name
    @email = email
    @content = content
    mail to: "ins.rfrf@gmail.com"
  end

end
