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

      name = "Mabel"
      message = Message.new

      expect(message.greet_player1(name)).to eq("Mabel, you will mark the board with the letter X")
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

      name = "Smokey"
      message = Message.new

      expect(message.greet_player2(name)).to eq("Smokey, you will mark the board with the letter O")
    end
  end
 
  describe "#how_to_proceed" do 
    it "returns how to proceed message" do

      message = Message.new
      options = "INSTRUCTIONS, press: i    To PLAY, press: p    To QUIT, press: q"

      expect(message.how_to_proceed).to eq(options)
    end
  end

  describe "#instructions" do 
    it "returns game instructions" do

      message = Message.new
      name1 = "Abby"
      name2 = "Beverly"
      greet1 = "#{name1}, you will mark the board with the letter X"
      greet2 = "#{name2}, you will mark the board with the letter O"
      game_instructions = 
      "Each cell position has a numeric value ranging from 1 to 9 \n" +
      "When it's your turn, enter the number in which you would like \n"+
      "to make your mark. Your mark has been predetermined for you. \n" +
      "#{greet1}" + "\n" +
      "#{greet2}"

      expect(message.instructions(name1, name2)).to eq(game_instructions)
    end
  end

  describe "#not_valid_command" do 
    it "returns not valid command message" do

      message = Message.new
      how_to_proceed = 
        "INSTRUCTIONS, press: i    To PLAY, press: p    To QUIT, press: q"
      invalid = "You entered an invalid command. #{how_to_proceed}"

      expect(message.invalid_and_how_to_proceed).to eq(invalid)
    end
  end

  describe "#quit_game" do 
    it "returns quit game message" do

      message = Message.new
      text = "Game over!"

      expect(message.quit_game).to eq(text)
    end
  end

  describe "#lets_play" do 
    it "returns lets play game start message" do

      message = Message.new

      expect(message.lets_play).to eq("Alright friends! Let's PLAY!")
    end
  end
end
