require "minitest/autorun"
require "minitest/pride"
require "./lib/game"

class GameTest < Minitest::Test
  def setup
    @player_1 = AI.new("Autumn", "X")
    @player_2 = AI.new("Alexa", "O")
    @game = Game.new(@player_1, @player_2)
  end

  def test_it_exists
    assert_instance_of Game, @game
  end

  def test_it_has_a_board
    assert_instance_of Board, @game.board
  end

  def test_it_has_players
    assert_equal @player_1, @game.player_1 # can I extract what I turned in
    assert_equal @player_2, @game.player_2
  end


end
