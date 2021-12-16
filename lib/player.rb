require './lib/board'
require './lib/ship'

class Player
  attr_reader :board, :ships

  def initialize(size)
    @board = Board.new(size)
    @ships = []
    default_ships
    @previous_shots = []
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
    @ships.delete_if(&:sunk?)
    @ships.empty?
  end

  def new_board(size)
    @board = Board.new(size)
  end
end
