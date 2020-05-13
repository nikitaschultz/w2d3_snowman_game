require('minitest/autorun')
require('minitest/reporters')

require_relative('../Player')
require_relative('../Game')
require_relative('../HiddenWord')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class TestPlayer < MiniTest::Test
  def setup()
    @player = Player.new("Nikita")
  end

  def test_check_player_initialize
    assert_equal("Nikita", @player.name)
    assert_equal(6, @player.lives)
  end
end
