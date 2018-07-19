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
      "A" => [".",".",".",".",".","."], # left to right is bottom to top
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
    puts
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
    puts
  end

  def fill_slot(input, chip)
    open_slot_index = find_open_slot(input)
    place_chip(input, open_slot_index, chip)
  end

  def column_open?(input)
    @slots[input][5] == "."
  end

  def find_open_slot(input)
    open_slot_index = @slots[input].find_index do |slot|
      slot == "."
    end  #=> 0 (#class = integer)
    return open_slot_index
  end

  # def open_slot_index(input)
  #   open_slot_index = @slots[input].find_index do |slot|
  #     slot == "."
  #   end
  # end

  def place_chip(input, open_slot_index, chip)
    @slots[input][open_slot_index] = chip
  end

  def top_row
    [@slots["A"][5], @slots["B"][5], @slots["C"][5], @slots["D"][5], @slots["E"][5], @slots["F"][5], @slots["G"][5]]
  end

  def top_row_empty? # renaming to make more sense with output
    top_row.any? {|slot| slot == "."} #=> true if not full; false if full
  end


  def group_column(input) #=> [[".", ["."]], ["X", ["X", "X", "X", "X"]], [".", ["."]]]
    grouped_column = @slots[input].chunk do |slot|
      slot
    end.to_a
  end

  def four_x_in_a_row(grouped_chips) # detecting 4 in a row
    grouped_chips.any? {|group| group[1].join.include? "XXXX"}
  end

  def four_o_in_a_row(grouped_chips) # detecting 4 in a row
    grouped_chips.any? {|group| group[1].join.include? "OOOO"}
  end

  def check_horizontal_win(input, chip)
    grouped_chips = group_column(input)
    if chip == "X"
      four_x_in_a_row(grouped_chips)
    elsif chip == "O"
      four_o_in_a_row(grouped_chips)
    end
  end
#--------------------------------------------------------------#
  def new_chip_row(open_slot_index)
    [@slots["A"][open_slot_index], @slots["B"][open_slot_index], @slots["C"][open_slot_index], @slots["D"][open_slot_index], @slots["E"][open_slot_index], @slots["F"][open_slot_index], @slots["G"][open_slot_index]]
  end


  def group_row(open_slot_index)
    grouped_row = new_chip_row(open_slot_index).chunk do |slot|
      slot
    end.to_a
  end

  def check_vertical_win(open_slot_index, chip)
    grouped_chips = group_row(open_slot_index)
    if chip == "X"
      four_x_in_a_row(grouped_chips)
    elsif chip == "O"
      four_o_in_a_row(grouped_chips)
    end
  end
  # def horizontal?
  #   if @slots[new_fill_index]  + @slots[new_fill_index - 1] + @slots[new_fill_index - 2] + @slots[new_fill_index - 3] == "XXXX"
  #
  #     true
  #   end
  # end



end
