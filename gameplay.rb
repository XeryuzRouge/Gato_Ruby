class GamePlay

  def play(selected_box, boxes, turn)

    if boxes[selected_box.to_i] == "   "
      boxes[selected_box.to_i] = turn
      turn=swap_turn(turn)
    else
      print "Casilla invalida #{boxes[selected_box.to_i]}\n"
    end
    return turn, selected_box.to_i
  end

  def swap_turn(current_turn)
    if current_turn == " X "
      current_turn = " O "
    else
      current_turn = " X "
    end
    return current_turn
  end

end