
class DrawBoard

  def draw_board(boxes, style)
    if style == 1
      divider = "║"
      separator = "═══╬═══╬═══\n"
    elsif style == 2
      divider = "|"
      separator = nil
    elsif style == 3
      divider = "║"
      separator = "═════╬═════╬═════\n"
    end

    box = 6
    board_row = 0

    for i in 0..4
        if board_row == 0
          print "#{boxes[box+1]}#{divider}#{boxes[box+2]}#{divider}#{boxes[box+3]}\n"
          box -=3
          board_row = 1
        else
          print separator
          board_row = 0
        end
    end
  end

end
