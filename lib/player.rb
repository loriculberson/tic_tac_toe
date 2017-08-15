class Player
  attr_accessor :name

  def initialize(board, symbol)
    @board = board
    @symbol = symbol
    @name = name
  end

  def makes_play(position)
    position = position.upcase
    board.update_board(position, symbol)
  end
  
  private
  attr_reader :board, :symbol
end
