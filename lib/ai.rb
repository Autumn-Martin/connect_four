require "pry"

class AI
  attr_reader :name, :chip
  def initialize(name)
    @name = name
    @chip = "O"
  end

  def get_input
    letters = ["A","B","C","D","E","F","G"]
    letters.sample # picks a random element
  end
end
