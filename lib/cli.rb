require_relative './game'
require_relative './board'
require_relative './player'
require_relative './message'
require 'pry'

class CLI
  attr_reader :instream, :outstream, :game, :message

  def initialize(instream, outstream)
    @command = ''
    @game = Game.new
    @message = Message.new
    @instream = instream
    @outstream = outstream
  end

  def call
    outstream.puts message.welcome 
    outstream.puts message.player1_name_request 
    @game.player1_name = instream.gets.chomp
    # @game.send(:player1_name=, instream.gets)
    outstream.puts message.greet_player1(@game.player1_name)
    outstream.puts message.player2_name_request 
    @game.player2_name = instream.gets.chomp
    outstream.puts message.greet_player2(@game.player2_name) 
    outstream.puts message.lets_play
  end


end
