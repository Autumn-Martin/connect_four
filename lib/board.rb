class Board
  attr_reader :slots

  def initialize
    # by rows
    @slots = {
      row_letter: ["A","B","C","D","E","F","G"],
      "row6" => [".",".",".",".",".",".","."],
      "row5" => [".",".",".",".",".",".","."],
      "row4" => [".",".",".",".",".",".","."],
      "row3" => [".",".",".",".",".",".","."],
      "row2" => [".",".",".",".",".",".","."],
      "row1" => [".",".",".",".",".",".","."]
    }

    @draw_board = draw_board
  end

  def draw_board
    layout = slots.map do |row, value|
      value.join.scan(/.{1,7}/) <<"\n"
    end
    puts layout.join
  end


end
