class FeedbackMailer < ApplicationMailer

  default from: %{"TestGuru" <mail@testguru.com>}
  layout 'feedback_mailer'

  def feedback_send(feedback_content)
    @first_name = feedback_content[0]
    @email = feedback_content[1]
    @content = feedback_content[2]
    mail to: "ins.rfrf@gmail.com"
  end

end
