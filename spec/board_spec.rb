require 'spec_helper'
require_relative '../lib/board'

RSpec.describe Board do 

  describe "#game_board" do 
    context "when game is initialized" do 
      it "has nine empty cells" do 
        board = Board.new

        nested_arrays = [
          "", "", "",
          "", "", "",
          "", "", "",
        ]

        expect(board.game_board).to eq(nested_arrays)
      end
    end
  end

  describe "#game_won?" do 
    context "with a winning row" do 
      it "returns true with three consecutive O's in first row" do 
        board = Board.new

        board.game_board = [
          "O", "O", "O",
          "O", "X", "O",
          "X", "O", "X",
        ]

        expect(board.game_won?).to eq(true)
      end

      it "returns true when three consecutive X's in last row" do 
        board = Board.new

        board.game_board = [
          "", "X", "O",
          "O", "", "O",
          "X", "X", "X",
        ]

        expect(board.game_won?).to eq(true)
      end
    end

    context "without a winning row" do 
      it "returns false if three empty strings in first row" do 
        board = Board.new

        board.game_board = [
          "", "", "",
          "O", "X", "O",
          "X", "O", "X",
        ]

        expect(board.game_won?).to eq(false)
      end

      it "returns false if three empty strings in last row" do 
        board = Board.new

        board.game_board = [
          "", "X", "O",
          "", "O", "X",
          "", "", "",
        ]

        expect(board.game_won?).to eq(false)
      end
    end

    context "with a winning column" do 
      it "returns true with three consecutive O's in first column" do 
        board = Board.new

        board.game_board = [
          "O", "X", "",
          "O", "X", "O",
          "O", "O", "X",
        ]

        expect(board.game_won?).to eq(true)
      end

      it "returns true when three consecutive X's in last column" do 
        board = Board.new

        board.game_board = [
          "", "X", "X",
          "O", "", "X",
          "X", "", "X",
        ]

        expect(board.game_won?).to eq(true)
      end
    end

    context "without a winning column" do 
      it "returns false if three empty strings in first column" do 
        board = Board.new

        board.game_board = [
          "", "", "X",
          "", "X", "O",
          "", "O", "X",
        ]

        expect(board.game_won?).to eq(false)
      end

      it "returns false if three empty strings in last column" do 
        board = Board.new

        board.game_board = [
          "", "X", "",
          "O", "O", "",
          "X", "", "",
        ]

        expect(board.game_won?).to eq(false)
      end
    end

    context "with a winning diagonal" do 
      it "returns true with three consecutive O's top left to bottom right" do 
        board = Board.new

        board.game_board = [
          "O", "X", "",
          "", "O", "X",
          "X", "O", "O",
        ]

        expect(board.game_won?).to eq(true)
      end

      it "returns true when three consecutive X's bottom left to top right" do 
        board = Board.new

        board.game_board = [
          "", "X", "X",
          "O", "X", "O",
          "X", "", "X",
        ]

        expect(board.game_won?).to eq(true)
      end
    end

    context "without a winning diagonal" do 
      it "returns false if three empty strings top left to bottom right" do 
        board = Board.new

        board.game_board = [
          "", "X", "",
          "X", "", "O",
          "", "O", "X",
        ]

        expect(board.game_won?).to eq(false)
      end

      it "returns false if three empty strings bottom left to top right" do 
        board = Board.new

        board.game_board = [
          "", "X", "",
          "O", "", "",
          "", "", "X",
        ]

        expect(board.game_won?).to eq(false)
      end
    end
  end
end
