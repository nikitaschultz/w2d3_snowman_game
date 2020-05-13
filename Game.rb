class Game

  attr_accessor :player, :hidden_word, :guessed_letters, :guess, :result

  def initialize(player, hidden_word)
    @player = player
    @hidden_word = hidden_word
    @guessed_letters = []
    @result = "playing"
  end

  def make_a_guess(letter)
    if letter.length != 1
      letter = letter.chr
    end
    @guessed_letters.push(letter)
    if @hidden_word.check_letter(letter) == true
      return true
    else
      @player.lives -= 1
      return false
    end
  end

  def test_letter(letter)
    for character in @guessed_letters
      if character.upcase() == letter.upcase()
        return true
      end
    end
    return false
  end

  def display_hidden_word
    display_array = []
    hidden_word_array = @hidden_word.word.chars()
    for character in hidden_word_array
      if character == " "
        display_array.push(character)
      elsif test_letter(character) == true
        display_array.push(character.upcase())
      else
        display_array.push("*")
      end
    end
    return display_array.join()
  end

  def check_result
    if player.lives == 0
      @result = "lost"
    elsif display_hidden_word = @hidden_word
      @result = "won"
    else
      @result = "playing"
    end
  end

end
