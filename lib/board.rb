class Board
  attr_accessor :game_board

  def initialize 
    a = "      A   B   C"
    b = "   1    |   |  "
    c = "---------------"
    d = "   2    |   |  "
    c = "---------------"
    e = "   3    |   |  "
    @game_board = [a,b,c,d,c,e].join(',')
  end

  def game_won?
    in_a_row? || in_a_column? || in_a_diagonal?
  end

  def all_spaces_filled?
    translate_position.all? {|k, v| game_board[v] != " " }
  end
  
  def game_tied?
    all_spaces_filled? && !game_won?
  end

  def in_a_row?
    row_1 = [game_board[22], game_board[26], game_board[30]]
    row_2 = [game_board[54], game_board[58], game_board[62]]
    row_3 = [game_board[86], game_board[90], game_board[94]]
    data = [row_1, row_2, row_3]
    board_has_a_winner?(data)
  end

  def in_a_column?
    col_1 = [game_board[22], game_board[54], game_board[86]]
    col_2 = [game_board[26], game_board[58], game_board[90]]
    col_3 = [game_board[30], game_board[62], game_board[94]]
    data = [col_1, col_2, col_3]
    board_has_a_winner?(data)
  end

  def in_a_diagonal?
    diagonal_0_to_bottom? || diagonal_6_to_top?
  end

  def diagonal_0_to_bottom?
    a1 = game_board[22]
    b2 = game_board[58]
    c3 = game_board[94]
    data = [a1, b2, c3]
    board_has_diagonol_winner?(data)
  end

  def diagonal_6_to_top?
    a3 = game_board[86]
    b2 = game_board[58]
    c1 = game_board[30]
    data = [a3, b2, c1]
    board_has_diagonol_winner?(data)
  end

  def board_has_a_winner?(data)
    data.any? do |set|
      set.all? { |mark| mark == set[0] && set[0] != " " }
    end
  end

  def board_has_diagonol_winner?(data)
    data.all? { |mark| mark == data[0] && data[0] != " " }
  end

  def update_board(position, symbol)
    position = translate_position[position]
    if position_available?(position)
      game_board[position] = symbol
    end
    game_board
  end

  def position_available?(position)
    game_board[position] == " "
  end

  def translate_position
    {
      "A1"=> 22, "A2"=> 54, "A3"=> 86,
      "B1"=> 26, "B2"=> 58, "B3"=> 90,
      "C1"=> 30, "C2"=> 62, "C3"=> 94
    }    
  end

  def clear
    a = "      A   B   C"
    b = "   1    |   |  "
    c = "---------------"
    d = "   2    |   |  "
    c = "---------------"
    e = "   3    |   |  "
    @game_board = [a,b,c,d,c,e].join(',')
  end

  def valid_position?(position)
    translate_position.has_key?(position)
  end
end

