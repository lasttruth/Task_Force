class SessionsController < ApplicationController
skip_before_action :verify_authenticity_token
  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end

  def new
    @user = User.new
    @users = User.all
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to home_path
     else
      flash[:alert] = "Email or password is invalid"
      redirect_to signin_path
     end
  end

  def destroy
    reset_session
    redirect_to home_url
  end

  private

  def session_params
    params.require(:user).permit(:email, :password)
  end

end
