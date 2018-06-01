
class Game_Values

  attr_accessor :boxes
  attr_accessor :turn
  attr_accessor :lastTurn
  attr_accessor :playsCounter
  attr_accessor :winCombos

  def initialize

    @turn = " X "
    @lastTurn = " X "
    @playsCounter = 0

    @winCombos = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], 
                 [2, 5, 8], [3, 6, 9], [1, 5, 9], [7, 5, 3]]

    @boxes = {1 => "   ", 2 => "   ", 3 => "   ", 4 => "   ",
              5 => "   ", 6 => "   ", 7 => "   ", 8 => "   ", 
              9 => "   ", }
  end

end

class Draw_Board

  def drawBoard(boxes)

    box = 0
    boardRow = 0

    for i in 0..4
      if boardRow == 0
         print boxes[box+1], "║", boxes[box+2], "║", boxes[box+3], "\n"
         box +=3
         boardRow = 1
      else
         print "═══", "╬═══", "╬═══", "\n"
         boardRow = 0
      end
    end
  end

end

class GamePlay

  def play(selected_box, boxes, turn)

    if boxes[selected_box.to_i] == "   "
      boxes[selected_box.to_i] = turn
      turn=swapTurn(turn)
    else
      print "Casilla invalida", "\n"
    end
    return turn, selected_box.to_i
  end

  def swapTurn(currentTurn)
    if currentTurn == " X "
      currentTurn = " O "
    else
      currentTurn = " X "
    end
    return currentTurn
  end

end

class CheckForWinner

  def checkIt(currentCombos, selectedBox, player)

    i = 0
    while i < currentCombos.length
    j = 0
      while j < currentCombos[i].length
        if currentCombos[i][j] == selectedBox
          currentCombos[i][j] = player
        end
        j += 1
      end
      if currentCombos[i] == [player, player, player]
       return "Ganador: "
      end
      i += 1
    end
  end

end


values = Game_Values.new
main = GamePlay.new
paintBrush = Draw_Board.new
checker = CheckForWinner.new

play_s_Results = []

values

begin

  system "cls"
  print "turno de:", values.turn, "\n", "\n"
  paintBrush.drawBoard(values.boxes)
  print "\n", "Selecciona una casilla: "


  while values.turn == values.lastTurn
    play_s_Results = main.play(gets, values.boxes, values.turn)
    values.turn = play_s_Results[0]
  end

  ganador=checker.checkIt(values.winCombos, play_s_Results[1], values.lastTurn)

  if ganador != nil
    values.playsCounter = 9
    print "Ganador: ", values.lastTurn
  end

  values.lastTurn = values.turn
  values.playsCounter += 1

end while values.playsCounter < 9