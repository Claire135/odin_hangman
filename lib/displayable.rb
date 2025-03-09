# Generates and coordinates the display for word being guessed (word strip), discarded letters and the hangman.

module Displayable
  include HangmanGraphic

  def game_display(word_strip, discarded_letters, guesses_remaining)
    display_discarded_letters(discarded_letters)
    unfurl_hangman(guesses_remaining)
    display_word_strip(word_strip)
  end

  def display_word_strip(word_strip)
    puts word_strip.join(" ")
    puts("")
  end

  def display_discarded_letters(discarded_letters)
    puts "Incorrect letters: #{discarded_letters.sort.join(", ")}"
  end

  def win_game_ui
    puts "Well done you guessed the word! :D "
  end

  def lose_game_ui(word)
    puts "No luck this time! :( The answer was #{word}."
  end
end