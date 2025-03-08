# This is currently just to start the game. If the game were to be scaled it would also be used to launch modes. 

require_relative 'play_game'

class GameLauncher
  def self.start
    new_game = PlayGame.new
    new_game.play_game
  end
end