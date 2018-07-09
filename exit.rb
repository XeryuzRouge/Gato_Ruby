require 'Win32API'
     
class ExitLogic
     
  def capture_key
    kbhit = Win32API.new("msvcrt", "_kbhit", [], 'I')
    getch = Win32API.new("msvcrt", "_getch", [], 'I')

    unless kbhit.call.zero?
      yield getch.call
    end

  end

  def salte 
    key_esc = 27
    loop do
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