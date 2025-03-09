# frozen_string_literal: true

# Manages game flow
# Initialises player and game_logic classes

require_relative 'human_player'
require_relative 'dictionary'
require_relative 'basic_serializable'
require_relative 'game_logic'
require_relative 'hangman_graphic'
require_relative 'displayable'
require_relative 'game_menu'
require_relative 'game_manager'

class PlayGame
  include Displayable
  include GameMenu

  def initialize
    @human = HumanPlayer.new
    @logic = GameLogic.new
  end

  def play
    game_start_or_load_prompt
    game_loop
    end_game_sequence
  end

  private

  def game_loop
    process_turn until game_over?
  end

  def process_turn
    @human.player_guess_prompt(@logic.historic_guesses)
    @logic.process_letters(@human.guess)
    adjust_counters(@human.guess)
    game_display(@logic.word_strip, @logic.discarded_letters, @logic.guesses_remaining)
    save_or_load_prompt
  end

  def game_over?
    @logic.guesses_remaining.zero? || @logic.check_win
  end

  def end_game_sequence
    end_game
    play_again_prompt
  end

  def adjust_counters(guess)
    @logic.decrease_guess_count(guess)
    @logic.add_historic_guesses(guess)
  end

  def end_game
    if @logic.guesses_remaining.zero?
      lose_game_ui(@logic.word)
    else
      win_game_ui
    end
  end

  def save_game
    GameManager.save(@logic)  # Save the current game state to the file
  end

  def load_game
    GameManager.load(@logic)  # Load the saved game state into the game
  end
end
