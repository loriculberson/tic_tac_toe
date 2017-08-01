class Game

  def initialize
    @board = Board.new
    @player1 = Player.new(@board, "X")
    @player2 = Player.new(@board, "O")
    @player_who_played_last = nil
  end

  def player1_makes_play(position)
    current_player = @player1
    @player1.makes_play(position)
  end

  def player2_makes_play(position)
    current_player = @player2
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
    current_player.name
  end

  def current_player
    @player_who_played_last
  end

  def player1_name=(name)
    @player1.name = name
  end

  def player2_name=(name)
    @player2.name = name
  end
end
