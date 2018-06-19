class Player
  attr_accessor :lives, :score
  attr_reader :name

  def initialize(name, lives)
    @name = name
    @lives = lives
  end

  def solve(answer)
    answer
  end

  def lose_life
    @lives -= 1
  end
end