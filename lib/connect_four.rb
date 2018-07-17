require "./lib/board"
require "./lib/player"
require "./lib/ai"

puts "Hello, what is your name?"
name = gets.chomp
player = Player.new(name)
ai = AI.new("Alexa")

puts "Welcome #{name}! Let's play Connect Four!"
board = Board.new

# puts "Which slot would you like to select? Enter A,B,C,D,E,F, or G. >"
# input = gets.chomp.upcase
chip = player.chip
player_input = player.get_input
board.fill_slot(player_input, chip)

chip = ai.chip
ai_input = ai.get_input
board.fill_slot(ai_input, chip)

# take user input, check that column -> find.first slot with "."
  # -> change slot to "X"
# implement the computer's turn
  # pick random column letter -> same loop
