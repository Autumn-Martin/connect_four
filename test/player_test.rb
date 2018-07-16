require "minitest/autorun"
require "minitest/pride"
require "pry"
require "./lib/board"
require "./lib/player"

class PlayerTest < Minitest::Test
  def test_it_exists
    player = Player.new("Leia")
    assert_instance_of Player, player
  end

  def test_it_has_a_name
    puts "What is your name?"
    name = gets.chomp
    player = Player.new(name)
    assert_equal "#{name}", player.name
  end
  
end
