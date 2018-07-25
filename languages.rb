
class Languages

  attr_reader :language

  def initialize(language)
    @language = language
  end

  def invalid_box_message(msg)
    case language
    when "es"
      return "\ncasilla invalida: " if msg == "invalid box"
      return ", que onda con eso" if msg == "whats up with that"
    else
      return "\nInvalid box: " if msg == "invalid box"
      return ", what's up with that" if msg == "whats up with that"
    end
    
  end

 
  def show_instructions(msg)
    case language
    when "es"
      return "turno de:" if msg == "turn of"
      return "selecciona una caja:"  if msg == "select a box"
    else
      return "turn of:" if msg == "turn of"
      return "select a box:"  if msg == "select a box"
    end
  end

  def human_or_cpu(msg)
    case language
      when "es"
      return "Jugador #{msg}: Humano o CPU? (h, c)" 
    else
      return "player #{msg}: human or CPU? (h, c)"
    end
  end

  def input_player_filter_fail_msg(msg)
    case language
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
    case language
      when "es"
        return "Marcador:\n" if msg == "score"
        return "Empates=" if msg == "ties"
      else
        return "Score:\n" if msg == "score"
        return "Ties=" if msg == "ties"
    end
    
  end

end