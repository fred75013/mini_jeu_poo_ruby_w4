require 'pry'
require_relative 'player.rb'

class Game
    attr_accessor :human_player, :enemies

    def initialize (name)
        @human_player = HumanPlayer.new(name)
        @enemies = []
        4.times do |i|
        @enemies << Player.new("player#{i+=1}")
        end
    end

    def kill_player (player)
        @enemies.delete_if {|player| player.life_points <= 0 } 
    end

    def is_still_ongoing?
        if @human_player.life_points > 0 && 
    end
        

end

binding.pry