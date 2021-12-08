class Cell
  attr_reader :coordinate

  def initialize(coordinate)
    @coordinate = coordinate
    @fired_upon = false
  end

  def ship
    @ship
  end

  def empty?
    @ship.nil?
  end

  def place_ship(ship)
    @ship = ship
  end

  def fired_upon?
    @fired_upon
  end

  def fire_upon
    @fired_upon = true
    @ship.health -= 1
  end

  def render
    return '.' unless @fired_upon

    if @ship
      @ship.sunk? ? ( return 'X' ) : (return 'H')
    end

    'M'
  end
end
