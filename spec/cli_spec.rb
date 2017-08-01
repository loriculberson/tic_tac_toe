require 'spec_helper'
require_relative '../lib/cli'
# instream - user input
# outstream - viewed on screen

RSpec.describe CLI do 
  describe "#call" do
    it "runs through game flow" do 
      instream = StringIO.new
      outstream = StringIO.new
      CLI.new(instream, outstream).call
      
      message1 = "Welcome to Tic Tac Toe. \nPlayer 1: What is your name? \n"

      expect(outstream.string).to eq(message1) 
    
      instream.puts "Player1"
      
      message2 = 
        "Player1, you will mark the board with the letter X \n" +
        "Player2 What is your name?\n"

      expect(outstream.string).to eq(message2) 

      instream.puts "Player2"

      message3 = 
        "Player2, you will mark the board with the letter O \n" +
        "Let\'s PLAY!\n"

      expect(outstream.string).to eq(message3) 
    
    end
  end 
end
