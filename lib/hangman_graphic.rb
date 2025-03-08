module HangmanGraphic
  def unfurl_hangman(guesses_remaining)
    case guesses_remaining
    when 10
      puts ""
    when 9
      puts "--------"
    when 8
      puts "    |"
      puts "    |"
      puts "    |"
      puts "    |"
      puts "    |"
      puts "--------"
    when 7
      puts "    -----"
      puts "    |"
      puts "    |"
      puts "    |"
      puts "    |"
      puts "    |"
      puts "--------"
    when 6
      puts "    ------"
      puts "    |    |"
      puts "    |"
      puts "    |"
      puts "    |"
      puts "    |"
      puts "--------"
    when 5
      puts "    ------"
      puts "    |    |"
      puts "    |    O"
      puts "    |"
      puts "    |"
      puts "    |"
      puts "--------"
    when 4
      puts "    ------"
      puts "    |    |"
      puts "    |    O"
      puts "    |   / "
      puts "    |"
      puts "    |"
      puts "--------"
    when 3
      puts "    ------ "
      puts "    |    | "
      puts "    |    O "
      puts "    |   /|"
      puts "    |"
      puts "    |"
      puts "--------"
    when 2
      puts "    ------ "
      puts "    |    | "
      puts "    |    O "
      puts "    |   /|\\"
      puts "    |"
      puts "    |"
      puts "--------"
    when 1
      puts "    ------ "
      puts "    |    | "
      puts "    |    O "
      puts "    |   /|\\"
      puts "    |   /  "
      puts "    |"
      puts "--------"
    when 0
      puts "    ------ "
      puts "    |    | "
      puts "    |    X "
      puts "    |   /|\\"
      puts "    |   / \\"
      puts "    |"
      puts "--------"
    end
  end
end
