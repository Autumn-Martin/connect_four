require "minitest/autorun"
require "minitest/pride"
require "pry"
require "./lib/board"
require "./lib/player"

class PlayerTest < Minitest::Test
  def test_it_exists
    player = Player.new
    assert_instance_of Player, player
  end
end
