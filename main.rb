require 'io/console' 
require_relative 'gameplay'
require_relative 'board_status'
require_relative 'interface'
require_relative 'reset'
require_relative 'exit_on_escape'
require_relative 'command_options'

class Game

  attr_reader :gameplay
  attr_reader :board_status
  attr_reader :interface
  attr_reader :reset
  attr_reader :input

  def initialize(input)
    @interface = Interface.new(input)
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

    loop do
      interface.draw_scoreboard
      board_status.draw_board
      interface.show_instructions(gameplay.turn)

      gameplay.turn_base_TEMPORAL(input, board_status.boxes)

      winner = board_status.check_for_winner(gameplay.option_selected, gameplay.last_turn)

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

  CommandOptions.new
  exit_on_escape = ExitOnEscape.new
  game = Game.new(exit_on_escape)
  
  game_thread = Thread.new do
    game.start
  end
  exit_on_escape.run(game_thread)
  game_thread.join
end