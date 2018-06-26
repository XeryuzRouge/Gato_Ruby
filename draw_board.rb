class TheBoard

  attr_accessor :boxes

  def reset

    @boxes = {1 => "   ", 2 => "   ", 3 => "   ", 4 => "   ",
              5 => "   ", 6 => "   ", 7 => "   ", 8 => "   ", 
              9 => "   "}
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