
class CoordinateValidator
  def initialize(cells, coordinate_array)
    @cells = cells
    @coordinate_array = coordinate_array
    @numbers = @coordinate_array.map { |coordinate| coordinate[-1].to_i }
    @letters =@coordinate_array.map(&:chr)
  end

  def valid_coordinate?(coordinate)
    return false unless /[a-d][1-4]/i.match?(coordinate) && coordinate.length == 2
    return false if coordinate.fired_upon?
    
    true
  end

  def valid_placement?(ship)
    return false if ship_doesnt_fit(ship)
    return false unless coordinates_unoccupied?
    return false unless coordinates_valid?
    return false unless coordinates_consecutive?
    return false if coordinates_diagonal?

    true
  end

  def ship_doesnt_fit(ship)
    @coordinate_array.size != ship.length
  end

  def coordinates_unoccupied?
    @coordinate_array.all? { |coord| @cells[coord].empty? }
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
    @numbers.each_cons(2).all? { |x, y| y == x + 1 }
  end

  def letters_consecutive?
    @letters.each_cons(2).all? { |x, y| y.ord == x.ord + 1 }
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

  def coordinates_adjacent?
    return true if same_column? && vertically_adjacent?
    return true if same_row? && horizontally_adjacent?

    false
  end

  def horizontally_adjacent?
    @numbers.each_cons(2).all? { |x, y| y.ord == x.ord + 1 || y.ord == x.ord - 1 }
  end

  def vertically_adjacent?
    @letters.each_cons(2).all? { |x, y| y.ord == x.ord + 1 || y.ord == x.ord - 1 }
  end
end
