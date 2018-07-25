
require_relative 'draw_board'

class BoardStatus

  attr_accessor :win_combos
  attr_accessor :boxes
  attr_accessor :icon_x
  attr_accessor :icon_o
  attr_accessor :empty
  attr_accessor :board_style

  def initialize
    game_icons(2)
    reset
  end

  def game_icons(choice)
    @board_style = choice
    if choice == 1
      @icon_x = " X "
      @icon_o = " O "
      @empty = "   "
    elsif choice == 2
      @icon_x = "x"
      @icon_o = "o"
      @empty = "_"
    elsif choice == 3
      @icon_x = "equis"
      @icon_o = "ceros"
      @empty = "     "
    end
  end

  def self.win_combos
    @@win_combos
  end

  def reset
    @@win_combos = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], 
                 [2, 5, 8], [3, 6, 9], [1, 5, 9], [7, 5, 3]]

    @boxes = {1 => empty, 2 => empty, 3 => empty, 4 => empty,
              5 => empty, 6 => empty, 7 => empty, 8 => empty, 
              9 => empty}
  end

  def check_for_winner(selected_box, player)
    i = 0
    while i < @@win_combos.length
    j = 0
      while j < @@win_combos[i].length
        @@win_combos[i][j] = player if @@win_combos[i][j] == selected_box
        j += 1
      end
      return true if @@win_combos[i] == [player, player, player]
      i += 1
    end
  end

  def draw_board
    draw_board = DrawBoard.new
    draw_board.draw_board(@boxes, board_style)
  end

end
