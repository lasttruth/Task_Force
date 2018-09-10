class StatusesController < ApplicationController
  def create
    @user = current_user
    @game = Game.find(params[:game_id])
    @status = @game.statuses.create(status_params)
    @status.user = @user
    @status.save

    redirect_to game_path(@game)
  end

  def edit
    @user = current_user
    @game = Game.find(params[:game_id])
    @status = @game.statuses.update(status_params)
    @status.user = @user
    @status.save
  end

  def update
    @status = Status.find(params[:id])

    redirect_to game_path(@game)
  end

  def destroy
    @status = Status.find(params[:id])
    @status.destroy
    redirect_to games_url
  end

  private
  def status_params
    params.require(:status).permit(:condition, :completion)
  end
end
