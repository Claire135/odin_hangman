# Stores human guess
# Controls guess input

class HumanPlayer
  attr_reader :guess

  def initialize
    @guess = nil
  end

  def get_player_guess
    loop do
      puts "Guess a letter!"
      @guess = gets.chomp.downcase
      return @guess if ('a'..'z').include?(@guess)
      raise StandardError, 'Please enter a valid letter (in the English alphabet!).' unless ('a'..'z').include?(@guess)
      break
    rescue StandardError => e
      puts e.message
      retry
    end
  end

end