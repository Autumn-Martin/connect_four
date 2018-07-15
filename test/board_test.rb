require "minitest/autorun"
require "minitest/pride"
require "pry"
require "./lib/board"

class BoardTest < Minitest::Test

  def test_it_exists
    board = Board.new
    assert_instance_of Board, board
  end

  def test_it_finds_open_slot
    board = Board.new
    input = "A"
    assert_equal 0, board.find_open_slot(input)
  end

  def test_it_places_chip_in_open_slot
    board = Board.new
    input = "A"
    open_slot_index = board.find_open_slot(input)
    assert_equal "X", board.place_chip(input, open_slot_index)
  end
end
