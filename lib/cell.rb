class Cell
  attr_reader :coordinate, :ship

  def initialize(coordinate)
    @coordinate = coordinate
    @fired_upon = false
    @ship = nil
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
    @ship&.hit unless @fired_upon
    @fired_upon = true
    self
  end

  def render(show = false)
    return 'S' if show && (@ship && !@fired_upon)

    return '.' unless @fired_upon

    if @ship
      @ship.sunk? ? (return 'X') : (return 'H')
    end

    'M'
  end
end
