class GamesController < ApplicationController

  def index
    @games = Game.all
  end

  def show
    @game = Game.find(params[:id])
  end

  def new

  end

  def create
    #render plain: params[:game].inspect
    @game = Game.new(game_params)
    @game.save

    redirect_to @game
  end


private

  def game_params
    params.require(:game).permit(:title, :genre, :platform)
  end
end
