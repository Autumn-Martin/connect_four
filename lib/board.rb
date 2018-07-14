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


    @print_board = print_board

  end
  def print_board
    board = slots[:row_letter], slots["row6"]
    print board
  end
    #or
    # columns organized by letters
    # @slots = {
    #   "G" => [".",".",".",".",".","."],
    #   "F" => [".",".",".",".",".","."],
    #   "E" => [".",".",".",".",".","."],
    #   "D" => [".",".",".",".",".","."],
    #   "C" => [".",".",".",".",".","."],
    #   "B" => [".",".",".",".",".","."],
    #   "A" => [".",".",".",".",".","."]
    # }
  # def print_board
  #   row1 = slots["A"][0]+ slots["B"][]
  #   print board
  # end

end
