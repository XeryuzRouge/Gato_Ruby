
require 'io/console' 
require_relative 'draw_board'
require_relative 'gameplay'
require_relative 'check_for_winner'
require_relative 'interface'
require_relative 'cpu'
require_relative 'reset'
require_relative 'capture_key' 

gameplay = GamePlay.new
board = Board.new
check_for_winner = CheckForWinner.new
interface = Interface.new
cpu = CPU.new
reset = Reset.new
input_key = CaptureKey.new

plays_results = []
interface.main_menu
input = nil
timer = 0
main_menu = 0
input_for_exit = 27
turn_x = interface.player1
turn_y = interface.player2

define_method :lets_reset do
  reset.values(gameplay, check_for_winner, board, interface)
  interface.main_menu
  turn_x = interface.player1
  turn_y = interface.player2
  input = nil
  break
end

begin
  loop do
    system "cls"
    interface.draw_scoreboard
    board.draw_it
    interface.draw_interface(gameplay.turn)

    while gameplay.turn == gameplay.last_turn
      if (gameplay.turn == " X " && turn_x == "h") || (gameplay.turn == " O " && turn_y == "h")
        input = input_key.exit_with_input while input == nil
        if input == input_for_exit
          lets_reset
          break
        end
        plays_results = gameplay.play(input, board.boxes)
        input = nil

      elsif (gameplay.turn == " X " && turn_x == "c") || (gameplay.turn == " O " && turn_y == "c")
        cpu.team = gameplay.turn
        cpu.current_combos = check_for_winner.win_combos
        plays_results = gameplay.play(cpu.move, board.boxes)
        if plays_results[1] == input_for_exit
          lets_reset
          break
        end
      end

      gameplay.turn = plays_results[0] if plays_results[1]

    end

    winner = check_for_winner.check_it(plays_results[1], gameplay.last_turn)
    gameplay.plays_counter += 1

    if winner != nil
      system "cls"
      print "Ganador: #{gameplay.last_turn}\n\n"
      interface.results(gameplay.last_turn)
      board.draw_it
      reset.values(gameplay, check_for_winner, board)
    end

    if gameplay.plays_counter >= 9
      interface.results("tie")
      reset.values(gameplay, check_for_winner, board)
    end

    gameplay.last_turn = gameplay.turn

  end

end
