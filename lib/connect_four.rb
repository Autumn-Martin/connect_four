require "./lib/board"

puts "Welcome! Let's play Connect Four!"
board = Board.new

puts "Which slot would you like to select? Enter A,B,C,D,E,F, or G. >"
input = gets.chomp.upcase

board.change_slots(input)
# if guess_input == "A"
# if guess_input == "B"
# take user input, check that column -> find.first slot with "."
  # -> change slot to "X"
# implement the computer's turn
  # pick random column letter -> same loop
