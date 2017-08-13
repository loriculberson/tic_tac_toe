class Game
  attr_reader :player1, :player2

  def initialize
    @board = Board.new
    @player1 = Player.new(@board, "X")
    @player2 = Player.new(@board, "O")
    @player_who_played_last = nil
  end

  def player1_makes_play(position)
    @player_who_played_last = @player1
    @player1.makes_play(position)
  end

  def player2_makes_play(position)
    @player_who_played_last = @player2
    @player2.makes_play(position)
  end

  def game_board
    @board.game_board
  end

  def winner
    if @board.game_won?
      winning_player
    end
  end

  def winning_player
    @player_who_played_last.name
  end

  def current_player
    @player_who_played_last
  end

  def player1_name=(name)
    @player1.name = name
  end

  def player1_name
    @player1.name
  end

  def player2_name=(name)
    @player2.name = name
  end

  def player2_name
    @player2.name
  end

  def display_board
    puts game_board.split(',')
  end

  # def play
  # end
end
