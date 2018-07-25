
class DrawBoard

  def draw_board(boxes, style)

    box = 6
    board_row = 0

    for i in 0..4
      if style == 1
        if board_row == 0
          print "#{boxes[box+1]}║#{boxes[box+2]}║#{boxes[box+3]}\n"
          box -=3
          board_row = 1
        else
          print "═══╬═══╬═══\n"
          board_row = 0
        end
      elsif style == 2
        if board_row == 0
          print "#{boxes[box+1]}|#{boxes[box+2]}|#{boxes[box+3]}\n"
          box -=3
          board_row = 1
        else
          board_row = 0
        end
      elsif style == 3
        if board_row == 0
          print "#{boxes[box+1]}║#{boxes[box+2]}║#{boxes[box+3]}\n"
          box -=3
          board_row = 1
        else
          print "═════╬═════╬═════\n"
          board_row = 0
        end
      end
    end
  end

end
