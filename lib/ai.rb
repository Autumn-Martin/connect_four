require "pry"

class AI
  attr_reader :name, :chip
  def initialize(name, chip)
    @name = name
    @chip = chip
  end

  def get_input
    letters = ["A","B","C","D","E","F","G"]
    letters.sample # picks a random element
  end
end
