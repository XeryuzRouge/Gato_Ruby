class CheckForWinner

  attr_accessor :win_combos

  def initialize
    reset
  end

  def reset
    @win_combos = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], 
                 [2, 5, 8], [3, 6, 9], [1, 5, 9], [7, 5, 3]]
  end

  def check_it(selected_box, player)

    i = 0
    while i < @win_combos.length
    j = 0
      while j < @win_combos[i].length
        @win_combos[i][j] = player if @win_combos[i][j] == selected_box
        j += 1
      end
      return true if @win_combos[i] == [player, player, player]
      i += 1
    end
  end

end
