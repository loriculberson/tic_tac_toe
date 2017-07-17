class Player

  def initialize(board, symbol)
    @board = board
    @symbol = symbol
  end

  def makes_play(position)
    @board.update_board(position, @symbol)
  end
end
