
class EvaluateRowsCPU

def check_row(row, current_combos, enemy_team, team)
    temp_box_row = 0
    row_element = 0
    team_counter = 0
    enemy_team_counter = 0

    while row_element < current_combos[row_element].length
      if current_combos[row][row_element] == team
        team_counter += 1
      elsif current_combos[row][row_element] == enemy_team
        enemy_team_counter += 1
      else
        temp_box_row = current_combos[row][row_element]
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