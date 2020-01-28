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

enemies = [enemy1, enemy2]

while fighter.life_points > 0 && enemy1.life_points > 0 || enemy2.life_points > 0
	fighter.show_state
	puts "What do you wants to do ?"
	puts "\n"
	puts "Press w - looking for better weappon"
	puts "Press h - looking for hp potion"

	puts "\n"
	puts "Attack an enemy"
	if enemy1.life_points > 0 
		puts "Press 1 to attack #{enemy1.name} with #{enemy1.life_points}hp"
	end
	if enemy2.life_points > 0	
		puts "Press 2 to attack #{enemy2.name} with #{enemy2.life_points}hp"
	end
	print "> "
	case gets.strip

		when "w"
			fighter.search_weappon
		when "h"
			fighter.search_health_pack
		when "1"
			if enemy1.life_points > 0
				fighter.attacks(enemy1)
			end
		when "2"
			if enemy2.life_point > 0
				fighter.attacks(enemy2)
			end
	end
	puts "\n"
	if fighter.life_points > 0
		puts "Your enemy is attacking"

		enemies.each do |enemies|
			enemies.attacks(fighter)
		end
	else
		fighter.life_points = 0
		break
	end


end


binding.pry
