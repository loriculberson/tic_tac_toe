class Game

  def initialize
    @board = Board.new
    @player1 = Player.new(@board, "X")
    @player2 = Player.new(@board, "O")
  end

  def player1_makes_play(position)
    @player1.makes_play(position)
  end

  def player2_makes_play(position)
    @player2.makes_play(position)
  end

  def game_board
    @board.game_board
  end
end
