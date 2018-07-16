require "./lib/board"
require "./lib/player"

puts "Hello, what is your name?"
name = gets.chomp
player = Player.new(name)

puts "Welcome #{name}! Let's play Connect Four!"
board = Board.new

puts "Which slot would you like to select? Enter A,B,C,D,E,F, or G. >"
input = gets.chomp.upcase

board.fill_slot(input)
# if guess_input == "A"
# if guess_input == "B"
# take user input, check that column -> find.first slot with "."
  # -> change slot to "X"
# implement the computer's turn
  # pick random column letter -> same loop
