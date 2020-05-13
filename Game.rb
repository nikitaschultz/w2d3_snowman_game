class Game

  attr_accessor :player, :hidden_word, :guessed_letters, :guess, :result

  def initialize(player, hidden_word)
    @player = player
    @hidden_word = hidden_word
    @guessed_letters = []
    @guess = ""
    @result = ""
  end

end
