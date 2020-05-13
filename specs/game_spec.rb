require('minitest/autorun')
require('minitest/reporters')

require_relative('../Game')
require_relative('../Player')
require_relative('../HiddenWord')


Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class TestGame < MiniTest::Test
  def setup()
    @player = Player.new("Nikita")
    @hidden_word = HiddenWord.new("Password")
    @game = Game.new(@player, @hidden_word)
  end

  def test_initialize_game
    assert_equal("Nikita", @game.player.name)
    assert_equal("Password", @game.hidden_word.word)
    assert_equal(0, @game.guessed_letters.length)
    assert_equal("", @game.guess)
    assert_equal("", @game.result)
  end
end
