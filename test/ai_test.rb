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

  def test_it_has_a_chip
    ai = AI.new("Alexa")
    assert_equal "O", ai.chip
  end
#------------ this test will need a refactor--------------------------
  def test_it_gets_input
    # input is random
    ai = AI.new("Alexa")
    assert_equal "A" || "B" || "C" || "D" || "E" || "F" || "G", ai.get_input
  end
end
