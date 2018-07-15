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
    slots.each do |letter, slot|
      print letter
    end
    puts
    count = 0
    until count == 7
      slots.each do |letter, slot|
          print slot[count]
      end
      count += 1
      puts
    end
  end

  # def draw_board
  #   layout = slots.map do |row, value|
  #     value.join.scan(/.{1,7}/) <<"\n"
  #   end
  #   puts layout.join
  # end


  # def change_board
  #
  # end
end
