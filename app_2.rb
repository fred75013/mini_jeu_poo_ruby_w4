require 'pry'
require 'bundler'
Bundler.require

require_relative 'lib/player'

puts "---------------------------------------------------------------------"
puts "|            Welcome sur ILS VEULENT TOUS MES FESSES !              |"       
puts "|            Le but du jeu : IL N'EN RESTERA QU'UNE !               |"
puts "---------------------------------------------------------------------"

puts "-------------------->>>>ENTREZ VOTRE NOM<<<<-------------------------"
name = gets.chomp
user = HumanPlayer.new(name)
puts "-------------------->>>>Ils sont SANS PITIE<<<<-----------------------"
puts "-------------------->>>> Ils sont INVINCUS <<<<-----------------------"
puts "-------------->>>>Un tonnerre d'applaudissement Pour<<<<--------------"
player1 = Player.new("Josiane")
player2 = Player.new("José")
puts "#{player1.show_state}"
puts "---------------------------->>>>&<<<<---------------------------------"
puts "#{player2.show_state}"
puts "---------------------->>>>Force & Honneur !<<<<-----------------------"

enemies = [player1, player2]

while user.life_points > 0 && (player1.life_points > 0 || player2.life_points > 0) 
#etat du joueur:
    puts "#{user.show_state}"
#menu :
    puts "--------------------->>>Que vas tu faire ?<<<-------------------------"
    puts "a - Chercher une meilleure arme en toute détente ?"
    puts "s - Chercher à se soigner comme un lache ?"
    puts "---->>>Ou prendre tes c****** à deux mains et Attaquer la bête<<<-----"
    puts "0 - #{player1.show_state}"
    puts "1 - #{player2.show_state}"
    answer = gets.chomp
    if answer == "a"
        puts "#{user.search_weapon}"
        
    elsif answer == "s"
        puts "#{user.search_health_pack}"
        
    elsif answer == "0"
        puts "#{user.attacks(player1)}"
        
    elsif answer == "1"
        puts "#{user.attacks(player2)}"
        
    end
    gets.chomp #pour mettre des points de pause dans le game histoire de voir ce qu'il se passe 
    break if user.life_points <= 0 
    puts "------------------>>>BELEK !  Ils t'attaquent !<<<--------------------"
    gets.chomp #pour mettre des points de pause dans le game histoire de voir ce qu'il se passe     
    enemies.each do |player| 
        if player.life_points > 0 
        puts "#{player.attacks(user)}"
        end
    gets.chomp #pour mettre des points de pause dans le game histoire de voir ce qu'il se passe 
    break if user.life_points <= 0 
    end

end

puts "La partie est finie"

if user.life_points > 0
    puts "---------->Bravo ! Je n'ai pas douté de toi une seul seconde <--------" 
else
    puts "---------->Loser ! Tu as basculé du coté obscur de la force !<--------" 
end

#binding.pry