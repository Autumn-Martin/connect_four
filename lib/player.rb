require "pry"
class Player
  attr_reader :name, :chip
  def initialize(name, chip)
    @name = name
    @chip = chip
  end

  def get_input
    puts "Which slot would you like to select? Enter A,B,C,D,E,F, or G. >"
    gets.chomp.upcase
  end

end
