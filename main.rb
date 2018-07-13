require 'io/console' 
require_relative 'gameplay'
require_relative 'board_status'
require_relative 'interface'
require_relative 'reset'
require_relative 'exit_on_escape'

gameplay = GamePlay.new
board_status = BoardStatus.new
interface = Interface.new
reset = Reset.new

interface.main_menu
gameplay.turn_x = interface.player1
gameplay.turn_y = interface.player2
input_for_exit = 27
plays_results = []

define_method :lets_reset do
  reset.values(gameplay, board_status, interface)
  interface.main_menu
  gameplay.turn_x = interface.player1
  gameplay.turn_x = interface.player2
end

begin
  exit_on_escape = ExitOnEscape.new
  exit_on_escape.run

  loop do
    #system "cls"
    interface.draw_scoreboard
    board_status.draw_board
    interface.show_instructions(gameplay.turn)

    while gameplay.turn == gameplay.last_turn
      if gameplay.human?
        gameplay.option_selected = exit_on_escape.gets
        plays_results = gameplay.play(board_status.boxes)
      else
        gameplay.input_cpu
        plays_results = gameplay.play(board_status.boxes)
      end

      gameplay.turn = plays_results[0] if plays_results[1]
    end

    winner = board_status.check_it(plays_results[1], gameplay.last_turn)
    gameplay.plays_counter += 1

    if winner != nil
      system "cls"
      print "Ganador: #{gameplay.last_turn}\n\n"
      interface.results(gameplay.last_turn)
      board_status.draw_board
      reset.values(gameplay, board_status)
    end

    if gameplay.plays_counter >= 9
      interface.results("tie")
      reset.values(gameplay, board_status)
    end

    gameplay.last_turn = gameplay.turn
  end
end