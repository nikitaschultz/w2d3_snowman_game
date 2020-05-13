require('minitest/autorun')
require('minitest/reporters')

require_relative('../Runner')
require_relative('../Game')
require_relative('../HiddenWord')
require_relative('../Player')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class TestRunner < MiniTest::Test
  def setup()
    @player = Player.new("Nikita")
    @hidden_word = HiddenWord.new("Wheel of fortune")
    @game = Game.new(@player, @hidden_word)
  end

  def test_initial_display
    assert_equal("***** ** *******", initial_display(@game))
  end
  #
  def test_process_guess_correct
    process_guess(@game, "r")
    assert_equal(6, @game.player.lives)
    assert_equal("playing", @game.result)
    assert_equal(1, @game.guessed_letters.length)
  end

  def test_process_guess_incorrect
    process_guess(@game, "x")
    assert_equal(5, @game.player.lives)
    assert_equal("playing", @game.result)
    assert_equal(1, @game.guessed_letters.length)
  end

  def test_process_guess_to_win_game
    process_guess(@game, "w")
    process_guess(@game, "h")
    process_guess(@game, "e")
    process_guess(@game, "l")
    process_guess(@game, "v")
    process_guess(@game, "o")
    process_guess(@game, "f")
    process_guess(@game, "r")
    process_guess(@game, "t")
    process_guess(@game, "m")
    process_guess(@game, "u")
    process_guess(@game, "n")
    assert_equal(4, @game.player.lives)
    assert_equal("won", @game.result)
    assert_equal(12, @game.guessed_letters.length)
  end

  def test_process_guess_to_lose_game
    process_guess(@game, "b")
    process_guess(@game, "x")
    process_guess(@game, "v")
    process_guess(@game, "o")
    process_guess(@game, "c")
    process_guess(@game, "n")
    process_guess(@game, "d")
    process_guess(@game, "q")
    assert_equal(0, @game.player.lives)
    assert_equal("lost", @game.result)
    assert_equal(8, @game.guessed_letters.length)
  end

end
