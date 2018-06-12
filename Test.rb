
class Game_Values

  attr_accessor :boxes
  attr_accessor :turn
  attr_accessor :lastTurn
  attr_accessor :playsCounter
  attr_accessor :winCombos
  attr_accessor :vs

  def redo

    @vs = "Player"
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
      print "Casilla invalida", boxes[selected_box.to_i], "\n"
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

  attr_accessor :currentCombos

  def move
    row = 0
    o_Counter = 0
    playOptions = []
    tempBox = 0

    while row < currentCombos.length
      if checkRow(row) != nil
        playOptions.insert(-1, checkRow(row))
        print "rows: ", row
      end
      row += 1
    end
    tempBox = checkPlayOptions(playOptions)
    return tempBox
  end

  def checkPlayOptions(possiblePlays)
    tempBox = 0
    play = 0

    while play < possiblePlays.length
      if possiblePlays[play][0] >= 3
      tempBox = possiblePlays[play]
      return tempBox[1]
      end
      play += 1
    end
    tempBox = possiblePlays.sample
    return tempBox[1]
  end

  def checkRow(row)
    tempBoxRow = 0
    rowElement = 0
    o_Counter = 0
    x_Counter = 0

    while rowElement < currentCombos[rowElement].length
      if currentCombos[row][rowElement] == " O "
        o_Counter += 1
      elsif currentCombos[row][rowElement] == " X "
        x_Counter += 1
      else
        tempBoxRow = currentCombos[row][rowElement]
      end
      rowElement += 1
    end

    if tempBoxRow != 0
      if o_Counter == 2
        return 4, tempBoxRow
      elsif x_Counter == 2
        return 3, tempBoxRow
      else 
        return 1, tempBoxRow
      end
    else
      return nil
    end
  end

end

values = Game_Values.new
main = GamePlay.new
paintBrush = Draw_Board.new
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
  print values.playsCounter, "\n"
  paintBrush.drawBoard(values.boxes)
  interface.drawInterface(values.turn)

  while values.turn == values.lastTurn
    if values.vs == 2
      if values.turn == " X " 
        play_s_Results = main.play(gets, values.boxes, values.turn)
      else
        cpu.currentCombos=values.winCombos
        play_s_Results = main.play(cpu.move, values.boxes, values.turn)
      end
    else
      play_s_Results = main.play(gets, values.boxes, values.turn)
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
