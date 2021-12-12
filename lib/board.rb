require './lib/cell'
require './lib/coordinate_validator'
require './lib/ship'

class Board
  attr_reader :cells

  def initialize
    @cells = {}
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
    CoordinateValidator.new(@cells, []).valid_coordinate?(coordinate)
  end

  def valid_placement?(ship, coordinate_array)
    CoordinateValidator.new(@cells, coordinate_array).valid_placement?(ship)
  end

  def render
    top_row  =  "  1 2 3 4 \n"
    # puts top_row
    ("A".."D").to_a.each do |letter|
      # print letter
      (1..4).to_a.each do |number|
        # print " #{@cells["#{letter}#{number}"].render}"
      end
      # puts
    end.join('')
  end
end

# board = Board.new
# board.cells["A1"].place_ship(Ship.new("Battleship", 4))
# board.cells["A1"].fire_upon
# board.render
