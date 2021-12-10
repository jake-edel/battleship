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

    # "A #{@cells["A1"].render} #{@cells["A2"].render} #{@cells["A3"].render} #{@cells["A4"].render} \n " +
    # "B #{@cells['B1'].render} #{@cells["B2"].render} #{@cells["B3"].render} #{@cells["B4"].render} \n " +
    # "C #{@cells["C1"].render} #{@cells["C2"].render} #{@cells["C3"].render} #{@cells["C4"].render} \n " +
    # "D #{@cells["D1"].render} #{@cells["D2"].render} #{@cells["D3"].render} #{@cells["D4"].render}
board = Board.new
board.cells["A1"].place_ship(Ship.new("Battleship", 4))
board.cells["A1"].fire_upon
board.render
