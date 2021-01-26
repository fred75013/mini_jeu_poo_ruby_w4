#require 'pry'

class Player
    attr_accessor :name, :life_points

    def initialize (name)
        @name = name
        @life_points = 10
    end

#Etat d'une joueur:
    def show_state
        "#{@name} a #{@life_points} de vie"
    end

#Subir une attaque:
    def gets_damage (damage_received)
        @life_points -= damage_received
        if @life_points <= 0
            "Le joueur #{@name} a été tué !"
        end
    end

#Attaquer:
    def attacks(player)
        puts "Le joueur #{@name} attaque le joueur #{player.name}"
        damage_received = compute_damage
        puts "il lui inflige #{damage_received} de dommages"
        player.gets_damage(damage_received)
    end
#Dommages aléatoires:
    def compute_damage
        return rand(1..6)
    end

end

class HumanPlayer < Player

    attr_accessor :weapon_level

    def initialize (name)
        super(name)
        @life_points = 100
        @weapon_level = 1
    end

    def show_state
        "#{@name} a #{@life_points} de vie et une arme de niveau #{@weapon_level}"
    end

    def compute_damage
        rand(1..6) * @weapon_level
    end

    def search_weapon
        level = rand(1..6)
        if @weapon_level < level
            puts "Mais qu'est ce que KOUAAK ! Une arme de niveau #{level}"
            puts "Youhou ! elle est meilleure que ton arme actuelle : Prend la."
            @weapon_level = level
        else
            puts "What da f*** une arme de niveau #{level}"
            puts "Elle n'est pas mieux que ton arme actuelle... je t'avais dit d'attaqué ;D"
        end 
    end

    def search_health_pack
        health_pack = rand(1..6)
        if health_pack == 1
            puts "Tu n'as rien trouvé... tu rentres la queue entre les jambes "
        elsif health_pack >= 2 && health_pack <= 5   
            puts "TROP LA CHANCE, tu as trouvé un pack de +50 points de vie !"
            @life_points += 50
            if @life_points > 100
                puts "Tu es full life tu as #{@life_points = 100} points de vie"
            else
                puts "Tu as à présent #{@life_points} de points de vie"
            end
        elsif health_pack == 6
            puts "Waow, tu as trouvé un pack de +80 points de vie !"
            @life_points += 80
            if @life_points > 100
                puts "Tu es full life tu as #{@life_points = 100} points de vie"
            else
                puts "Tu as à présent #{@life_points} de points de vie"
            end
        end

    end
end

#binding.pry