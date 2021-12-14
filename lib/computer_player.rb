require './lib/player'

class ComputerPlayer < Player
  def initialize
    @possible_coordinates  = []
    possible_coordinates
  end

def possible_coordinates
end

  def place_ships
    @ships.each do |ship|
      # place ship
    end
  end

  def fire_random
  end
end
