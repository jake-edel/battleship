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

  def valid_coordinate?(coordinate)
    return false unless /[a-d][1-4]/i.match?(coordinate) && coordinate.length == 2

    coordinate_occupied?(coordinate)
  end

  def coordinate_occupied?(coordinate)
    @cells[coordinate.upcase].empty?
  end

  def valid_placement(ship, coordinate_array)
    return false if ship_doesnt_fit(ship, coordinate_array)
    return false unless coordinates_valid?(coordinate_array)
    return false unless coordinates_consecutive?(coordinate_array)
    return false if coordinates_diagonal?(coordinate_array)

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
    # puts
    # p coordinate_array
    # p "Are the numbers consecutive? #{numbers_consecutive?(coordinate_array)}"
    # p "Are the coordinates in the same row?#{same_row?(coordinate_array)}/n"
    numbers_consecutive?(coordinate_array) && same_row?(coordinate_array)
  end

  def vertically_consecutive?(coordinate_array)
    # p coordinate_array
    # p "Are the letters consecutive? #{letters_consecutive?(coordinate_array)}"
    # p "Are the coordinates in the same column? #{same_column?(coordinate_array)}"
    letters_consecutive?(coordinate_array) && same_column?(coordinate_array)
  end

  def numbers_consecutive?(coordinate_array)
    numbers = coordinate_array.map { |coordinate| coordinate[-1].to_i }.sort
    numbers.each_cons(2).all? { |x, y| y == x + 1 }
  end


  def letters_consecutive?(coordinate_array)
    letters = coordinate_array.map(&:chr).sort
    letters.each_cons(2).all? { |x, y| y.ord == x.ord + 1 }
  end

  def same_column?(coordinate_array)
    coordinate_array.all? { |coordinate| coordinate_array.first.end_with?(coordinate[-1]) }
  end

  def same_row?(coordinate_array)
    coordinate_array.all? { |coordinate| coordinate_array.first.chr.match?(coordinate.chr) }
  end

  def coordinates_diagonal?(coordinate_array)
    numbers_consecutive?(coordinate_array) && letters_consecutive?(coordinate_array)
  end
  
  def render
    "                                      1 2 3 4 \n " +
    "                                   A #{@cells["A1"].render} #{@cells["A2"].render} #{@cells["A3"].render} #{@cells["A4"].render} \n " +
    "                                   B #{@cells['B1'].render} #{@cells["B2"].render} #{@cells["B3"].render} #{@cells["B4"].render} \n " +
    "                                   C #{@cells["C1"].render} #{@cells["C2"].render} #{@cells["C3"].render} #{@cells["C4"].render} \n " +
    "                                   D #{@cells["D1"].render} #{@cells["D2"].render} #{@cells["D3"].render} #{@cells["D4"].render} \n "
  end
end

