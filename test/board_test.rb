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

  def test_slot_open_returns_true_if_slot_is_available
    board = Board.new
    input = "A"

    assert board.slot_open?(input)
  end

  def test_slot_open_returns_false_if_slot_is_unavailable
    board = Board.new
    input = "A"
    board.slots["A"][0] = "X"
    board.slots["A"][1] = "X"
    board.slots["A"][2] = "X"
    board.slots["A"][3] = "X"
    board.slots["A"][4] = "X"
    board.slots["A"][5] = "X"

    refute board.slot_open?(input)
  end

  # def test_it_places_chip_in_open_slot
  #   board = Board.new
  #   input = "A"
  #   open_slot_index = board.find_open_slot(input)
  #   assert_equal "X", board.place_chip(input, open_slot_index, chip)
  # end

  def test_it_has_a_top_row
    board = Board.new
    assert_equal [".",".",".",".",".",".","."], board.top_row
  end

  def test_can_tell_if_top_row_is_full # split this up later
    board = Board.new
    # set each element equal to "." or "X" or "O" in test
    board.slots["A"][5] = "."
    board.slots["B"][5] = "."
    board.slots["C"][5] = "."
    board.slots["D"][5] = "."
    board.slots["E"][5] = "."
    board.slots["F"][5] = "."
    board.slots["G"][5] = "."
    assert board.top_row_empty?

    board.slots["A"][5] = "X"
    board.slots["B"][5] = "X"
    board.slots["C"][5] = "X"
    board.slots["D"][5] = "O"
    board.slots["E"][5] = "O"
    board.slots["F"][5] = "O"
    board.slots["G"][5] = "X"
    refute board.top_row_empty?
  end

  def test_can_tell_four_in_a_row_horizontally
    board = Board.new
    board.slots["A"][0] = "X"
    board.slots["B"][0] = "X"
    board.slots["C"][0] = "X"
    board.slots["D"][0] = "X"
    assert board.horzontal?
  end

end
