
class Prepare_Board

  def initialize
    @boxes = {1 => "   ", 2 => "   ", 3 => "   ", 4 => "   ",
              5 => "   ", 6 => "   ", 7 => "   ", 8 => "   ", 9 => "   ", }
    @turn = " X "
    @turns = 0

  end

  def drawBoard

    box = 0
    boardRow = 0

    for i in 0..4

      if boardRow == 0
         print @boxes[box+1], "║", @boxes[box+2], "║", @boxes[box+3], "\n"
         box +=3
         boardRow = 1
      else
         print "═══", "╬═══", "╬═══", "\n"
         boardRow = 0
      end

    end

  end

  def play(selected_box)

    if @boxes[selected_box.to_i] == "   "
      @boxes[selected_box.to_i] = @turn
      @turns += 1
    else
      print "Casilla invalida, ", "|", @boxes[selected_box], "|", "\n"
    end
    drawBoard
    @turn=swapTurn(@turn)

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

main = Prepare_Board.new

main.drawBoard

begin
  main.play(gets)
end while main.instance_variable_get(:@turns) < 9 