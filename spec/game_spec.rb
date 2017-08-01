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

      updated_board = [
            "X", "O", "",
            "", "", "",
            "", "", "",
      ]
    
      expect(game.game_board).to eq(updated_board)
    end
    
    it "will not allow player to override marker of other player" do
      game = Game.new

      game.player1_makes_play(0)
      game.player2_makes_play(0)

      board = [
        "X", "", "",
        "", "", "",
        "", "", "",
      ]
      expect(game.game_board).to eq(board)
    end
  end

  describe "#current_player" do 
    context "during the course of play" do 
      it "returns player1 is the current player" do
        game = Game.new
      
        game.player1_makes_play(0)
        game.player2_makes_play(1)
        game.player1_makes_play(4)

        expect(game.current_player).to eq(player1)
      end
      
      it "returns player2 is the current player" do
        game = Game.new
      
        game.player1_makes_play(0)
        game.player2_makes_play(1)

        expect(game.current_player).to eq(player2)
      end
    end
  end

  describe "#winner" do 
    it "returns which player has won the game" do
      game = Game.new
    
      game.player1_makes_play(0)
      game.player2_makes_play(1)
      game.player1_makes_play(4)
      game.player2_makes_play(7)
      game.player1_makes_play(8)

      expect(game.winner).to eq("Player1")
    end
  end
end
