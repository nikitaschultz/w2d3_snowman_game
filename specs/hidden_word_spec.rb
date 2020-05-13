require('minitest/autorun')
require('minitest/reporters')

require_relative('../HiddenWord')
require_relative('../Game')
require_relative('../Player')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class TestHiddenWord < MiniTest::Test
  def setup()
    @hidden_word = HiddenWord.new("Password")
  end

  def test_initialize_hidden_word
    assert_equal("Password", @hidden_word.word)
  end

  def test_display_hidden_word_no_guesses
    assert_equal("********", @hidden_word.display)
  end
end
