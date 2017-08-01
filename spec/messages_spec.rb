require 'spec_helper'
require_relative '../lib/message'

RSpec.describe Message do 
  describe "#welcome" do 
    it "returns welcome message" do

      message = Message.new

      expect(message.welcome).to eq("Welcome to Tic Tac Toe.")
    end
  end

  describe "#player1_name_request" do 
    it "returns request for player 1s name" do

      message = Message.new

      expect(message.player1_name_request).to eq("Player 1: What is your name?")
    end
  end

  describe "#greet_player1" do 
    it "returns greeting for player 1" do

      message = Message.new

      expect(message.greet_player1).to eq("Player 1, you will mark the board with the letter X")
    end
  end

  describe "#player2_name_request" do 
    it "returns request for player 2s name" do

      message = Message.new

      expect(message.player2_name_request).to eq("Player 2: What is your name?")
    end
  end

  describe "#greet_player2" do 
    it "returns greeting for player 2" do

      message = Message.new

      expect(message.greet_player2).to eq("Player 2, you will mark the board with the letter O")
    end
  end

  describe "#lets_play" do 
    it "returns lets play game start message" do

      message = Message.new

      expect(message.lets_play).to eq("Let's PLAY!")
    end
  end
end
