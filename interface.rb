class Interface

  def draw_interface(turn)
    print "\nturno de:", "#{turn}\n\n"
    print "\nSelecciona una casilla: "
  end

  def main_menu
    choice = 0
    loop do
      system "cls"
      print "Selecciona una opción valida\n\n" if choice != 0
      print "Player vs Player (1) \nPlayer vs CPU (2) \n"
      choice = gets.to_i
      return choice if choice == 1 || choice == 2
    end
  end

end