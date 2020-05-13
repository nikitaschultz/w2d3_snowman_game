require_relative('Game')
require_relative('HiddenWord')
require_relative('Player')

def get_data
  system("clear")
  p "Please type the secret word or phrase: (Make sure the player can't see you!)"
  hidden_word = gets.chomp
  system("clear")
  p "Hello player and welcome to the game!"
  p "Please type your name:"
  player_name = gets.chomp
  player = Player.new(player_name)
  hidden_word = HiddenWord.new(hidden_word)
  @game = Game.new(player, hidden_word)
  system("clear")
  p "Hello #{@game.player.name}!"
  p "Try and guess all of the letters in the word before the snowman melts!"
  p "You can guess 6 wrong letters before the snowman will melt."
end

def process_guess(game, user_guess)
  @game.make_a_guess(user_guess)
  @game.check_result
end

def game_won(game)
  system("clear")
  p @game.display_hidden_word
  p "⛄" * @game.player.lives
  p "Congratulations #{@game.player.name}!"
  p "You found the hidden word before the snowman melted!"
end

def game_lost(game)
  p "Oh no!  The snowman has melted!"
end

def run_game(game)
  get_data()
  while @game.result == "playing"
    p "⛄" * @game.player.lives
    if @game.guessed_letters.length != 0
      p "You have already guessed: #{@game.guessed_letters.join(', ')}."
    end
    p "What is your guess?"
    p @game.display_hidden_word
    user_guess = gets.chomp()
    process_guess(@game, user_guess)
    system("clear")
  end

  if @game.result == "won"
    game_won(@game)
  elsif @game.result == "lost"
    game_lost(@game)
  end

  p "Do you want to play again? (Y/N)"
  play_again = gets.chomp()
  if play_again.upcase() == "Y"
    run_game(game)
  end
end

run_game(@game)
