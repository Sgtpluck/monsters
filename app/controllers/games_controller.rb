# Controls the game filter, will eventually control the full game creator.
class GamesController < ApplicationController
  def index
    @body_class = 'games'
  end
end
