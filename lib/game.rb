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
      @board.fill_slot(input, chip)
      board.draw_board
      if game_over == true
        end_game
      else  # switch/turn
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

  def game_over
    if board.top_row_empty? == false
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
