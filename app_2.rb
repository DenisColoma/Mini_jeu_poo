require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'
		#message d'accueil
puts "**************************************"
puts "Hello world ! They want to kill me !!!"
puts "Help me to beat them all !!!"
puts "**************************************"
puts "\n"
		#pour saisir un nom de joueur
puts "Please, enter your fighter's name:"
print "> "
user = gets.chomp
fighter = HumanPlayer.new(user)

		#determiner 2 ennemies
enemy1 = Player.new("Marco")
enemy2 = Player.new("Polo")
		#incrementer le tableau avec les joueurs
enemies = [enemy1, enemy2]
		#on rentre dans la boucle seulement si l'utilisateur et au moin un des enemies est en vie
while fighter.life_points > 0 && enemy1.life_points > 0 || enemy2.life_points > 0
	fighter.show_state
	puts "\n"
	puts "What do you wants to do ?"		#Menu determiner me type d'action que l'on peut faire
	puts "\n"
	puts "Press w - looking for better weappon"
	puts "Press h - looking for hp potion"

	puts "\n"
	puts "Attack an enemy"
	puts "\n"
	if enemy1.life_points > 0 		#on veut afficher la possibilité d'attaque seulement si l'ennemie1 est en vie
		puts "Press 1 to attack #{enemy1.name} with #{enemy1.life_points}hp"
	end
	if enemy2.life_points > 0			#idem pour l'ennemie 2
		puts "Press 2 to attack #{enemy2.name} with #{enemy2.life_points}hp"
	end
	print "> "
	case gets.strip		#reponse à la saisie du menu

		when "w"
			fighter.search_weappon
		when "h"
			fighter.search_health_pack
		when "1"		#on attaque l'ennemie 1 seulement s'il est vivant
			if enemy1.life_points > 0
				fighter.attacks(enemy1)
				enemy1.show_state
				puts "\n"

			end
		when "2"		 #idem pour l'ennemie 2
			if enemy2.life_points > 0
				fighter.attacks(enemy2)
				enemy2.show_state
			end
	end
	puts "\n"
	if (enemy1.life_points > 0 || enemy2.life_points > 0)
		puts "Your enemy is attacking"

		enemies.each do |enemy|		#on demande au tableau de faire attaquer les ennemies
			if enemy.life_points > 0		#les ennemies attaquent seulement s'ils sont en vie
				enemy.attacks(fighter)
			end
		end
	end
	puts "\n"

end
		#resultat des combats
puts "*****************"
puts "*** Game Over ***"
puts "*****************"
puts "\n"
		#l'utilisateur a gagné
if fighter.life_points > 0
	puts "***********************"
	puts "\n"
	puts "GG ! You are the winner"
	puts "\n"
else		#l'utilisateur a perdu
	puts "You Lose..."
end

binding.pry
