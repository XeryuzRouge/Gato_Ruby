
require_relative 'draw_board'
require_relative 'gameplay'
require_relative 'check_for_winner'
require_relative 'interface'
require_relative 'cpu'
require_relative 'reset'

gameplay = GamePlay.new
the_board = TheBoard.new
check_for_winner = CheckForWinner.new
interface = Interface.new
cpu = CPU.new
reset = Reset.new

plays_results = []
reset_errors = []

reset_errors = reset.values(gameplay, cpu, check_for_winner, the_board, interface)

interface.main_menu(reset_errors)

begin

  loop do
    system "cls"
    interface.draw_scoreboard
    the_board.draw_it
    interface.draw_interface(gameplay.turn)

    while gameplay.turn == gameplay.last_turn
      if interface.vs == 2
        if gameplay.turn == " X " 
          plays_results = gameplay.play(gets, the_board.boxes)
        else
          cpu.current_combos = check_for_winner.win_combos
          plays_results = gameplay.play(cpu.move, the_board.boxes)
        end
      else
        plays_results = gameplay.play(gets, the_board.boxes)
      end
      if plays_results[1] == "r"
        reset_errors = reset.values(gameplay, check_for_winner, the_board, interface)
        interface.main_menu(reset_errors)
        break
      end
      gameplay.turn = plays_results[0] if plays_results[1] != "r"
    end

    winner = check_for_winner.check_it(plays_results[1], gameplay.last_turn)

    gameplay.plays_counter += 1

    if winner != nil
      system "cls"
      print "Ganador: #{gameplay.last_turn}\n\n"
      interface.results(gameplay.last_turn)
      the_board.draw_it
      reset_errors = reset.values(gameplay, check_for_winner, the_board, cpu)
    end

    if gameplay.plays_counter >= 9
      interface.results("tie")
      reset_errors = reset.values(gameplay, check_for_winner, the_board, cpu)
    end

    gameplay.last_turn = gameplay.turn   
  end

end
