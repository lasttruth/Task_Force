class StatusesController < ApplicationController
  def create
    @game = Game.find(params[:game_id])
    @status = @game.statuses.create(status_params)
    redirect_to game_path(@game)
  end

  def destroy
    @game = Game.find(params[:game_id])
    @status = @game.statuses.find(params[:id])
    @status.destroy
    redirect_to game_path(@game)
  end

  private
  def status_params
    params.require(:status).permit(:codition, :completion)
  end
end
