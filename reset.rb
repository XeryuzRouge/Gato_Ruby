class Reset

  def values (*args)
    reset_errors = []
    i = 0
    while i < args.length
      begin
        args[i].reset
      rescue StandardError => e
        reset_errors.insert(-1, args[i].class.name)
      end
      i += 1
    end
    return reset_errors
  end

end