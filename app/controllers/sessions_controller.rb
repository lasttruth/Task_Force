class SessionsController < ApplicationController
skip_before_action :verify_authenticity_token
  def destroy
    session.destroy
    redirect_to root_path
  end

  def new
    if current_user
      redirect_to games_path
    else
      @user = User.new
    end
  end

  def create
    user = User.find_by(email: params[:user][:email])
    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect_to games_path
     else
      flash[:alert] = "Email or password is invalid"
      redirect_to sign_in_path
     end
  end


  private

  def session_params
    params.require(:user).permit(:email, :password)
  end

end
