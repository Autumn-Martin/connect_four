require "minitest/autorun"
require "minitest/pride"
require "pry"
require "./lib/board"
require "./lib/player"
require "./lib/ai"

class AITest < Minitest::Test
  def test_it_exists
    ai = AI.new("Alexa", "O")
    assert_instance_of AI, ai
  end

  def test_it_has_a_name
    ai = AI.new("Alexa", "O")
    assert_equal "Alexa", ai.name
  end

  def test_it_has_a_chip
    ai = AI.new("Alexa", "O")
    assert_equal "O", ai.chip
  end

  def test_it_gets_input
    # input is random
    ai = AI.new("Alexa", "O")
    refute_nil ai.get_input
  end
end
