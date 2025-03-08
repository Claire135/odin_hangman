# frozen_string_literal: true

class GameLogic
  attr_accessor :historic_guesses, :guesses_remaining
  attr_reader :word, :discarded_letters, :word_strip

  include Dictionary

  def initialize
    @word = dictionary_array.sample
    @guesses_remaining = 10
    @historic_guesses = []
    @discarded_letters = []
    @word_strip = Array.new(@word.length, '_')
  end

  def process_letters(guess)  
    match = letter_in_word_index(guess)
    if match.empty?
      @discarded_letters << guess
    else
      match.each { |index| @word_strip[index] = guess }
    end
    @word_strip
  end

  def add_historic_guesses(guess)
    @historic_guesses << guess
  end

  def check_win
    !@word_strip.include?('_')
  end

  def decrease_guess_count(guess)
    @guesses_remaining -= 1 unless @word.include?(guess)
  end

  def letter_in_word_index(guess)
    indices = []
    @word.chars.each_with_index do |letter, index|
      indices << index if letter == guess
    end
    indices
  end
end
