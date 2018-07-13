require_relative "./capture_key"

class ExitOnEscape
  def initialize
    @input_key = CaptureKey.new 
  end

  def run
    Thread.new do
      loop do
        key = @input_key.lets_input
        
        if is_esc?(key)
          # lets_restart
        else
          @not_esc = key
        end
      end
    end
  end

  def gets
    while !@not_esc
    end

    key = @not_esc.dup
    @not_esc = nil

    key
  end

  private

  def is_esc?(key)
    false
  end
end