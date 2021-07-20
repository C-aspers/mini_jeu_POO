require 'bundler'
Bundler.require
require 'colorize'
require 'pry'
require_relative 'lib/game'
require_relative 'lib/player'

system 'clear'

#puts String.colors #Permet d'avoir les couleurs dans le terminal

#Présentation des joueurs
puts "Présentation".blue
player1 = Player.new("Josiane")
player2 = Player.new("José")
player3 = HumanPlayer.new("Audrey")

puts ""

puts "À ma droite #{player1.name}"
puts "À ma gauche #{player2.name}"

#Boucle : 
while player1.life_points > 0 && player2.life_points >0 
  

    puts ""
    puts "Voici l'état de chaque joueur :".blue
    puts ""

    #etat de chaque joueur
    print "#{player1.show_state}"
    puts "#{player2.show_state}"

    #phase d'attaque
    puts "Passons à la phase d'attaque :".blue

    puts "#{player1.name} attaque #{player2.name}"

    player1.attacks(player2)#Attaque du joueur 1
    puts ""
        #si le joueur 2 a encore des vies, il peut attaquer
    if  player2.life_points > 0
          puts "#{player2.name} attaque #{player1.name}"
          player2.attacks(player1)
    else
      break
    end
end


binding.pry