
require_relative 'draw_board'
require_relative 'languages'


class Interface

  attr_accessor :x_score
  attr_accessor :o_score
  attr_accessor :tie_score
  attr_accessor :player1
  attr_accessor :player2
  attr_reader :input
  attr_reader :msg

  def initialize(input, lang)
    @input = input
    reset
    @msg = Languages.new(lang)
  end

  def reset
    @x_score = 0
    @o_score = 0
    @tie_score = 0
    @player1 = nil
    @player2 = nil
  end

  def show_instructions(turn)
    print "\n#{msg.show_instructions(1)}", "#{turn}\n\n"
    print "\n#{msg.show_instructions(2)} "
  end

  def input_player_filter
    tries_counter = 0
    loop do 
      player = input.gets.chomp 
      return player if player == "h" || player == "c"
      print "\n#{msg.input_player_filter(1)}" if tries_counter <=1
      print "\n#{msg.input_player_filter(2)}" if tries_counter >=2 && tries_counter <=4
      print "\n#{msg.input_player_filter(3)}" if tries_counter == 5
      print "\n#{msg.input_player_filter(4)}" if tries_counter >= 6 && tries_counter <= 8
      if tries_counter >= 9
        print "\n#{msg.input_player_filter(5)}"
        exit
      end
      tries_counter += 1
    end
  end

  def main_menu
    loop do
      system "cls"
      print "\n#{msg.main_menu(1)}"
        @player1 = input_player_filter 
      print "\n#{msg.main_menu(2)}"
        @player2 = input_player_filter
      break
    end
  end

  def draw_scoreboard
    print "#{msg.draw_scoreboard(1)}X=#{x_score}  O=#{o_score}\n#{msg.draw_scoreboard(2)}#{tie_score}\n\n"
  end

  def results(winner)
    @x_score += 1 if winner == " X "
    @o_score += 1 if winner == " O "
    @tie_score += 1 if winner == "tie"
  end

end
