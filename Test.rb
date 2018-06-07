
class Game_Values

  attr_accessor :boxes
  attr_accessor :turn
  attr_accessor :lastTurn
  attr_accessor :playsCounter
  attr_accessor :winCombos
  attr_accessor :VS

  def initialize

    @VS = "Player"
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

    box = 6
    boardRow = 0

    for i in 0..4
      if boardRow == 0
         print boxes[box+1], "║", boxes[box+2], "║", boxes[box+3], "\n"
         box -=3
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
       return true
      end
      i += 1
    end
  end

end

class Interface

  def drawInterface(turn)
  print "\n", "turno de:", turn, "\n", "\n"
  print "\n", "Selecciona una casilla: "
  end

end

class CPU

  def move(combos)
    i = 0
    j = 0
    rowOf_O = 0
    tempBox = 0
    while i < combos.length
      j = 0
      rowOf_O = 0
      while j < combos[j].length
        if combos[i][j] == " O "
          rowOf_O += 1
        elsif combos[i][j] != " X "
          tempBox = combos[i][j]
        end
        j += 1
      end
      if rowOf_O == 2
        return tempBox
      end
      i += 1
    end
    return tempBox
  end

end

values = Game_Values.new
main = GamePlay.new
paintBrush = Draw_Board.new
checkForWinner = CheckForWinner.new
interface = Interface.new
cpu = CPU.new

play_s_Results = []

values

begin

  system "cls"
  paintBrush.drawBoard(values.boxes)
  interface.drawInterface(values.turn)

  while values.turn == values.lastTurn
     if values.turn==" X " 
      play_s_Results = main.play(gets, values.boxes, values.turn)
    else
      play_s_Results = main.play(cpu.move(values.winCombos), values.boxes, values.turn)
    end
      values.turn = play_s_Results[0]
  end

  ganador=checkForWinner.checkIt(values.winCombos, play_s_Results[1], values.lastTurn)

  if ganador != nil
    values.playsCounter = 9
    system "cls"
    print "Ganador: ", values.lastTurn, "\n", "\n"
    paintBrush.drawBoard(values.boxes)
  end

  values.lastTurn = values.turn
  values.playsCounter += 1

end while values.playsCounter < 9