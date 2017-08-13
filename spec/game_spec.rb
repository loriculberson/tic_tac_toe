require 'spec_helper'
require_relative '../lib/board'
require_relative '../lib/player'
require_relative '../lib/game'

RSpec.describe Game do 
  describe "#makes_play" do 
    it "allows two players to add markers to the board" do
      game = Game.new

      game.player1_makes_play("A1")
      game.player2_makes_play("B1")

      a = "      A   B   C"
      b = "   1  X | O |  "
      c = "---------------"
      d = "   2    |   |  "
      c = "---------------"
      e = "   3    |   |  "
      updated_board = [a,b,c,d,c,e].join(',')

      expect(game.game_board).to eq(updated_board)
    end
    
    it "will not allow player to override marker of other player" do
      game = Game.new

      game.player1_makes_play("A1")
      game.player2_makes_play("A1")

      a = "      A   B   C"
      b = "   1  X |   |  "
      c = "---------------"
      d = "   2    |   |  "
      c = "---------------"
      e = "   3    |   |  "
      updated_board = [a,b,c,d,c,e].join(',')
      expect(game.game_board).to eq(updated_board)
    end
  end

  describe "#current_player" do 
    context "during the course of play" do 
      it "returns player1 is the current player" do
        game = Game.new
      
        game.player1_makes_play("A1")
        game.player2_makes_play("B1")
        game.player1_makes_play("B2")

        expect(game.current_player).to eq(game.player1)
      end
      
      it "returns player2 is the current player" do
        game = Game.new
      
        game.player1_makes_play("A1")
        game.player2_makes_play("B1")

        expect(game.current_player).to eq(game.player2)
      end
    end
  end

  describe "#winner" do 
    it "returns which player has won the game" do
      game = Game.new
      game.player1_name="Abby"
      game.player2_name="Bertha"
    
      game.player1_makes_play("A1")
      game.player2_makes_play("B1")
      game.player1_makes_play("B2")
      game.player2_makes_play("b3")
      game.player1_makes_play("c3")

      expect(game.winner).to eq("Abby")
    end
  end

  # describe "#play" do 
  #   context "the new game board" do
  #     it "returns board of numeric positions" do
  #       game = Game.new
  #       board = 


  #       expect(game.game_board).to eq(board)
  #     end
  #   end
  # end
end





