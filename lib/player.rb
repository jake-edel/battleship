require './lib/board'
require './lib/ship'

class Player
  attr_reader :board, :ships

  def initialize
    @board = Board.new
    @ships = []
    default_ships
  end

  def add_ship(name,length)
    @ships << Ship.new(name, length)
  end

  def default_ships
    add_ship("Cruiser", 3)
    add_ship("Submarine", 2)
  end

  def shoot(other, coordinate)
    other.board.cells[coordinate].fire_upon
  end

  def dead?
    @ships.empty?
  end
end
