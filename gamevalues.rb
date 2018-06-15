
class GameValues

  attr_accessor :score_x
  attr_accessor :score_o
  attr_accessor :boxes
  attr_accessor :turn
  attr_accessor :last_turn
  attr_accessor :plays_counter
  attr_accessor :win_combos
  attr_accessor :vs

  def redo

    @turn = " X "
    @last_turn = " X "
    @plays_counter = 0

    @win_combos = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], 
                 [2, 5, 8], [3, 6, 9], [1, 5, 9], [7, 5, 3]]

    @boxes = {1 => "   ", 2 => "   ", 3 => "   ", 4 => "   ",
              5 => "   ", 6 => "   ", 7 => "   ", 8 => "   ", 
              9 => "   ", }
  end

end