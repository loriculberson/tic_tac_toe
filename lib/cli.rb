require_relative './game'
require_relative './board'
require_relative './player'
require_relative './message'
require 'pry'

class CLI
  attr_reader :instream, :outstream, :game, :message

  def initialize(instream, outstream)
    @command = ''
    @message = Message.new
    @instream = instream
    @outstream = outstream
    @game = Game.new(@instream, @outstream, @message)
  end

  def call
    game_opening
  end

  def game_opening
    outstream.puts message.welcome 
    outstream.puts message.player1_name_request 
    @game.player1_name = instream.gets.chomp
    outstream.puts message.greet_player1(@game.player1_name)
    outstream.puts message.player2_name_request 
    @game.player2_name = instream.gets.chomp
    outstream.puts message.greet_player2(@game.player2_name)
    until quit? || @game.its_over?
      outstream.puts message.how_to_proceed
      @command = instream.gets.chomp.upcase
      process_initial_command
    end
    outstream.puts message.end_of_game
  end

  def process_initial_command
    case 
    when play?
      @game.play
    when instructions?
      outstream.puts message.instructions(player1_name, player2_name)
      outstream.puts @game.display_board
    when quit?
      outstream.puts message.quit_game
    else
      outstream.puts message.not_valid_command
    end
  end

  def instructions?
    @command == 'I'
  end

  def play?
    @command == 'P'
  end

  def quit?
    @command == 'Q'
  end

  def player1_name
    @game.player1_name
  end

  def player2_name
    @game.player2_name
  end

end
