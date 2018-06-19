# class player
#   attr_accessor :lives, :score
#   attr_reader :name

#   def initialize(name, lives)
#     @name = name
#     @lives = lives
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
    @currentPlayer = 0
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
    if @players[0][:lives] == 0
      game_end @players[1]
      @inSession = false
    elsif @players[1][:lives] == 0
      game_end @players[0]
      @inSession = false
    else
      @players[@currentPlayer][:lives] -= 1
      question
      puts "P1: #{@players[0][:lives]}/3 vs P2: #{@players[1][:lives]}/3"
      puts "--------NEW TURN--------"
      if @currentPlayer == 0
        @currentPlayer = 1
      else
        @currentPlayer = 0
      end
    end
  end

  def game_loop
    while @inSession
      turn
    end
  end

  def game_end (winner)
    puts "The winner is -#{winner[:name]}- with a score of #{winner[:lives]}/3"
    puts "---X-GAME-x-OVER-X----"
    puts "Buh bye! :3"
  end

end

mathOff = Game.new([{ name: "Chuck", lives: 4 }, { name: "David", lives: 3 }])
mathOff.game_loop
