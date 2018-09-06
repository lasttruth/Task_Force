class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
    def show
      if current_user
        @user = User.new
      else
        redirect_to sign_in_path
      end
    end

    def new
      @user = User.new
    end

    def create
      @user = User.new(user_params)

      if @user.save
        session[:user_id] = @user.id
        redirect_to home_path
      else
        render :new
      end
   end

    def edit
    end

    def update
    @user = User.find(params[:id])
    @user = User.update(user_params)

    redirect_to user_path
    end
    private
      # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end
       # Never trust parameters from the scary internet, only allow the white list through.
      def user_params
        params.require(:user).permit(
        :email,
        :password
        )
      end
  end
