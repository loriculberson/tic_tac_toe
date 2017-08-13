class Message

  def welcome
    "Welcome to Tic Tac Toe."
  end

  def player1_name_request
    "Player 1: What is your name?"
  end

  def greet_player1(name)
    "#{name}, you will mark the board with the letter X"
  end

  def player2_name_request
    "Player 2: What is your name?"
  end

  def greet_player2(name)
    "#{name}, you will mark the board with the letter O"
  end

  def how_to_proceed
    "INSTRUCTIONS, press: i    To PLAY, press: p    To QUIT, press: q"
  end
  
  def instructions(name1, name2)
    "Each cell position has an alpha numeric value ranging from A1 to C3 \n" +
    "When it's your turn, enter the alpha numeric cell in which you would like \n"+
    "to make your mark. Your mark has been predetermined for you. \n" +
    "#{greet_player1(name1)}" + "\n" + 
    "#{greet_player2(name2)}"
  end

  def not_valid_command
    "You entered an invalid command."
  end

  def invalid_and_how_to_proceed
    not_valid_command + ' ' + how_to_proceed
  end

  def quit_game
    "Game over!"
  end

  def end_of_game
    "Goodbye"
  end

  def lets_play
    "Alright friends! Let's PLAY!"
  end

  def your_turn(name)
    "#{name} your turn. Enter board position number"
  end
end
