class GamesOwnedController < ApplicationController

  def about
    @title = 'List of games I own'
    @content = "woah I own 100 games on steam"
  end
end
