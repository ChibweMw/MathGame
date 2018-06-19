# class player
#   attr_accessor :lives, :score
#   attr_reader :name

#   def initialize(name, lives)
#     @name = name
#     @lives = lives
#   end

#   def solve(answer)
#     answer
#   end

#   def lose_life
#     @lives -= 1
#   end
# end

class Game
  def initialize(players)
    @players = players
    @inSession = true
    @currentPlayer = 0
  end

  def question
    a = rand(1..20)
    b = rand(1..20)
    puts "What does #{a} plus #{b} equal?"
    answer = gets.chomp.to_i

    if answer == (a + b)
      puts "YEP! #{answer} is CORRECT! :3"
    else
      @players[@currentPlayer][:lives] -= 1
      puts "#{answer} is WRONG! xD The answer is #{a + b}!"
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
      puts question
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

mathOff = Game.new([{ name: "Chuck", lives: 3 }, { name: "David", lives: 3 }])
mathOff.game_loop
