
begin
  require 'Win32API'
rescue LoadError
  @@not_windows = 1
end
     
class CaptureKey

  @@key_esc = 27
     
  def capture_key
    if defined?  @@not_windows
      
    else
      kbhit = Win32API.new("msvcrt", "_kbhit", [], 'I')
      getch = Win32API.new("msvcrt", "_getch", [], 'I')

      unless kbhit.call.zero?
        yield getch.call
      end
    end

  end

  def lets_input
    @get_exit = "q"

    if defined? @@not_windows
      key = gets.chomp

      return @@key_esc if key == @get_exit
      return key

    else
      loop do
        capture_key do |key|
          if key == @@key_esc
            return @@key_esc
          else 
            return key.chr
          end
        end
      end
    end

  end

  def interrupt_cpu_and_exit?
    if defined? @@not_windows
      s = gets.chomp
        return true
    else
      loop do
        capture_key do |key|
          return true if key == @@key_esc
        end
      end
    end
  end
end
