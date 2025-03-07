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

  def generate_word_strip(guess)
    match = letter_in_word_index(guess)
    match.is_a?(Integer) ? @word_strip[match] = guess : @discarded_letters << guess
    @word_strip
  end

  def add_historic_guesses(guess)
    @historic_guesses << guess
  end

  def check_win
    !@word_strip.include?('_')
  end
  
  def decrease_guess_count
    @guesses_remaining -= 1
  end

  def generate_discarded_letters(guess)
    if disclarded_letter = letter_in_word_index(word, guess).is_nil?
      @discarded_letters << disclarded_letter
    end
  end

  def letter_in_word_index(guess)
    @word.index(guess) || []
  end

end
