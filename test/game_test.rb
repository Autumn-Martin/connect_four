require "minitest/autorun"
require "minitest/pride"
require "./lib/game"

class GameTest < Minitest::Test
  def test_it_exists
    game = Game.new
    assert_instance_of Game, game
  end

  def test_it_has_a_board
    game = Game.new
    assert_instance_of Board, game.board
  end
end
