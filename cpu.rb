class CPU

  attr_accessor :current_combos

  def move
    row = 0
    o_Counter = 0
    play_options = []
    temp_box = 0

    while row < current_combos.length
      if CheckRow(row) != nil
        play_options.insert(-1, CheckRow(row))
        print "rows: #{row}"
      end
      row += 1
    end
    temp_box = CheckPlayOptions(play_options)
    return temp_box
  end

  def CheckPlayOptions(possible_plays)
    temp_box = 0
    play = 0

    while play < possible_plays.length
      if possible_plays[play][0] >= 3
        temp_box = possible_plays[play]
        return temp_box[1]
      end
      play += 1
    end
    temp_box = possible_plays.sample
    return temp_box[1]
  end

  def CheckRow(row)
    temp_box_row = 0
    row_element = 0
    o_Counter = 0
    x_Counter = 0

    while row_element < current_combos[row_element].length
      if current_combos[row][row_element] == " O "
        o_Counter += 1
      elsif current_combos[row][row_element] == " X "
        x_Counter += 1
      else
        temp_box_row = current_combos[row][row_element]
      end
      row_element += 1
    end

    if temp_box_row != 0
      if o_Counter == 2
        return 4, temp_box_row
      elsif x_Counter == 2
        return 3, temp_box_row
      else 
        return 1, temp_box_row
      end
    else
      return nil
    end
  end

end