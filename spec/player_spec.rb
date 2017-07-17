require 'spec_helper'
require_relative '../lib/board'
require_relative '../lib/player'

RSpec.describe Player do 
  describe "#makes_play" do 
    context "when board is empty" do
      it "adds X to selected position" do
        board = Board.new
        symbol = "X"
        
        player = Player.new(board, symbol)
        position = 0

        updated_board = [
          "X", "", "",
          "", "", "",
          "", "", "",
        ]

        expect(player.makes_play(position)).to eq(updated_board)
      end
    end
  end
end
