require "pry"
class Player
  attr_reader :name, :chip
  def initialize(name)
    @name = name
    @chip = "X"
  end

  def get_input
    puts "Which slot would you like to select? Enter A,B,C,D,E,F, or G. >"
    gets.chomp.upcase
  end

end
