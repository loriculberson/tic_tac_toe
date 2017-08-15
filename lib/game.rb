class Game
  attr_reader :player1, :player2

  def initialize(instream, outstream, message)
    @board = Board.new
    @player1 = Player.new(@board, "X")
    @player2 = Player.new(@board, "O")
    @current_player = @player2
    @instream = instream
    @outstream = outstream
    @message = message
    @its_over = false
  end

  def play
    @outstream.puts @message.lets_play
    until won? || tied? 
      set_current_player
      display_board
      @outstream.puts @message.your_turn(current_player_name)
      player_takes_turn(get_valid_position)
      if won?
        @outstream.puts @message.winner_declared(winning_player)
      elsif tied?
        @outstream.puts @message.game_tied
      end
    end
    game_over
    display_board
  end

  def player1_name=(name)
    @player1.name = name
  end

  def player2_name=(name)
    @player2.name = name
  end

  def player1_name
    @player1.name
  end

  def player2_name
    @player2.name
  end

  def its_over?
    @its_over
  end

  def display_board
    puts game_board.split(',')
  end

  private
  def player1_makes_play(position)
    @player1.makes_play(position)
  end

  def player2_makes_play(position)
    @player2.makes_play(position)
  end

  def set_current_player
    if @current_player == @player1
      @current_player = @player2 
    else
      @current_player = @player1
    end
  end

  def game_board
    @board.game_board
  end

  def winner
    if @board.game_won?
      winning_player
    end
  end

  def current_player_name
    @current_player.name
  end
  alias_method :winning_player, :current_player_name
  
  def get_valid_position
    position = @instream.gets.strip.upcase
    
    until valid_position?(position)
      @outstream.puts @message.try_again(current_player_name)
      position = @instream.gets.strip.upcase
    end
    position
  end

  def game_over
    @outstream.puts @message.play_again
    @choice = @instream.gets.strip.upcase
    if play_again
      clear_board        
      play
    elsif quit?
      @its_over = true
    else
      @outstream.puts @message.not_valid_command    
    end
  end

  def player_takes_turn(position)
    if @current_player == @player1
      player1_makes_play(position)
    else
      player2_makes_play(position)
    end
  end

  def valid_position?(position)
    @board.valid_position?(position)
  end

  def clear_board
    @board.clear
  end

  def won?
    @board.game_won? 
  end

  def tied?
    @board.game_tied?
  end

  def quit?
    @choice == 'N' || @choice == 'NO'
  end

  def play_again
    @choice == "Y"
  end
end
