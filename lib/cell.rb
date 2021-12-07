class Cell
  attr_reader :coordinate

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = false
  end

  def ship
    return nil unless @ship

    @ship
  end

end
