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

  def test_can_detect_pattern_of_four_x_in_a_row?
    board = Board.new

    grouped_chips = [["X", ["X", "X", "X", "X"]], [".", [".", "."]]]

    assert board.four_x_in_a_row?(grouped_chips)
  end

  def test_can_detect_pattern_of_four_o_in_a_row?
    board = Board.new

    grouped_chips = [["O", ["O", "O", "O", "O"]], [".", [".", "."]]]

    assert board.four_o_in_a_row?(grouped_chips)
  end

  def test_can_check_for_a_vertical_win_when_chip_is_x
    board = Board.new
    input = "A"
    chip = "X"

    board.slots["A"][0] = "X"
    board.slots["A"][1] = "X"
    board.slots["A"][2] = "X"
    board.slots["A"][3] = "X"
    board.slots["A"][4] = "."
    board.slots["A"][5] = "."

    assert board.check_vertical_win(input, chip)

    board.slots["A"][0] = "X"
    board.slots["A"][1] = "X"
    board.slots["A"][2] = "X"
    board.slots["A"][3] = "."
    board.slots["A"][4] = "."
    board.slots["A"][5] = "."

    refute board.check_vertical_win(input, chip)
  end

  def test_can_check_for_a_vertical_win_when_chip_is_o
    board = Board.new
    input = "A"
    chip = "O"

    board.slots["A"][0] = "O"
    board.slots["A"][1] = "O"
    board.slots["A"][2] = "O"
    board.slots["A"][3] = "O"
    board.slots["A"][4] = "."
    board.slots["A"][5] = "."

    assert board.check_vertical_win(input, chip)

    board.slots["A"][0] = "."
    board.slots["A"][1] = "."
    board.slots["A"][2] = "."
    board.slots["A"][3] = "."
    board.slots["A"][4] = "."
    board.slots["A"][5] = "."

    refute board.check_vertical_win(input, chip)
  end

  def test_can_check_for_a_horizontal_win_when_chip_is_x
    board = Board.new
    input = "A"
    chip = "X"

    open_slot_index = board.find_open_slot(input) #=> 0
    board.place_chip(input, open_slot_index, chip)
    board.row_of_last_placed_chip(open_slot_index)

    board.slots["A"][0] = "X"
    board.slots["B"][0] = "X"
    board.slots["C"][0] = "X"
    board.slots["D"][0] = "X"
    board.slots["E"][0] = "."
    board.slots["F"][0] = "."
    board.slots["G"][0] = "."

    assert board.check_horizontal_win(open_slot_index, chip)

    board.slots["A"][0] = "."
    board.slots["B"][0] = "."
    board.slots["C"][0] = "."
    board.slots["D"][0] = "."
    board.slots["E"][0] = "."
    board.slots["F"][0] = "."
    board.slots["G"][0] = "."

    refute board.check_horizontal_win(open_slot_index, chip)
  end

  def test_can_check_for_a_horizontal_win_when_chip_is_o
    board = Board.new
    input = "A"
    chip = "O"

    open_slot_index = board.find_open_slot(input) #=> 0
    board.place_chip(input, open_slot_index, chip)
    board.row_of_last_placed_chip(open_slot_index)

    board.slots["A"][0] = "O"
    board.slots["B"][0] = "O"
    board.slots["C"][0] = "O"
    board.slots["D"][0] = "O"
    board.slots["E"][0] = "."
    board.slots["F"][0] = "."
    board.slots["G"][0] = "."

    assert board.check_horizontal_win(open_slot_index, chip)

    board.slots["A"][0] = "."
    board.slots["B"][0] = "."
    board.slots["C"][0] = "."
    board.slots["D"][0] = "."
    board.slots["E"][0] = "."
    board.slots["F"][0] = "."
    board.slots["G"][0] = "."

    refute board.check_horizontal_win(open_slot_index, chip)
  end

  def test_can_create_row_based_on_recent_chip_placement
      board = Board.new
      input = "A"
      chip = "X"

      board.slots["A"][0] = "." #=> board.slots["A"][0] = "X"
      board.slots["B"][0] = "X"
      board.slots["C"][0] = "X"
      board.slots["D"][0] = "X"
      board.slots["E"][0] = "O"
      board.slots["F"][0] = "O"
      board.slots["G"][0] = "."

      open_slot_index = board.find_open_slot(input) #=> 0
      board.place_chip(input, open_slot_index, chip)

      actual =board.row_of_last_placed_chip(open_slot_index)
      assert_equal ["X","X","X","X","O","O","."], actual
  end

  def test_can_group_the_row_made_based_on_recent_chip_placement
    board = Board.new
    input = "A"
    chip = "X"

    board.slots["A"][0] = "." #=> board.slots["A"][0] = "X"
    board.slots["B"][0] = "X"
    board.slots["C"][0] = "X"
    board.slots["D"][0] = "X"
    board.slots["E"][0] = "O"
    board.slots["F"][0] = "O"
    board.slots["G"][0] = "."

    open_slot_index = board.find_open_slot(input) #=> 0
    board.place_chip(input, open_slot_index, chip)
    board.row_of_last_placed_chip(open_slot_index)

    expected = [["X", ["X","X","X","X"]], ["O", ["O","O"]], [".", ["."]]]

    assert_equal expected, board.group_row(open_slot_index)
  end

end
