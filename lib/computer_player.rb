# Stores computer generated words.
# Uses the Dictionary Module to generate new words

class ComputerPlayer
  attr_reader :word
  include Dictionary
  
  def initialize
    @word = nil
  end

  def generate_random_word
    @word = dictionary_array.sample
  end
end


