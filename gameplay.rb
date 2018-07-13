
require './capture_key'
require './cpu'

class GamePlay

  attr_accessor :turn
  attr_accessor :last_turn
  attr_accessor :turn_x
  attr_accessor :turn_y
  attr_accessor :plays_counter
  attr_accessor :option_selected

  @@x_character = " X "
  @@o_character = " O "
  @@cpu = CPU.new

  def initialize
    reset
  end

  def reset
    @turn = @@x_character
    @last_turn = @turn
    @plays_counter = 0
    @option_selected = nil
    @@cpu.reset 
  end

  def play(boxes)
    selected_box = @option_selected
    return selected_box if selected_box == 27
    if boxes[selected_box.to_i] == "   "
      boxes[selected_box.to_i] = @turn
      @turn = swap_turn(@turn)
    else
      print "Casilla invalida: ", selected_box, ", que es eso"
    end
    return @turn, selected_box.to_i
  end

  def human?
    return true if (turn == " X " && turn_x == "h") || (turn == " O " && turn_y == "h")
    return false if(turn == " X " && turn_x == "c") || (turn == " O " && turn_y == "c")
  end

  def input_cpu
    @@cpu.team = turn
    @option_selected = @@cpu.move
  end

  private

  def swap_turn(current_turn)
    if current_turn == @@x_character
      current_turn = @@o_character
    else
      current_turn = @@x_character
    end
    return current_turn
  end

end