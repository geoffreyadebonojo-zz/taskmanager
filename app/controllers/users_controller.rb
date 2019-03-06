class UsersController < ApplicationController
  def show
    @user = User.find(session[:user_id])
  end

  def new
  end

  def create
    @user = User.new(user_params)
    @user.active = false
    if @user.save
      session[:user_id] = @user.id
      EmailVerificationMailer.invite(@user.email).deliver_now
      redirect_to :email_verification
    else
      render :new
    end
  end

  def activate
    @user = User.find(session[:user_id])
    @user.active = true
    @user.save
  end

  private

  def user_params
    params.require(:user).permit(:email, :username, :password)
  end
end
