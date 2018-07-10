
begin
  require 'Win32API'
rescue LoadError
  @@not_windows = 1
end
     
class CaptureKey
     
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

  def exit_with_input

    key_esc = 27
    get_exit = "q"

    if defined? @@not_windows
      key = gets.chomp
      print key

      return key_esc if key == get_exit
      return key
    else
      capture_key do |key|
        if key == key_esc
          return key_esc
        else 
          return key.chr
        end
      end
    end
  end

  def interrupt_cpu_and_exit
    key_esc = 27
    get_exit = "q"

    if defined? @@not_windows
          s = gets.chomp
            return key_esc if s == get_exit
    else
      capture_key do |key|
        if key == key_esc
          return key_esc
        else 
          return key.chr
        end
      end
    end
  end
end
