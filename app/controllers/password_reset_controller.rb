class PasswordResetController < ApplicationController

  def show
  end

  def reset
    if User.find_by(email: params[:email])
      @user = User.find_by(email: params[:email])
      @user.reset_token = reset_token
      @user.save
      PasswordResetMailer.reset(params[:email], @user.reset_token).deliver_now
      redirect_to :email_verification
    else
      redirect_to request.referrer
    end
  end

end
