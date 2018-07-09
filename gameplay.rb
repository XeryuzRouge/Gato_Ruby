class GamePlay

  attr_accessor :turn
  attr_accessor :last_turn
  attr_accessor :plays_counter

  def initialize
    reset
  end

  def reset
    @turn = " X "
    @last_turn = " X "
    @plays_counter = 0
  end

  def play(selected_box, boxes)
    if boxes[selected_box.to_i] == "   "
      boxes[selected_box.to_i] = @turn
      @turn = swap_turn(@turn)
    else
      print "Casilla invalida: ", selected_box
    end
    return @turn, selected_box.to_i
  end

  private

  def swap_turn(current_turn)
    if current_turn == " X "
      current_turn = " O "
    else
      current_turn = " X "
    end
    return current_turn
  end

end