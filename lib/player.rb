require './lib/board'
require './lib/ship'

class Player
  attr_reader :board, :ships

  def initialize
    @board = Board.new
    @ships = []
  end

  def add_ship(name,length)
    @ships << Ship.new(name, length)
  end

  def default_ships
    add_ship("Cruiser", 3)
    add_ship("Submarine", 2)
  end
end
