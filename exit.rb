require 'Win32API'
     
     class Laexit
      @@kbhit = Win32API.new("msvcrt", "_kbhit", [], 'I')
      @@getch = Win32API.new("msvcrt", "_getch", [], 'I')
     
       def capture_key
          unless @@kbhit.call.zero?
             yield @@getch.call
         end
      end
    end