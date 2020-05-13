require('minitest/autorun')
require('minitest/reporters')

require_relative('../HiddenWord')
require_relative('../Game')
require_relative('../Player')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class TestHiddenWord < MiniTest::Test
  def setup()
    @player = Player.new("Nikita")
    @hidden_word = HiddenWord.new("Password")
    @game = Game.new(@player, @hidden_word)
  end

  def test_initialize_hidden_word
    assert_equal("Password", @hidden_word.word)
  end

  def test_letter_true
    assert_equal(true, @hidden_word.check_letter("A"))
  end

  def test_letter_false
    assert_equal(false, @hidden_word.check_letter("x"))
  end


end
