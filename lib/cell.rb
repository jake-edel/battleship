class Cell
  attr_reader :coordinate

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = false
    @fired_upon = false
  end

  def ship
    return nil unless @ship

    @ship
  end

  def empty?
    @ship
  end

  def place_ship(ship)
    @ship = ship
  end

  def fire_upon
end
