class CPU

  attr_accessor :current_combos

  def move
    row = 0
    o_counter = 0
    play_options = []
    temp_box = 0

    while row < current_combos.length
      if check_row(row) != nil
        play_options.insert(-1, check_row(row))
      end
      row += 1
    end
    temp_box = check_play_options(play_options)
    return temp_box
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
    temp_box_row = 0
    row_element = 0
    o_counter = 0
    x_counter = 0

    while row_element < current_combos[row_element].length
      if current_combos[row][row_element] == " O "
        o_counter += 1
      elsif current_combos[row][row_element] == " X "
        x_counter += 1
      else
        temp_box_row = current_combos[row][row_element]
      end
      row_element += 1
    end

    return chosen_box(temp_box_row, o_counter, x_counter) if temp_box_row != 0

  end

  def chosen_box(temp_box_row, o_counter, x_counter)
    if o_counter == 2
      return 4, temp_box_row
    elsif x_counter == 2
      return 3, temp_box_row
    else 
      return 1, temp_box_row
    end
  end

end