# frozen_string_literal: true

# Stores human guess
# Controls guess input

class HumanPlayer
  attr_reader :guess

  def initialize
    @guess = nil
  end

  def player_guess_prompt(historic_guesses)
    loop do
      @guess = prompt_guess

      return @guess if valid_new_guess?(historic_guesses)
    end
  end

  private

  def prompt_guess
    puts 'Guess a letter!'
    gets.chomp.downcase
  end

  def valid_new_guess?(historic_guesses)
    return true if valid_guess? && !already_guessed?(historic_guesses)

    puts 'Invalid guess. Please enter a valid letter!' unless valid_guess?
    puts "You've already guessed that letter, pick another one!" if already_guessed?(historic_guesses)
    false
  end

  def valid_guess?
    ('a'..'z').include?(@guess)
  end

  def already_guessed?(historic_guesses)
    historic_guesses ||= []
    historic_guesses.include?(@guess)
  end
end
