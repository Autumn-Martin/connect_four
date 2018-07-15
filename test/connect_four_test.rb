require "minitest/autorun"
require "minitest/pride"
require "pry"
require "./lib/connect_four"

# need to make a connect four class
class ConnectFourTest < Minitest::Test

  def test_it_exists
    connect_four = ConnectFour.new
    assert_instance_of ConnectFour, connect_four
  end
end
