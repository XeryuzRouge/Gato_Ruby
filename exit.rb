require 'Win32API'
     
     class ExitLogic
      @@kbhit = Win32API.new("msvcrt", "_kbhit", [], 'I')
      @@getch = Win32API.new("msvcrt", "_getch", [], 'I')
     
       def capture_key
          unless @@kbhit.call.zero?
             yield @@getch.call
         end
      end

      def salte 

        loop do
          capture_key do |key|
          if key == KEY_Esc

            return 27

          else 
          return key.chr
       end 
      end
    end
  end
end