
require_relative 'gamevalues'
require_relative 'drawboard'
require_relative 'gameplay'
require_relative 'checkforwinner'
require_relative 'interface'
require_relative 'cpu'

values = GameValues.new
main = GamePlay.new
paint_brush = DrawBoard.new
checkForWinner = CheckForWinner.new
interface = Interface.new
cpu = CPU.new

play_s_Results = []

values.redo
system "cls"
print "Player vs Player (1) \nPlayer vs CPU (2) \n"
         values.vs = gets.to_i

begin

  system "cls"
  print "#{values.plays_counter}\n"
  paint_brush.draw_board(values.boxes)
  interface.draw_interface(values.turn)

  while values.turn == values.last_turn
    if values.vs == 2
      if values.turn == " X " 
        play_s_Results = main.play(gets, values.boxes, values.turn)
      else
        cpu.current_combos=values.win_combos
        play_s_Results = main.play(cpu.move, values.boxes, values.turn)
      end
    else
      play_s_Results = main.play(gets, values.boxes, values.turn)
    end
    values.turn = play_s_Results[0]
  end

  ganador=checkForWinner.check_it(values.win_combos, play_s_Results[1], values.last_turn)

  if ganador != nil
    values.plays_counter = 9
    system "cls"
    print "Ganador: #{values.last_turn}\n\n"
    paint_brush.draw_board(values.boxes)
  end

  values.last_turn = values.turn
  values.plays_counter += 1

end while values.plays_counter < 9
