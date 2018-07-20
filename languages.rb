
class Languages

  attr_reader :lang

  def initialize(lang)
    @lang = lang
  end

 
  def show_instructions(msg)
    case @lang
    when "es"
      return "turno de:" if msg == 1
      return "selecciona una caja:"  if msg == 2
    else
      return "turn of:" if msg == 1
      return "select a box:"  if msg == 2
    end
  end

  def main_menu(msg)
    case @lang
      when "es"
      return "Jugador #{msg}: Humano o CPU? (h, c)" 
    else
      return "player #{msg}: human or CPU? (h, c)"
    end
  end

  def input_player_filter(msg)
    case @lang
      when "es"
        return "h o c...:\n" if msg == 1
        return "la tecla h, o la tecla c...:\n" if msg == 2
        return "neta...:\n" if msg == 3
        return "...:\n" if msg == 4
        return "ya bye\n"if msg == 5
      else
        return "h or c...:\n" if msg == 1
        return "key h or key o...:\n" if msg == 2
        return "really?...:\n" if msg == 3
        return "...:\n" if msg == 4
        return "ok bye\n"if msg == 5
    end
  end

  def draw_scoreboard(msg)
    case @lang
      when "es"
        return "Marcador:\n" if msg == 1
        return "Empates=" if msg == 2
      else
        return "Score:\n" if msg == 1
        return "Ties=" if msg == 2
    end
    
  end

end