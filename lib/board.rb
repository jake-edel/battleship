require './lib/cell'
require './lib/coordinate_validator'
require './lib/ship'

class Board
  attr_reader :cells

  def initialize(size)
    @cells = Hash.new { |hash,key| hash[key] = Cell.new("XX") }
    generate_cells(size)
  end

  def generate_cells(size)
    @letters = ('A'..'Z').to_a
    @numbers = (1..26).to_a

    size.times do |i|
      size.times do |j|
        coord = "#{@letters[i]}#{@numbers[j].to_s}"
        @cells[coord] = Cell.new(coord)
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
    @letters.each do |letter|
      grid += letter
      @numbers.to_a.each do |number|
        grid += " #{@cells["#{letter}#{number}"].render(show)}"
      end
      grid += "\n"
    end
    grid
  end
end
