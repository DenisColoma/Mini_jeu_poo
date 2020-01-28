class Player		#initialisation de la classe player
	attr_accessor :name, :life_points		#initialisation des instances

	def initialize(name_init)		#initialisation des variable dans ma premiere methode
		@name = name_init
		@life_points = 10
	end

	def show_state 		#cette methode sers a verifier les points de vie restants
		puts "#{@name} have #{@life_points} life points left"
	end

	def gets_damage(dmg)		#cette methode fait subir des dommages aux players et si celui ci n'a plus de pts de vie, un message lui indique qu'il est mort
		@life_points = @life_points - dmg

		if @life_points <= 0
			puts "#{name} is dead"
		end
	end

	def attacks(victim)		#permet de dire qui attaque qui
		puts "The gamer #{name} attack #{victim.name}"
		dmg = compute_damage
		puts "#{name} give #{dmg} damage to #{victim.name}"
		victim.gets_damage(dmg)
	end

	def compute_damage		#permet de faire un choix aléatoire entre 1 et 6 qui serotn utilisé en attack dans le methode attacks
		return rand(1..6)
	end

end

class HumanPlayer < Player		#nouvelle classe, qui reprend la classe mère Player
	attr_accessor :weappon_level		#nouvelle instance

	def initialize(name_init) 		#nouvelle initialisation pour l'humain
		@weappon_level = 1
		@life_points = 100
		@name = name_init
	end

	def show_state		#modifie légèrement la sortie de la methode
		 puts "#{@name} have #{@life_points} life points left and his weappon is lv.#{weappon_level}"
	end

	def compute_damage		#methode indiquant les degats causé par l'humain
	   return rand(1..6) * @weappon_level
	end

	def search_weappon		#determination du niveau de la nouvelle arme
		new_weappon = rand(1..6)
		puts "You find a weappon lvl.#{new_weappon}"

		if new_weappon > @weappon_level
			puts "GG, your this weappon is better than yours. Keep it !"
			@weappon_level = new_weappon
		elsif new_weappon <= @weappon_level
			puts "Crap...it's not better than yours..."
		end

	end

	def search_health_pack
		hp = rand(1..6)
		
		if hp == 1
			puts "You found nothing"

		elsif hp > 1 && hp <= 5
			puts "You found 50hp potion"

			if @life_points <= 100
				@life_points = @life_points + 50
			else
				@life_points = 100
			end

		elsif hp == 6
			puts "You found 80hp"

			if @life_points <= 20
				@life_points = @life_points + 80
			else
				@life_points = 100
			end

		end

	end

end
