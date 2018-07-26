
class CheckCPUPlays

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
end