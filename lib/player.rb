class Player
  attr_accessor :name

  def initialize(board, symbol)
    @board = board
    @symbol = symbol
    @name = name
  end

  def makes_play(position)
    @board.update_board(position, @symbol)
  end
end
