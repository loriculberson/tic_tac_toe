require 'spec_helper'
require_relative '../lib/board'
require_relative '../lib/player'

RSpec.describe Player do 
  describe "#makes_play" do 
    context "when board is empty" do
      it "adds X to selected position" do
        board = Board.new
        symbol = "X"
        board = Board.new
        player = Player.new(board, symbol)
        position = "A1"
        a = "      A   B   C"
        b = "   1  X |   |  "
        c = "---------------"
        d = "   2    |   |  "
        c = "---------------"
        e = "   3    |   |  "
        updated_board = [a,b,c,d,c,e].join(',')

        expect(player.makes_play(position)).to eq(updated_board)
      end
    end

    context "when board is in play" do
      it "returns updated board after both players have played" do
        board = Board.new
        player1 = Player.new(board, "X")
        player2 = Player.new(board, "O")
        position1 = "A1"
        position2 = "C3"

        player1.makes_play(position1)
        player2.makes_play(position2)

        a = "      A   B   C"
        b = "   1  X |   |  "
        c = "---------------"
        d = "   2    |   |  "
        c = "---------------"
        e = "   3    |   | O"
        updated_board = [a,b,c,d,c,e].join(',')

        expect(board.game_board).to eq(updated_board)
      end
    end
  end
end
