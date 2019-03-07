class PasswordResetMailer < ApplicationMailer
  def reset(email, reset_token)
    @reset_token = reset_token
    mail(to: email, subject: "Follow the link to reset password")
  end
end
