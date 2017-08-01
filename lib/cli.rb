require_relative './game'
require_relative './board'
require_relative './player'

class CLI
  attr_reader :instream, :outstream, :game

  def initialize(instream, outstream)
    @command = ''
    @game = Game.new
    @instream = instream
    @outstream = outstream
  end

  def call
    welcome = "Welcome to Tic Tac Toe.\nPlayer 1: What is your name? "
    outstream.puts welcome 
    @game.player1_name = instream.gets
    greet_player1 = "Player1, you will mark the board with the letter X \nPlayer2 What is your name? \n"
    outstream.puts greet_player1
    @game.player2_name = instream.gets
    greet_player2 = "Player2, you will mark the board with the letter O \n"
    lets_play = "Let\'s PLAY!"
    outstream.puts greet_player2 
    outstream.puts lets_play
  end
end
