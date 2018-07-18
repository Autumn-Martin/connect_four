require "./lib/board"
require "./lib/ai"
require "./lib/player"

class Game
  attr_reader :board, :player_1, :player_2, :current_player
  def initialize(player_1, player_2)
    @player_1 = player_1
    @player_2 = player_2
    @current_player = player_1
    @board = Board.new
    welcome
    turn
  end

  def welcome
    puts "Welcome #{player_1.name}! Let's play Connect Four!"
    board.draw_board
  end

  def turn
    input = current_player.get_input
    chip = current_player.chip
    if board.slot_open?(input)
      @board.fill_slot(input, chip)
      board.draw_board
      if board.top_row_empty?
        switch
        turn
      else
        end_game
      end
    else
      puts "This spot is full. Try again!"
      turn
    end
  end

  def switch
    if current_player == player_1
      @current_player = player_2
    elsif current_player == player_2
      @current_player = player_1
    end
  end

  def end_game
    puts "Game Over!"
    board.draw_board
  end
end

# while board.empty? == true
#   chip = ai.chip
#   ai_input = ai.get_input
#   if @slots["A"].include? "." == true
#     board.fill_slot(ai_input, chip)
#   else
#     ai_

# while .any? of the top row has "." == true (|| win == false)
  #get computer input
    # if column not filled (if .include? "." == true)
      #fill first empty spot
    # if column filled
      #get another input

  # get player input
    # if column not filled (if .include? "." == true)
      #fill first empty spot
    # if column filled
      #get another input
#end
