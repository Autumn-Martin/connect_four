require "pry"
class Board
  attr_accessor :slots

  def initialize
    # by rows
    # @slots = {
    #   letter: ["A","B","C","D","E","F","G"],
    #   "row6" => [".",".",".",".",".",".","."],
    #   "row" => [".",".",".",".",".",".","."],
    #   "row4" => [".",".",".",".",".",".","."],
    #   "row3" => [".",".",".",".",".",".","."],
    #   "row2" => [".",".",".",".",".",".","."],
    #   "row1" => [".",".",".",".",".",".","."]
    # }

    @column_names = ["A","B","C","D","E","F","G"]

    @slots = {
      "A" => [".",".",".",".",".","."], # left to right is top to bottom
      "B" => [".",".",".",".",".","."],
      "C" => [".",".",".",".",".","."],
      "D" => [".",".",".",".",".","."],
      "E" => [".",".",".",".",".","."],
      "F" => [".",".",".",".",".","."],
      "G" => [".",".",".",".",".","."]
    }

    # @draw_board = draw_board

  end

  def draw_board
    draw_letters
    draw_slots
  end

  def draw_letters
    slots.each do |letter, slot|
      print letter
    end
  end

  def draw_slots
    count = 6
    until count < 0
      slots.each do |letter, slot|
        print slot[count]
      end
      count -= 1
      puts
    end
  end

  def fill_slot(input, chip)
    open_slot_index = find_open_slot(input)
    place_chip(input, open_slot_index, chip)
  end

  def slot_open?(input)
    @slots[input][5] == "."
  end

  def find_open_slot(input)
    @slots[input].find_index do |slot|
      slot == "."
    end  #=> 0 (#class = integer)
  end

  def place_chip(input, open_slot_index, chip)
    @slots[input][open_slot_index] = chip
  end

  def top_row
    [@slots["A"][5], @slots["B"][5], @slots["C"][5], @slots["D"][5], @slots["E"][5], @slots["F"][5], @slots["G"][5]]
  end

  def top_row_empty? # renaming to make more sense with output
    top_row.any? {|slot| slot == "."} #=> true if not full; false if full
  end

   
end
