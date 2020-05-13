class HiddenWord

  attr_reader :word

  def initialize(word)
    @word = word
  end

  def check_letter(letter)
    word_array = @word.chars()
    for character in word_array
      if character.upcase == letter.upcase
        return true
      end
    end
    return false
  end

  

end
