class UsersController < ApplicationController
  def show
    @user = User.find(session[:user_id])
  end

  def new
  end

  def create
    @user = User.new(user_params)
    @user.active = false
    @user.role = 0
    if @user.save
      session[:user_id] = @user.id
      EmailVerificationMailer.invite(@user.email).deliver_now
      redirect_to :profile
    else
      render :new
    end
  end

  def edit
    if params[:id]
      @user = User.find(params[:id])
    else
      @user = current_user
    end
  end

  def update
    @user = User.find(session[:user_id])
    @user.update(user_params)
    if @user.save
      redirect_to profile_path
    else
      render :edit
    end
  end

  def activate
    @user = User.find(session[:user_id])
    @user.active = true
    @user.save
  end

  def resend
    @user = User.find(session[:user_id])
    EmailVerificationMailer.invite(@user.email).deliver_now
    redirect_to :profile
  end

  def reset_form
    @user = User.find_by(reset_token: params[:token])
    @token = User.reset_token
  end

  def password_reset
    @user = User.find_by(params[:reset_token])
    @user.update(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to profile_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :username, :password)
  end
end
