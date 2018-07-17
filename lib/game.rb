require "./lib/board"
require "./lib/ai"
require "./lib/player"

class Game
  attr_reader :board, :player_1, :player_2
  def initialize(player_1, player_2)
    @player_1 = player_1
    @player_2 = player_2
    @board = Board.new
    welcome
    turn(player_1)
  end

  def welcome
    puts "Welcome #{player_1.name}! Let's play Connect Four!"
  end

  def turn(player)
    input = player.get_input
    chip = player.chip
    if board.slot_open?(input)
      board.fill_slot(input, chip)
    else
      turn(player)
    end
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
