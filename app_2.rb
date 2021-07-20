require 'bundler'
Bundler.require

require 'pry'
require 'colorize'
require_relative 'lib/game'
require_relative 'lib/player'

#Efface le terminal
system 'clear'

#player4 = HumanPlayer.new("@name")

#Accueil
puts "-------------------------------------------------"
puts "|Bienvenue sur 'ILS VEULENT TOUS MA POO' !|"
puts "|Le but du jeu est d'être le dernier survivant !|"
puts "-------------------------------------------------"

#Initialisation du joueur
puts "Hello, what's your name ?"
print ">"
gamer_name = gets.chomp
puts "Bienvenue #{gamer_name} dans ce nouveau jeu!"
puts ""


#Initialisation  des ennemis
human = HumanPlayer.new("#{gamer_name}")  
player1 = Player.new("José")
player2 = Player.new("Josiane")
enemies_array = [player1, player2]


#Démarrage du combat
while human.life_points >0 && (player1.life_points > 0 || player2.life_points >0)
  
  #etat de chaque joueur
  puts ""
  puts "Voici l'état du joueur humain:".blue
  puts "#{human.show_state}"
  puts ""

  puts "Voici l'état des joueurs ennemies :".blue
  puts ""
  print "#{player1.show_state}"
  puts "#{player2.show_state}"

  #wMenu pour choisir
  puts "Quelle action veux-tu effectuer ?".green
  puts ""
  puts "a - chercher une meilleure arme"
  puts "s - chercer à se soigner"
  puts ""
  puts "attaquer un joueur en vue :".light_blue
  print "0 - "
  print "#{player1.show_state}"
  print "1 - "
  print "#{player2.show_state}"
  print ">"

  #choix du joueur
  human_choice = gets.chomp.to_s
  puts ""
  choice_0 = "0"
  choice_1 = "1"
  choice_a = "a"
  choice_s = "s"

  #évênement selon choix du joueur
  if human_choice == choice_0
    human.attacks(player1)
  elsif human_choice == choice_1
    human.attacks(player2)
  elsif human_choice == choice_a 
    human.search_weapon
  else human_choice == choice_s 
    human.search_health_pack
  end
  sleep 1
  puts ""
  #IA
  if player1.life_points > 0 or player2.life_points > 0
    puts "L'ennemi t'attaque !".red
    enemies_array.each do |enemies|
      if enemies.life_points != 0
        enemies.attacks(human)
        puts ""
      end
    end
  end
  sleep 1
end

#Fin de partie
puts "La partie est finie"
if human.life_points > 0
puts "BRAVO ! TU AS GAGNE !".blue
else
  puts "Loser ! Tu as perdu !".red
end



#binding.pry