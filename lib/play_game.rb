require_relative 'human_player'
require_relative 'dictionary'
require_relative 'computer_player'
require_relative 'game_logic'

class PlayGame
  include GameLogic

  def initialize
    @human = HumanPlayer.new
    @computer = ComputerPlayer.new
  end

  def play
    random_word = @computer.generate_random_word
    p "#{random_word}"
    @human.get_player_guess
    match = is_letter_in_word?(@computer.word, @human.guess)
    p match
  end
end

g = PlayGame.new
g.play
