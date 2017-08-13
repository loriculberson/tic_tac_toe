require 'spec_helper'
require_relative '../lib/cli'
require 'open3'

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
INSTRUCTIONS, press: i    To PLAY, press: p    To QUIT, press: q
        MESSAGE
        expect(outstream.read).to eq(message)
      end
    end

  end
end
