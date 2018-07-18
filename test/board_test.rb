require "minitest/autorun"
require "minitest/pride"
require "pry"
require "./lib/board"

class BoardTest < Minitest::Test

  def test_it_exists
    board = Board.new
    assert_instance_of Board, board
  end

  def test_can_tell_if_column_is_available
    board = Board.new
    input = "A"

    assert board.column_open?(input)
  end

  def test_can_tell_if_column_is_unavailable
    board = Board.new
    input = "A"
    board.slots["A"][0] = "X"
    board.slots["A"][1] = "X"
    board.slots["A"][2] = "X"
    board.slots["A"][3] = "X"
    board.slots["A"][4] = "X"
    board.slots["A"][5] = "X"

    refute board.column_open?(input)
  end

  def test_slots_can_be_filled # integration test
    board = Board.new
    input = "A"
    chip = "X"

    open_slot_index = board.find_open_slot(input)
    board.place_chip(input, open_slot_index, chip)

    assert_equal "X", board.fill_slot(input, chip)
  end

  def test_it_finds_first_available_open_slot
    board = Board.new
    input = "A"

    assert_equal 0, board.find_open_slot(input)

    board.slots["A"][0] = "X"
    board.slots["A"][1] = "X"
    board.slots["A"][2] = "X"
    board.slots["A"][3] = "X"
    board.slots["A"][4] = "."
    board.slots["A"][5] = "."

    assert_equal 4, board.find_open_slot(input)
  end

  def test_it_replaces_empty_slot_with_chip
    board = Board.new
    input = "A"
    chip = "X"
    open_slot_index = 0

    assert_equal "X", board.place_chip(input, open_slot_index, chip)
  end

  def test_it_has_a_top_row
    board = Board.new
    assert_equal [".",".",".",".",".",".","."], board.top_row
  end

  def test_can_tell_if_top_row_is_empty
    board = Board.new
    # set top row elements equal to "." in test
    board.slots["A"][5] = "."
    board.slots["B"][5] = "."
    board.slots["C"][5] = "."
    board.slots["D"][5] = "."
    board.slots["E"][5] = "."
    board.slots["F"][5] = "."
    board.slots["G"][5] = "."
    assert board.top_row_empty?
  end

  def test_can_tell_if_top_row_is_full
    board = Board.new
    # set top row elements equal to "X" or "O"  in test
    board.slots["A"][5] = "X"
    board.slots["B"][5] = "X"
    board.slots["C"][5] = "X"
    board.slots["D"][5] = "O"
    board.slots["E"][5] = "O"
    board.slots["F"][5] = "O"
    board.slots["G"][5] = "X"

    refute board.top_row_empty?
  end

  def test_can_group_columns_by_nonunique_elements_in_a_row #by same type of chip/no chip
    board = Board.new
    input = "A"

    board.slots["A"][0] = "X"
    board.slots["A"][1] = "X"
    board.slots["A"][2] = "X"
    board.slots["A"][3] = "X"
    board.slots["A"][4] = "."
    board.slots["A"][5] = "."

    expected = [["X", ["X", "X", "X", "X"]], [".", [".", "."]]]


    assert_equal expected, board.group_column(input)
  end




  # def test_can_tell_four_in_a_row_horizontally
  #   board = Board.new
  #   board.slots["A"][0] = "X"
  #   board.slots["B"][0] = "X"
  #   board.slots["C"][0] = "X"
  #   board.slots["D"][0] = "X"
  #   assert board.horizontal?
  # end

end
