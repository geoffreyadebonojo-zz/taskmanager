class PasswordResetMailer < ApplicationMailer
  def reset(email)
    mail(to: email, subject: "Follow the link to reset password")
  end
end
