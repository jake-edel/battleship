require './lib/cell'
require './lib/coordinate_validator'
require './lib/ship'

class Board
  attr_reader :cells

  def initialize
    @cells = Hash.new { |hash,key| hash[key] = Cell.new("XX") }
    generate_cells
  end

  def generate_cells
    ("A".."D").to_a.each do |letter|
      (1..4).to_a.each do |number|
        @cells["#{letter}#{number}"] = Cell.new("#{letter}#{number}")
      end
    end
  end


  def valid_coordinate?(coordinate)
    CoordinateValidator.new(@cells).valid_coordinate?(coordinate)
  end

  def valid_placement?(ship, coordinate_array)
    CoordinateValidator.new(@cells, coordinate_array).valid_placement?(ship)
  end

  def place(ship, coordinate_array)
    if valid_placement?(ship, coordinate_array)
      coordinate_array.each { |coordinate| @cells[coordinate.upcase].place_ship(ship)}
    end
    valid_placement?(ship, coordinate_array)
  end

  def render(show = false)
    grid = "  1 2 3 4 \n"
    ('A'..'D').to_a.each do |letter|
      grid += letter
      (1..4).to_a.each do |number|
        grid += " #{@cells["#{letter}#{number}"].render(show)}"
      end
      grid += "\n"
    end
    grid
  end
end
