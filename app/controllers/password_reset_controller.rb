class PasswordResetController < ApplicationController

  def show
  end

  def reset
    if User.find_by(email: params[:email])
      PasswordResetMailer.reset(params[:email]).deliver_now
      redirect_to :email_verification
    else
      redirect_to request.referrer
    end
  end

end
