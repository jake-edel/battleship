require './lib/board'
require './lib/ship'

class Player
  attr_reader :board
  def initialize
    @board = Board.new
    @ships = []
    default_ships
  end

  def add_ship(name,length)
    @ships << Ship.new(name, length)
  end
  def default_ships
    add_ship("cruiser", 3)
    add_ship("submarine", 2)
  end
end
