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
    if board.column_open?(input)
      open_slot_index = @board.find_open_slot(input)
      @board.place_chip(input, open_slot_index, chip)
      board.draw_board
      if game_over(input, chip, open_slot_index) == true
        end_game
      else
        switch
        turn
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

  def game_over(input, chip, open_slot_index)
    if board.top_row_empty? == false
      true
    elsif board.check_vertical_win(input, chip)
      true
    elsif board.check_horizontal_win(open_slot_index, chip)
      true
    else
      false
    # elsif board.horizontal?
    #   puts "There's a winner!"
    # elsif board.vertical?
    #   puts "There's a winner!"
    end
  end

  def end_game
    puts "Game Over!"
    board.draw_board
  end
end
