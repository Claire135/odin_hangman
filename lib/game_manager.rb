# frozen_string_literal: true

# Saves and loads games based on prompts from game menu
require 'json'

class GameManager
  include BasicSerializable
  include GameMenu

  SAVE_FILE = 'save_game.json'

  def self.save(game)
    File.open(SAVE_FILE, 'w') { |file| file.write(game.serialize) }
    puts 'Game Saved!'
  end

  def self.load(game)
    return unless File.exist?(SAVE_FILE)

    saved_data = File.read(SAVE_FILE)
    game.unserialize(saved_data)
    puts 'Game loaded!'
  end
end
