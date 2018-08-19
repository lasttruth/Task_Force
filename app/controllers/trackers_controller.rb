class TrackersController < ApplicationController
  def progress
    @game = Game.find(params[:game_id])
    @track = @game.trackers.create(tracker_params)
    redirect_to games_path
  end

  private

  def tracker_params
    params.require(:traker).permit(
    :progress,
    :completion
    )
  end
end
