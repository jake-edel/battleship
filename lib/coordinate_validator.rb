
class CoordinateValidator
  def initialize(cells, coordinate_array)
    @cells = cells
    @coordinate_array = coordinate_array
  end

  def valid_coordinate?(coordinate)
    return false unless /[a-d][1-4]/i.match?(coordinate) && coordinate.length == 2

    coordinate_occupied?(coordinate)
  end

  def coordinate_occupied?(coordinate)
    @cells[coordinate.upcase].empty?
  end

  def valid_placement?(ship)
    return false if ship_doesnt_fit(ship)
    return false unless coordinates_valid?
    return false unless coordinates_consecutive?
    return false if coordinates_diagonal?

    true
  end

  def ship_doesnt_fit(ship)
    @coordinate_array.size != ship.length
  end

  def coordinates_valid?
    @coordinate_array.all? { |coordinate| valid_coordinate?(coordinate) }
  end

  def coordinates_consecutive?
    return true if horizontally_consecutive?
    return true if vertically_consecutive?

    false
  end

  def horizontally_consecutive?
    numbers_consecutive? && same_row?
  end

  def vertically_consecutive?
    letters_consecutive? && same_column?
  end

  def numbers_consecutive?
    numbers = @coordinate_array.map { |coordinate| coordinate[-1].to_i }.sort
    numbers.each_cons(2).all? { |x, y| y == x + 1 }
  end

  def letters_consecutive?
    letters = @coordinate_array.map(&:chr).sort
    letters.each_cons(2).all? { |x, y| y.ord == x.ord + 1 }
  end

  def same_column?
    @coordinate_array.all? { |coordinate| @coordinate_array.first.end_with?(coordinate[-1]) }
  end

  def same_row?
    @coordinate_array.all? { |coordinate| @coordinate_array.first.chr.match?(coordinate.chr) }
  end

  def coordinates_diagonal?
    numbers_consecutive? && letters_consecutive?
  end
end
