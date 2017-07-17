require 'spec_helper'
require_relative '../lib/board'
require_relative '../lib/player'
require_relative '../lib/game'

RSpec.describe Game do 

  describe "#makes_play" do 
    it "allows two players to add markers to the board" do
      game = Game.new

      game.player1_makes_play(0) 
      game.player2_makes_play(1)   
      # game.player2.makes_play(1)

       updated_board = [
            "X", "O", "",
            "", "", "",
            "", "", "",
          ]
    
      expect(game.game_board).to eq(updated_board)
    end
    # it "will not allow player2 to override marker of player1" do
  end
end
