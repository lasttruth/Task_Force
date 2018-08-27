class SessionsController < ApplicationController

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end

  def new
    @user = User.new
    @users = User.all
  end

  def create
    @user = User.find_by(email: params[:user][:email])
    if @user && @user.authenticate(params[:user][:password])
      @user.save
      session[:user] = @user
      redirect_to root_path
    else
      redirect_to signin_path
    end
  end

  private

  def session_params
    params.require(:user).permit(:email, :password)
  end

end
