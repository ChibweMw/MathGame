# class player
#   attr_accessor :lives, :score
#   attr_reader :name

#   def initialize(name, lives)
#     @name = name
#     @lives = lives
#     @maxLives = lives
#     @score = 0
#   end

#   def solve(answer)
#     answer
#   end

#   def lose_life
#     @lives -= 1
#   end
# end

class Game
  #just needs to run game turn to turn
  #Checking in game should end or not
  #but how? Check player lives? Yes!
  def initialize(players)
    @players = players
    @inSession = true
    @turnCount = 0
  end


  def question
    a = rand(1..20)
    b = rand(1..20)
    puts "What does #{a} plus #{b} equal?"
    answer = "> #{gets.chomp.to_i}"

    if answer == (a + b)
      puts a + b
      return "YEP! #{answer} is CORRECT!"
    else
      puts a + b
      return "#{answer} is WRONG!"
    end
  end

  def turn
    @players.each do |currentPlayer|
      currentPlayer[:lives] -= 1
      question
      puts "P1: #{@players[0][:lives]}/3 vs P2: #{@players[1][:lives]}/3"
      puts "--------NEW TURN--------"
    end
  end

  def game_loop
    while @inSession
      #this is where the game happens
      if @players[0][:lives] == 0 || @players[1][:lives] == 0
        puts "---X-GAME-x-OVER-X----"
        @inSession = false
      else
        turn
      end
    end
  end

end

mathOff = Game.new([{ name: "Chuck", lives: 3 }, { name: "David", lives: 3 }])
mathOff.game_loop
