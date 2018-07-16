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
    skip
    puts "What is your name?"
    name = gets.chomp
    player = Player.new(name)
    assert_equal "#{name}", player.name
  end

  def test_it_has_a_chip
    player = Player.new("Leia")
    assert_equal "X", player.chip
  end

  def test_it_gets_input
    # enter A when prompted 
    player = Player.new("Leia")
    assert_equal "A", player.get_input
  end
end
