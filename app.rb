require 'bundler'
Bundler.require
		#fait appel au 2 fichiers contenu dans le lib
require_relative 'lib/game'
require_relative 'lib/player'
		#creation des 2 personnages
player1 = Player.new("Marco")
player2 = Player.new("Polo")
puts "here we have"
		#condition d'attack : il faut que les 2 soit vivant sinon break = sortie de boucle
while player1.life_points > 0 && player2.life_points > 0
	player1.show_state
	player2.show_state

	puts "Let's go with the first attack"
	puts "\n"
	player1.attacks(player2)
	if player2.life_points <= 0
		break
	else
		player2.attacks(player1)
	end
end

binding.pry
