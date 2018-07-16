require "pry"
class Player
  attr_reader :name, :chip
  def initialize(name)
    @name = name
    @chip = "X"
  end
end
