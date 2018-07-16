require "minitest/autorun"
require "minitest/pride"
require "pry"
require "./lib/board"
require "./lib/player"
require "./lib/ai"

class AITest < Minitest::Test
  def test_it_exists
    ai = AI.new("Alexa")
    assert_instance_of AI, ai
  end

  def test_it_has_a_name
    ai = AI.new("Alexa")
    assert_equal "Alexa", ai.name
  end 

end
