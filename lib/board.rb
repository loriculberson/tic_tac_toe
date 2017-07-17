class Board
  attr_accessor :game_board

  def initialize 
    @game_board = Array.new(9, "")
  end

  def game_won?
    in_a_row? || in_a_column? || in_a_diagonal?
  end

  def in_a_row?
    game_board.each_slice(3).any? do |data|
      board_has_a_winner?(data)
    end
  end

  def in_a_column?
    3.times.any? do |i|
      data = game_board.values_at(i, i+3, i+6)
      board_has_a_winner?(data)
    end
  end

  def in_a_diagonal?
    diagonal_0_to_bottom? || diagonal_6_to_top?
  end

  def diagonal_0_to_bottom?
    data = game_board.values_at(0, 4, 8)
    board_has_a_winner?(data)
  end

  def diagonal_6_to_top?
    data = game_board.values_at(2, 4, 6)
    board_has_a_winner?(data)
  end

  def board_has_a_winner?(data)
    data.all? { |mark| mark == data[0] && data[0] != "" }
  end

  def update_board(position, symbol)
    game_board[position] = symbol
    game_board
  end
end


