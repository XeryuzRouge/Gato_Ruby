class Reset

  def values (*args)
    reset_errors = []
    i = 0
    while i < args.length
        args[i].reset
      i += 1
    end
  end

end