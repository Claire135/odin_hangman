require_relative 'human_player'
require_relative 'dictionary'
require_relative 'game_logic'
require_relative 'hangman_graphic'
require_relative 'displayable'

class PlayGame
  include Displayable

  def initialize
    @human = HumanPlayer.new
    @logic = GameLogic.new
  end

  def play
    until @logic.guesses_remaining == 0 || @logic.check_win
        @human.player_guess_prompt(@logic.historic_guesses)
        @logic.process_letters(@human.guess)
        adjust_counters(@human.guess)
        game_display(@logic.word_strip, @logic.discarded_letters, @logic.guesses_remaining)
    end
      end_game
  end

  def adjust_counters(guess)
    @logic.decrease_guess_count(guess)
    @logic.add_historic_guesses(guess)
  end

  def end_game
    if @logic.guesses_remaining == 0
      lose_game_ui
    else win_game_ui
    end
  end
end

g = PlayGame.new
g.play
