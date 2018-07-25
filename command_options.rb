
require_relative 'languages'

class CommandOptions

  def initialize
    commands = ARGV
    command = commands[0]
    command_args = commands[1]

    case command
      when "-lang"
       Languages.language(command_args)
    end
  end
end
