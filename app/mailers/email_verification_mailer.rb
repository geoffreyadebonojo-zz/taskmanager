class EmailVerificationMailer < ApplicationMailer
  def invite(email)
    mail(to: email, subject: "Please activate your account")
  end
end
