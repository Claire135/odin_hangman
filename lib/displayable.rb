module Displayable

  def game_display(word_strip, discarded_letters)
    display_word_strip(word_strip)
    display_discarded_letters(discarded_letters)
  end

  def display_word_strip(word_strip)
    puts word_strip.join(" ")
  end

  def display_discarded_letters(discarded_letters)
    puts "Incorrect letters: #{discarded_letters.join(", ")}"
  end

  def win_game_ui
    puts "Well done you guess the word! :D "
  end

  def lose_game_ui
    puts "No luck this time! :("

end