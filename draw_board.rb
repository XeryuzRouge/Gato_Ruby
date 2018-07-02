class Board

  attr_accessor :boxes

  def initialize
    reset
  end

  def reset
    empty = "   "

    @boxes = {1 => empty, 2 => empty, 3 => empty, 4 => empty,
              5 => empty, 6 => empty, 7 => empty, 8 => empty, 
              9 => empty}
  end

  def draw_it

    box = 6
    board_row = 0

    for i in 0..4
      if board_row == 0
        print "#{@boxes[box+1]}║#{@boxes[box+2]}║#{@boxes[box+3]}\n"
        box -=3
        board_row = 1
      else
        print "═══╬═══╬═══\n"
        board_row = 0
      end
    end
  end

end