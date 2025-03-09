# frozen_string_literal: true

# Generates prompts for playing again, saving and loading

module GameMenu
  def play_again_prompt
    puts 'Do you want to play again? (y/n)'
    input = gets.chomp.downcase
    if input == 'y'
      GameLauncher.start
    else
      puts 'Thanks for playing!'
      exit
    end
  end

  def save_or_load_prompt
    puts 'Would you like to save or load the game? (s to save, l to load, any other key to continue)'
    choice = gets.chomp.downcase

    case choice
    when 's'
      GameManager.save(@logic)
    when 'l'
      GameManager.load(@logic)
    else
      # Do nothing, continue with the game
    end
  end

  def game_start_or_load_prompt
    puts 'Welcome to Hangman!'
    puts 'Would you like to start a new game or load a saved one? (n for new, l for load)'
    choice = gets.chomp.downcase

    if choice == 'l'
      GameManager.load(@logic)
    elsif choice == 'n'
      # Start a new game - already done in the constructor with @logic
    else
      puts 'Invalid choice. Starting a new game.'
    end
  end
end
