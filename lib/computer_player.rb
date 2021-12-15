require './lib/player'

class ComputerPlayer < Player
  def initialize
    super
    @possible_coordinates  = []
    possible_coordinates
  end

  def possible_coordinates
    @board.cells.each do |coord, _cell|
      @possible_coordinates << coord
    end
  end

  def place_ships
    @ships.each do |ship|
      @board.place(ship, find_placement(ship))
    end
    puts 'I have laid my ships on the grid.'
   puts "You now need to lay out your #{ships.count} ships."
  end

  def find_placement(ship)
    placement = random_coordinates(ship)
    until @board.valid_placement?(ship, placement)
      placement = random_coordinates(ship)
    end
    placement
  end

  def random_coordinates(ship)
    @board.cells.keys.sample(ship.length).sort
  end

  def fire_random(other)
    random_coord = @possible_coordinates.delete(@possible_coordinates.sample)
    shoot(other, random_coord)
  end
end
