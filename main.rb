require "./game_loop.rb"
require "./player.rb"


player_1 = Player.new("Player 1", 3 )
player_2 = Player.new("Player 2", 3 )

mathOff = Game.new([player_1, player_2])
mathOff.game_loop
