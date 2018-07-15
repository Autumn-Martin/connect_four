require "pry"
class Board
  attr_reader :slots

  def initialize
    # by rows
    # @slots = {
    #   letter: ["A","B","C","D","E","F","G"],
    #   "row6" => [".",".",".",".",".",".","."],
    #   "row5" => [".",".",".",".",".",".","."],
    #   "row4" => [".",".",".",".",".",".","."],
    #   "row3" => [".",".",".",".",".",".","."],
    #   "row2" => [".",".",".",".",".",".","."],
    #   "row1" => [".",".",".",".",".",".","."]
    # }

    @column_names = ["A","B","C","D","E","F","G"]

    @slots = {
      "A" => [".",".",".",".",".","."], # left to right is bottom to top
      "B" => [".",".",".",".",".","."],
      "C" => [".",".",".",".",".","."],
      "D" => [".",".",".",".",".","."],
      "E" => [".",".",".",".",".","."],
      "F" => [".",".",".",".",".","."],
      "G" => [".",".",".",".",".","."]
    }

    @draw_board = draw_board

  end

  def draw_board
    draw_letters
    draw_slots
  end

  def draw_letters
    slots.each do |letter, slot|
      print letter
    end
    puts
  end

  def draw_slots
    count = 0
    until count == 7
      slots.each do |letter, slot|
          print slot[count]
      end
      count += 1
      puts
    end
  end

  def fill_slot(input)
    open_slot_index = find_open_slot(input)
    place_chip(input, open_slot_index)
    draw_board
  end

  def find_open_slot(input)
    @slots[input].find_index do |slot|
      "."
    end  #=> 0 (#class = integer)
  end

  def place_chip(input, open_slot_index)
    @slots[input][open_slot_index] = "X"
  end



end
