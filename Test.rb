
require_relative 'game_values'
require_relative 'draw_board'
require_relative 'gameplay'
require_relative 'check_for_winner'
require_relative 'interface'
require_relative 'cpu'

values = GameValues.new
main = GamePlay.new
paint_brush = DrawBoard.new
check_for_winner = CheckForWinner.new
interface = Interface.new
cpu = CPU.new

plays_results = []

values.redo
values.vs = interface.main_menu

begin

  loop do
    system "cls"
    print "Marcador:\nX=#{values.x_score}  O=#{values.o_score}\nEmpates=#{values.tie_counter}\n\n"
    print "#{values.plays_counter}\n"
    paint_brush.draw_board(values.boxes)
    interface.draw_interface(values.turn)

    while values.turn == values.last_turn
      if values.vs == 2
        if values.turn == " X " 
          plays_results = main.play(gets, values.boxes, values.turn)
        else
          cpu.current_combos=values.win_combos
          plays_results = main.play(cpu.move, values.boxes, values.turn)
        end
      else
        plays_results = main.play(gets, values.boxes, values.turn)
      end
      if plays_results[1] == "r"
        values.redo
        values.vs = interface.main_menu
        break
      end
      values.turn = plays_results[0] if plays_results[1] != "r"
    end

    winner=check_for_winner.check_it(values.win_combos, plays_results[1], values.last_turn)

    values.plays_counter += 1

    if winner != nil
      system "cls"
      print "Ganador: #{values.last_turn}\n\n"
      values.x_score += 1 if values.last_turn == " X "
      values.o_score += 1 if values.last_turn == " O "
      paint_brush.draw_board(values.boxes)
      values.redo
    end

    if values.plays_counter >= 9
      values.tie_counter += 1
      values.redo
    end

    values.last_turn = values.turn   
  end

end
