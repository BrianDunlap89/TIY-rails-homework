class CountingPlayer
  def initialize
    @count = 0
  end

  def get_guess(result, last_guess)
    @count += 1
  end
end
