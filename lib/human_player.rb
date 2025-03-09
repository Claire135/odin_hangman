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
      puts 'Guess a letter!'
      @guess = gets.chomp.downcase

      unless valid_guess?
        puts 'Please enter a valid letter (in the English alphabet!).'
        next
      end

      if already_guessed?(historic_guesses)
        puts "You've already guessed that letter, pick another one!"
        next
      end

      return @guess
    end
  end

  private

  def valid_guess?
    ('a'..'z').include?(@guess)
  end

  def already_guessed?(historic_guesses)
    historic_guesses ||= []
    historic_guesses.include?(@guess)
  end
end
