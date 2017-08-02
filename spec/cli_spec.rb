require 'spec_helper'
require_relative '../lib/cli'
require 'open3'
# instream - user input
# outstream - viewed on screen
RSpec.describe CLI do
  describe "#call" do
    it "runs through game flow" do
      #call command using POPEN3 to run the play_tic_tac_toe.rb
      cmd = 'ruby play_tic_tac_toe.rb'
      Open3.popen3(cmd) do |instream, outstream, stderr, wait_thr|
        instream.puts "Abby"
        instream.puts "Bertha"

        stderr_output = stderr.read
        if !stderr_output.empty?
          fail "Command failed:\n#{stderr_output}"
        end

        message = <<-MESSAGE
Welcome to Tic Tac Toe.
Player 1: What is your name?
Abby, you will mark the board with the letter X
Player 2: What is your name?
Bertha, you will mark the board with the letter O
Let's PLAY!
        MESSAGE
        expect(outstream.read).to eq(message)
      end
    end

    def gamer
      # instream = StringIO.new
      # outstream = StringIO.new
      pos = outstream.pos
      instream.puts "Abby"

      CLI.new($stdin, $stdout).call

      message1 = [
        "Welcome to Tic Tac Toe.\n",
        "Player 1: What is your name?\n",
        "Player 1, you will mark the board with the letter X\n",
        "Player 2: What is your name?\n"
      ].join
      outstream.seek(pos)
      expect(outstream.read).to eq(message1)

      instream.puts "Bertha"
=begin
      pos = outstream.pos
      outstream.seek(pos)
      message2 =
        "Player1, you will mark the board with the letter X \n" +
        "Player2 What is your name?\n"
      expect(outstream.read).to eq(message2)
=end
      # instream.puts "Player2"
      # message3 =
      #   "Player2, you will mark the board with the letter O \n" +
      #   "Let\'s PLAY!\n"
      # expect(outstream.string).to eq(message3)

    end
  end
end
