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

  def test_guess_a_letter_changes_array_length
    @game.make_a_guess("a")
    assert_equal(1, @game.guessed_letters.length)
  end

  def test_guess_correct
    assert_equal(true, @game.make_a_guess("a"))
    assert_equal(6, @player.lives)
    assert_equal(false, @game.make_a_guess("x"))
  end

  def test_guess_incorrect
    assert_equal(false, @game.make_a_guess("x"))
    assert_equal(5, @player.lives)
  end

  def test_check_if_guessed_true
    @game.guessed_letters = ["a", "s", "b"]
    assert_equal(true, @game.test_letter("a"))
  end

  def test_check_if_guessed_false
    @game.guessed_letters = ["a", "s", "b"]
    assert_equal(false, @game.test_letter("w"))
  end

  def test_display_hidden_word
    @game.guessed_letters = ["e", "w", "r", "v", "d", "a", "n"]
    assert_equal("*A**W*RD", @game.display_hidden_word)
  end

  def test_display_hidden_word_with_a_space
    @game.guessed_letters = ["e", "w", "r", "v", "d", "a", "n"]
    @game.hidden_word = HiddenWord.new("Pass Word")
    assert_equal("*A** W*RD", @game.display_hidden_word)
  end




end
