require 'spec_helper'
require_relative '../lib/board'

RSpec.describe Board do 

  describe "#game_board" do 
    context "when game is initialized" do 
      it "has nine empty cells" do 
        board = Board.new
        a = "      A   B   C"
        b = "   1    |   |  "
        c = "---------------"
        d = "   2    |   |  "
        c = "---------------"
        e = "   3    |   |  "
        new_board = [a,b,c,d,c,e].join(',')

        expect(board.game_board).to eq(new_board)
      end
    end
  end

  describe "#game_won?" do 
    context "with empty board" do 
      it "returns false, there is no winner" do 
        board = Board.new
        a = "      A   B   C"
        b = "   1    |   |  "
        c = "---------------"
        d = "   2    |   |  "
        c = "---------------"
        e = "   3    |   |  "
        empty_board = [a,b,c,d,c,e].join(',')
        board.game_board = empty_board

        expect(board.game_won?).to eq(false)
      end
    end

    context "with a winning row" do 
      it "returns true when three consecutive Os in first row" do 
        board = Board.new
        a = "      A   B   C"
        b = "   1  O | O | O"
        c = "---------------"
        d = "   2    |   |  "
        c = "---------------"
        e = "   3    |   |  "
        current_board = [a,b,c,d,c,e].join(',')

        board.game_board = current_board

        expect(board.game_won?).to eq(true)
      end

      it "returns true when three consecutive X's in last row" do 
        board = Board.new
        a = "      A   B   C"
        b = "   1    |   |  "
        c = "---------------"
        d = "   2    |   |  "
        c = "---------------"
        e = "   3  X | X | X"
        current_board = [a,b,c,d,c,e].join(',')

        board.game_board = current_board

        expect(board.game_won?).to eq(true)
      end
    end

    context "without a winning row" do 
      it "returns false if three empty strings in first row" do 
        board = Board.new
        a = "      A   B   C"
        b = "   1  X |   |  "
        c = "---------------"
        d = "   2    | O |  "
        c = "---------------"
        e = "   3    |   | X"
        current_board = [a,b,c,d,c,e].join(',')

        board.game_board = current_board

        expect(board.game_won?).to eq(false)
      end
    end

    context "with a winning column" do 
      it "returns true when three consecutive Os in first column" do 
        board = Board.new
        a = "      A   B   C"
        b = "   1  O |   |  "
        c = "---------------"
        d = "   2  O | O |  "
        c = "---------------"
        e = "   3  O |   | X"
        current_board = [a,b,c,d,c,e].join(',')

        board.game_board = current_board

        expect(board.game_won?).to eq(true)
      end

      it "returns true when three consecutive X's in last column" do 
        board = Board.new
        a = "      A   B   C"
        b = "   1    |   | X"
        c = "---------------"
        d = "   2  O | O | X"
        c = "---------------"
        e = "   3  O |   | X"
        current_board = [a,b,c,d,c,e].join(',')

        board.game_board = current_board

        expect(board.game_won?).to eq(true)
      end
    end

    context "board in mid game" do 
      it "returns false when there is no winner" do 
        board = Board.new
        a = "      A   B   C"
        b = "   1    |   | X"
        c = "---------------"
        d = "   2  O | O |  "
        c = "---------------"
        e = "   3  O |   | X"
        current_board = [a,b,c,d,c,e].join(',')
        board.game_board = current_board

        expect(board.game_won?).to eq(false)
      end
    end

    context "with a winning diagonal" do 
      it "returns true with three consecutive O's top left to bottom right" do 
        board = Board.new
        a = "      A   B   C"
        b = "   1  O |   | X"
        c = "---------------"
        d = "   2    | O |  "
        c = "---------------"
        e = "   3  X |   | O"
        current_board = [a,b,c,d,c,e].join(',')
        board.game_board = current_board

        expect(board.game_won?).to eq(true)
      end

      it "returns true when three consecutive X's bottom left to top right" do 
        board = Board.new
        a = "      A   B   C"
        b = "   1  O |   | X"
        c = "---------------"
        d = "   2    | X |  "
        c = "---------------"
        e = "   3  X |   | O"
        current_board = [a,b,c,d,c,e].join(',')
        board.game_board = current_board

        expect(board.game_won?).to eq(true)
      end
    end
  end

  describe "#tied?" do 
    context "when game is over and no winner" do 
      it "returns true there is no victor" do 
        board = Board.new
        a = "      A   B   C"
        b = "   1  X | O | X"
        c = "---------------"
        d = "   2  X | O | X"
        c = "---------------"
        e = "   3  O | X | O"
        current_board = [a,b,c,d,c,e].join(',')
        board.game_board = current_board

        expect(board.game_tied?).to eq(true)
      end
    end
  end

  describe "#clear" do 
    context "when game is over and players play again" do 
      it "returns empty board" do 
        board = Board.new
        a = "      A   B   C"
        b = "   1  X | O | X"
        c = "---------------"
        d = "   2  X | O | X"
        c = "---------------"
        e = "   3  O | X | O"
        current_board = [a,b,c,d,c,e].join(',')
        board.game_board = current_board

        a1 = "      A   B   C"
        b1 = "   1    |   |  "
        c1 = "---------------"
        d1 = "   2    |   |  "
        c1 = "---------------"
        e1 = "   3    |   |  "
        new_board = [a1,b1,c1,d1,c1,e1].join(',')

        board.clear

        expect(board.game_board).to eq(new_board)
      end
    end
  end
end
