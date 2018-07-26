
require_relative 'board_status'
require_relative 'check_cpu_plays'
require_relative 'evaluate_rows_cpu'

class CPU

  attr_accessor :icon_x
  attr_accessor :icon_o
  attr_accessor :empty

  def initialize
    board = BoardStatus.new
    @icon_x = board.icon_x
    @icon_o = board.icon_o
    @empty = board.empty
  end

  def reset
    @forced_exit = 1
  end

  def move(current_turn)
    team = current_turn
    enemy_team = icon_o if team == icon_x
    enemy_team = icon_x if team == icon_o

    evaluate_rows = EvaluateRowsCPU.new
    cpu_options = CheckCPUPlays.new
    current_combos = BoardStatus.win_combos

    @forced_exit = 0
    row = 0
    play_options = []
    possible_selection = 0

    while row < current_combos.length
      if evaluate_rows.check_row(row, current_combos, enemy_team, team) != nil
        play_options.insert(-1, evaluate_rows.check_row(row, current_combos, enemy_team, team))
      end
      row += 1
    end
    possible_selection = cpu_options.check_play_options(play_options)
    return nil if @forced_exit == 1
    return possible_selection
  end

end
