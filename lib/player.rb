class Player
attr_accessor :name, :life_points

#  def initialize(name_player, life_player)
#    @name = name_player.to_s
#    @life_points = life_player.to_i
#  end

  def initialize(name)
    @name = name.to_s
    @life_points = 10
  end

  def show_state
    puts "#{@name} a #{@life_points} points de vie"
  end

  def gets_damage(damage) 
    #damage = 5
    @life_points = @life_points - damage
      if @life_points <= 0
        puts "il lui inflige #{damage} points de dommages"
        puts "le joueur #{@name} a été tué !".red
      else
        puts "il lui inflige #{damage} points de dommages"
      end
  end

  def attacks(player2) # dommage subit par le joueur 2
    
    #damage = rand(1..6)
    damage = compute_damage
    player2.gets_damage(damage)
  end

  def compute_damage #dommages (chiffre au hasard entre 1 et 6)
    return rand(1..6)
  end

end

class HumanPlayer < Player
attr_accessor :weapon_level

    def initialize(name)
      @name = name.to_s
      @life_points = 100
      @weapon_level = 1
    end

    def show_state
      puts "#{@name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}"
    end

    #def gets_damage(damage) 
      #damage = 5
      #@life_points = @life_points - damage
        #if @life_points <= 0
          #puts "il lui inflige #{damage} points de dommages"
          #puts "le joueur #{@name} a été tué !".red
        #else
          #puts "il lui inflige #{damage} points de dommages"
        #end
    #end

    def compute_damage
      rand(1..6) * @weapon_level
    end

    #def attacks(player2) # dommage subit par le joueur 2
    
      #damage = compute_damage
      #player2.gets_damage(damage)
    #end

    def search_weapon #Donne la valeur de la nouvelle arme et compare avec celle actuelle
      new_weapon = rand(1..6)
      puts "Tu as trouvé une arme de niveau #{new_weapon}"
        if new_weapon > weapon_level
          puts "Youhou ! elle est meilleure que ton arme actuelle : tu la prends."
          weapon_level = new_weapon
        else
          puts "M@*#$... elle n'est pas mieux que ton arme actuelle..."
        end
    end

    def search_health_pack
      health_pack = rand(1..6)
      if health_pack == 1
        puts "Tu n'as rien trouvé..."
      elsif health_pack >= 2 && health_pack <=5
        puts "Bravo, tu as trouvé un pack de +50 points de vie !"
        @life_points = @life_points + 50 
        if @life_points > 100
          @life_points = 100
        end
      else 
        puts "MWaow, tu as trouvé un pack de +80 points de vie !"
        @life_points = @life_points + 80 
        if @life_points > 100
          @life_points = 100
        end
      end
    end


end