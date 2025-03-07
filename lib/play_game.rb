require_relative 'human_player'
require_relative 'dictionary'
require_relative 'game_logic'
require_relative 'displayable'

class PlayGame
  include Displayable

  def initialize
    @human = HumanPlayer.new
    @logic = GameLogic.new
  end

  def play
    until @logic.guesses_remaining == 0 || @logic.check_win
      loop do
        p "DEBUG #{@logic.word}"
        @human.player_guess_prompt(@logic.historic_guesses)
        @logic.generate_word_strip(@human.guess)
        adjust_counters
        p @logic.guesses_remaining
        game_display(@logic.word_strip, @logic.discarded_letters)
      end
      end_game
    end
  end

  def adjust_counters
    @logic.decrease_guess_count
    @logic.add_historic_guesses(@human.guess)
  end

  def end_game
    if @logic.guesses_remaining == 0
      lose_game_ui
    else win_game_ui
end

g = PlayGame.new
g.play
