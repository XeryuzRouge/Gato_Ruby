
require_relative 'capture_key'
require_relative 'cpu'

class GamePlay

  attr_accessor :turn
  attr_accessor :last_turn
  attr_accessor :turn_x
  attr_accessor :turn_y
  attr_accessor :plays_counter
  attr_accessor :option_selected
  attr_accessor :icon_x
  attr_accessor :icon_o
  attr_accessor :empty

  @@cpu = CPU.new

  def initialize(interface)
    @icon_x = @@cpu.icon_x
    @icon_o = @@cpu.icon_o
    @empty = @@cpu.empty
    @interface = interface
    reset
  end

  def reset
    @turn = icon_x
    @last_turn = @turn
    @plays_counter = 0
    @option_selected = nil
    @@cpu.reset 
  end

  def play(boxes)
    selected_box = @option_selected
    if boxes[selected_box] == empty
      boxes[selected_box] = @turn
      @turn = swap_turn(@turn)
    else
      @interface.invalid_box_message(selected_box)
    end
    return @turn, selected_box.to_i
  end

  def human?
    return true if (turn == icon_x && turn_x == "h") || (turn == icon_o && turn_y == "h")
    return false if(turn == icon_x && turn_x == "c") || (turn == icon_o && turn_y == "c")
  end

  def input_cpu
    @@cpu.team = turn
    @option_selected = @@cpu.move
  end

  def turn_base_TEMPORAL(input, boxes)
    plays_results = []
    while turn == last_turn
      if human?
        @option_selected = input.gets.to_i
      else
        input_cpu
      end
      plays_results = play(boxes)
      turn = plays_results[0] if plays_results[1]
      @plays_counter += 1
      return plays_results
    end
  end

  private

  def swap_turn(current_turn)
    if current_turn == icon_x
      current_turn = icon_o
    else
      current_turn = icon_x
    end
    return current_turn
  end

end