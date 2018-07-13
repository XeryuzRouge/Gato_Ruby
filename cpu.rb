
require './board_status'

class CPU

  attr_accessor :team

  def move
    @current_combos = BoardStatus.win_combos
    @forced_exit = 0
    row = 0
    team_counter = 0
    play_options = []
    temp_box = 0

    while row < @current_combos.length
      if check_row(row) != nil
        play_options.insert(-1, check_row(row))
      end
      row += 1
    end
    temp_box = check_play_options(play_options)
    return nil if @forced_exit == 1
    return temp_box
  end

  def reset
    @forced_exit = 1
  end

  private

  def check_play_options(possible_plays)
    temp_box = 0
    play = 0

    while play < possible_plays.length
      sleep(0.2)
      if possible_plays[play][0] >= 3
        temp_box = possible_plays[play]
        return temp_box[1]
      end
      play += 1
    end
    temp_box = possible_plays.sample
    return temp_box[1]
  end

  def check_row(row)
    enemy_team = " O " if @team == " X "
    enemy_team = " X " if @team == " O "
    temp_box_row = 0
    row_element = 0
    team_counter = 0
    enemy_team_counter = 0

    while row_element < @current_combos[row_element].length
      if @current_combos[row][row_element] == @team
        team_counter += 1
      elsif @current_combos[row][row_element] == enemy_team
        enemy_team_counter += 1
      else
        temp_box_row = @current_combos[row][row_element]
      end
      row_element += 1
    end

    return chosen_box(temp_box_row, team_counter, enemy_team_counter) if temp_box_row != 0

  end

  def chosen_box(temp_box_row, team_counter, enemy_team_counter)
    if team_counter == 2
      return 4, temp_box_row
    elsif enemy_team_counter == 2
      return 3, temp_box_row
    else 
      return 1, temp_box_row
    end
  end

end
