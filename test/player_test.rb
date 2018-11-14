require "minitest/autorun"
require "minitest/pride"
require "pry"
require "./lib/board"
require "./lib/player"

class PlayerTest < Minitest::Test
  def test_it_exists
    player = Player.new("Leia", "X")
    assert_instance_of Player, player
  end

  def test_it_has_a_name
    player = Player.new("Leia", "X")
    assert_equal "Leia", player.name
  end

  def test_it_has_a_chip
    player = Player.new("Leia", "X")
    assert_equal "X", player.chip
  end

  def test_it_gets_input
    skip
    # enter A when prompted
    player = Player.new("Leia", "X")
    assert_equal "A", player.get_input
  end
end
