require 'io/console' 
require_relative 'gameplay'
require_relative 'board_status'
require_relative 'interface'
require_relative 'reset'
require_relative 'exit_on_escape'

class Game

  attr_reader :gameplay
  attr_reader :board_status
  attr_reader :interface
  attr_reader :reset
  attr_reader :input
  attr_reader :language

  def initialize(input)
    commands = ARGV
    @language = commands[1] if commands[0] == "-lang"
    @interface = Interface.new(input, @language)
    @gameplay = GamePlay.new(@interface)
    @board_status = BoardStatus.new
    @reset = Reset.new
    @input = input
  end

  def start
    main_menu
    game_loop
  end

  def main_menu
    interface.main_menu
    gameplay.turn_x = interface.player1
    gameplay.turn_y = interface.player2
  end

  def game_loop
    plays_results = []

    loop do
      interface.draw_scoreboard
      board_status.draw_board
      interface.show_instructions(gameplay.turn)

      while gameplay.turn == gameplay.last_turn
        if gameplay.human?
          gameplay.option_selected = input.gets
          plays_results = gameplay.play(board_status.boxes)
        else
          gameplay.input_cpu
          plays_results = gameplay.play(board_status.boxes)
        end

        gameplay.turn = plays_results[0] if plays_results[1]
      end

      winner = board_status.check_for_winner(plays_results[1], gameplay.last_turn)
      gameplay.plays_counter += 1

      if winner != nil
        interface.results(gameplay.last_turn, board_status.icon_x, board_status.icon_o)
        board_status.draw_board
        reset.values(gameplay, board_status)
      end

      if gameplay.plays_counter >= 9
        interface.results("tie", board_status.icon_x, board_status.icon_o)
        reset.values(gameplay, board_status)
      end

      gameplay.last_turn = gameplay.turn
    end
  end

  def restart
    reset.values(gameplay, board_status, interface)
    interface.main_menu
    gameplay.turn_x = interface.player1
    gameplay.turn_x = interface.player2
  end
end

begin
  exit_on_escape = ExitOnEscape.new
  game = Game.new(exit_on_escape)
  
  game_thread = Thread.new do
    game.start
  end
  exit_on_escape.run(game_thread)
  game_thread.join
end