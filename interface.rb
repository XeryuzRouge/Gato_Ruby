class Interface

  attr_accessor :x_score
  attr_accessor :o_score
  attr_accessor :tie_score
  attr_accessor :vs

  def reset
    @x_score = 0
    @o_score = 0
    @tie_score = 0
  end

  def draw_interface(turn)
    print "\nturno de:", "#{turn}\n\n"
    print "\nSelecciona una casilla: "
  end

  def main_menu(reset_errors)
    choice = 1
    @vs = 0
    loop do
      system "cls"
      print "Dear developer:\nThere's no reset method in #{reset_errors}. \n\n" if reset_errors.any?
      print "Selecciona una opción valida\n\n" if choice != 1 && choice != 2
      print "Player vs Player (1) \nPlayer vs CPU (2) \n"
      choice = gets.to_i
      if choice == 1 || choice == 2
        @vs = choice
        break 
      end
    end
  end

  def draw_scoreboard
    print "Marcador:\nX=#{x_score}  O=#{o_score}\nEmpates=#{tie_score}\n\n"
  end

  def results(winner)
    @x_score += 1 if winner == " X "
    @o_score += 1 if winner == " O "
    @tie_score += 1 if winner == "tie"
  end

end