
require './draw_board'

class Interface

  attr_accessor :x_score
  attr_accessor :o_score
  attr_accessor :tie_score
  attr_accessor :player1
  attr_accessor :player2
  attr_reader :input

  def initialize(input)
    @input = input
    reset
  end

  def reset
    @x_score = 0
    @o_score = 0
    @tie_score = 0
    @player1 = nil
    @player2 = nil
  end

  def show_instructions(turn)
    print "\nturno de:", "#{turn}\n\n"
    print "\nSelecciona una casilla: "
  end

  def input_player_filter
    tries_counter = 0
    loop do 
      player = input.gets.chomp 
      return player if player == "h" || player == "c"
      print "h o c...\n" if tries_counter <=1
      print "la tecla h, o  o la tecla c...\n" if tries_counter >=2 && tries_counter <=4
      print "neta...\n" if tries_counter == 5
      print "...\n" if tries_counter >= 6 && tries_counter <= 8
      if tries_counter >= 9
        print "ya bye\n"
        exit
      end
      tries_counter += 1
    end
  end

  def main_menu
    loop do
      system "cls"
      print "Jugador 1: Humano o CPU? (h, c) \n"
        @player1 = input_player_filter 
      print "Jugador 2: Humano o CPU? (h, c)"
        @player2 = input_player_filter
      print "asi quedaron: \n#{@player1}"
      break
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
