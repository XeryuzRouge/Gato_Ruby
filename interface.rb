
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

  def main_menu
    loop do
      system "cls"
      print "Jugador 1: Humano o CPU? (h, c) \n"
      @player1 = input.gets.chomp
      print "Jugador 2: Humano o CPU? (h, c)"
      @player2 = input.gets.chomp
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
