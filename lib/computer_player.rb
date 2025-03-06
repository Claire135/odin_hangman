# Stores computer generated words.
# Uses the Dictionary Module to generate new words

require_relative 'dictionary'

class ComputerPlayer
  attr_reader :word
  include Dictionary
  
  def initialize
    @word = nil
  end

  def generate_random_word
    dictionary_array.sample
  end
end

comp = ComputerPlayer.new
p comp.generate_random_word

