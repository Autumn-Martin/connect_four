require "./lib/board"

puts "Welcome! Let's play Connect Four!"
board = Board.new

puts "Which slot would you like to select? Enter A,B,C,D,E,F, or G. >"
guess_input = gets.chomp
