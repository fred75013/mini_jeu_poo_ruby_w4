require 'pry'
require 'bundler'
Bundler.require

#require_relative 'lib/game'
require_relative 'lib/player'

#Créer et mettre dans une variable les combattants:
player1 = Player.new("Josiane")
player2 = Player.new("José")

#Boucle de combat (faites vos paris): 
while player1.life_points > 0 && player2.life_points > 0
    puts "Voici l'état de chaque joueur :"
    puts "#{player1.show_state}"
    puts "#{player2.show_state}"
    puts "----------------------------------"
    puts "Fight !"
    puts "#{player1.attacks(player2)}"
    break if player2.life_points <= 0
    puts "#{player2.name} ne se laisse pas faire est contre attaque !"
    puts "#{player2.attacks(player1)}"
    puts "----------------------------------"
end
puts "----------------------------------"
puts "Fin du Game"

#binding.pry
