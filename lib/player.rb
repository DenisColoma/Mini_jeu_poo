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

	def compute_damage		#permet de faire un choix aléatoire entre 1 et 6 qui serotn utilisé en attack dans le mathode attacks
		return rand(1..6)
	end


end
