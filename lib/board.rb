require './lib/cell'

class Board
  attr_reader :cells

  def initialize
    @cells = {
 "A1" => Cell.new("A1"), "A2" => Cell.new("A2"),  "A3" => Cell.new("A3"), "A4" => Cell.new("A4"),
 "B1" => Cell.new("B1"), "B2" => Cell.new("B2"), "B3" => Cell.new("B3"), "B4" => Cell.new("B4"),
 "C1" => Cell.new("C1"), "C2" => Cell.new("C2"), "C3" => Cell.new("C3"), "C4" => Cell.new("C4"),
 "D1" => Cell.new("D1"), "D2" => Cell.new("D2"), "D3" => Cell.new("D3"), "D4" => Cell.new("D4")
}
  end

  def valid_coordinate?(string)
    return false unless /[a-d]{1}[1-4]{1}/i.match?(string) && string.length == 2

    @cells[string.upcase].ship.nil?
  end

  def valid_placement(ship, coordinate_array)
    return false if ship_doesnt_fit(ship, coordinate_array)
    return false unless coordinates_valid?(coordinate_array)
    return false unless coordinates_consecutive?(coordinate_array)
    return false if coordinates_diagonal?(coordinate_array)
    return false if coordinates_occupied?(coordinate_array)

    true
  end

  def ship_doesnt_fit(ship, coordinate_array)
    coordinate_array.size != ship.length
  end

  def coordinates_valid?(coordinate_array)
    coordinate_array.all? { |coordinate| valid_coordinate?(coordinate) }
  end

  def coordinates_consecutive?(coordinate_array)
    return true if horizontally_consecutive?(coordinate_array)
    return true if vertically_consecutive?(coordinate_array)

    false
  end

  def horizontally_consecutive?(coordinate_array)
    numbers_consecutive?(coordinate_array) && same_row?(coordinate_array)
  end

  def numbers_consecutive?(coordinate_array)
    numbers = coordinate_array.map { |coordinate| coordinate[-1].to_i }.sort
    numbers.each_cons(2).all? { |x, y| y == x + 1 }
  end

  def vertically_consecutive?(coordinate_array)
    letters_consecutive?(coordinate_array) && same_column?(coordinate_array)
  end

  def letters_consecutive?(coordinate_array)
    letters = coordinate_array.map { |coordinate| coordinate.chr}.sort
    letters.each_cons(2).all? { |x, y| y.ord == x.ord + 1 }
  end

  def same_row?(coordinate_array)
    coordinate_array.all? { |coordinate| coordinate_array.first.chr.match?(coordinate.chr) }
  end

  def coordinates_diagonal?(coordinate_array)

  end

  def coordinates_occupied?(coordinate_array)
  end
end

# Valid Coords
a = %w[a1 a2 a3 a4]
b = %w[d4 d3 d2 d1]
c = %w[a1 b1 c1 d1]
d = %w[a2 b2 c2 d2]
e = %w[d4 c4 b4 a4]

# Invalid Coords
f = %w[d4 c4 b4 a1]
g = %w[a1 b2 c3 d4]
h = %w[d4 c4 b4 a1]
i = %w[a3 b3 c3 d4]

board = Board.new
puts
