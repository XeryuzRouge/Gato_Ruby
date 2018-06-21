class CheckForWinner

  def check_it(current_combos, selected_box, player)
    i = 0
    while i < current_combos.length
    j = 0
      while j < current_combos[i].length
        current_combos[i][j] = player if current_combos[i][j] == selected_box
        j += 1
      end
      return true if current_combos[i] == [player, player, player]
      i += 1
    end
  end

end