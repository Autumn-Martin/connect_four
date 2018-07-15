require "pry"
class Board
  attr_reader :slots

  def initialize
    # by rows
    @slots = {
      letter: ["A","B","C","D","E","F","G"],
      "row6" => [".",".",".",".",".",".","."],
      "row5" => [".",".",".",".",".",".","."],
      "row4" => [".",".",".",".",".",".","."],
      "row3" => [".",".",".",".",".",".","."],
      "row2" => [".",".",".",".",".",".","."],
      "row1" => [".",".",".",".",".",".","."]
    }

    @draw_board = draw_board

    # @slides = {
    #   "A" => [".",".",".",".",".","."], # left to right is bottom to top
    #   "B" => [".",".",".",".",".","."],
    #   "C" => [".",".",".",".",".","."],
    #   "D" => [".",".",".",".",".","."],
    #   "E" => [".",".",".",".",".","."],
    #   "F" => [".",".",".",".",".","."],
    #   "G" => [".",".",".",".",".","."]
    # }

    # @slides = {
    #   slots[:letter][1] => slots["row6"][1] + slots["row5"][1],
    #   slots[:letter][2] => slots["row6"][2] + slots["row5"][2]
    # }

  end

  def draw_board
    layout = slots.map do |row, value|
      value.join.scan(/.{1,7}/) <<"\n"
    end
    puts layout.join
  end


  # def change_board
  #
  # end
end
