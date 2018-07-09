
require 'io/console' 
require_relative 'draw_board'
require_relative 'gameplay'
require_relative 'check_for_winner'
require_relative 'interface'
require_relative 'cpu'
require_relative 'reset'
require_relative 'exit' 

gameplay = GamePlay.new
board = Board.new
check_for_winner = CheckForWinner.new
interface = Interface.new
cpu = CPU.new
reset = Reset.new
exit_program = ExitLogic.new

plays_results = []
interface.main_menu
char = 0
timer = 0
main_menu = 0

begin

  loop do

    system "cls"
    interface.draw_scoreboard
    board.draw_it
    interface.draw_interface(gameplay.turn)

    while gameplay.turn == gameplay.last_turn

      if interface.vs == 1 || (interface.vs == 2 && gameplay.turn == " X ")
        char = exit_program.salte
        if char == 27
          reset.values(gameplay, check_for_winner, board, interface)
          interface.main_menu
          char = 0
          break
        end
        plays_results = gameplay.play(char, board.boxes)
      elsif interface.vs == 3 || interface.vs == 2 
        cpu.current_combos = check_for_winner.win_combos
        plays_results = gameplay.play(cpu.move, board.boxes)
        if plays_results[1] == 27
          reset.values(gameplay, check_for_winner, board, interface)
          interface.main_menu
          char = 0
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
