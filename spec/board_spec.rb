require './lib/board'
require './lib/cell'
require './lib/ship'

RSpec.describe Board do
  it 'returns keys = coordinates value as cell objects' do
    board = Board.new
    expect(board.cells["A1"]).to be_a(Cell)
	  expect(board.cells["A2"]).to be_a(Cell)
	  expect(board.cells["A3"]).to be_a(Cell)
	  expect(board.cells["A4"]).to be_a(Cell)
	  expect(board.cells["B1"]).to be_a(Cell)
	  expect(board.cells["B2"]).to be_a(Cell)
	  expect(board.cells["B3"]).to be_a(Cell)
	  expect(board.cells["B4"]).to be_a(Cell)
	  expect(board.cells["C1"]).to be_a(Cell)
	  expect(board.cells["C2"]).to be_a(Cell)
	  expect(board.cells["C3"]).to be_a(Cell)
	  expect(board.cells["C4"]).to be_a(Cell)
	  expect(board.cells["D1"]).to be_a(Cell)
	  expect(board.cells["D2"]).to be_a(Cell)
	  expect(board.cells["D3"]).to be_a(Cell)
	  expect(board.cells["D4"]).to be_a(Cell)
	end


  # before :each do
  #   @board.place(@cruiser, ["A1", "A2", "A3"])
  #   @cell_1 = @board.cells["A1"]
  #   @cell_2 = @board.cells["A2"]
  #   @cell_3 = @board.cells["A3"]
  #
  # end

it 'renders board' do
  board = Board.new

  @cells = {
	"A1" => Cell.new("A1"),
	"A2" => Cell.new("A2"),
	"A3" => Cell.new("A3"),
	'A4' => Cell.new("A4"),
	"B1" => Cell.new("B1"),
	"B2" => Cell.new("B2"),
	"B3" => Cell.new("B3"),
	'B4' => Cell.new("B4"),
	"C1" => Cell.new("C1"),
	"C2" => Cell.new("C2"),
	"C3" => Cell.new("C3"),
	'C4' => Cell.new("C4"),
	"D1" => Cell.new("D1"),
	"D2" => Cell.new("D2"),
	"D3" => Cell.new("D3"),
	'D4' => Cell.new("D4")
	}

  expect(board.render).to eq(
  "                                     1 2 3 4 \n " +
	"                                   A . . . . \n " +
	"                                   B . . . . \n " +
	"                                   C . . . . \n " +
	"                                   D . . . . \n ")

end


# it 'shows hidden ships(true)' do
#   board = Board.new
#   expect(board.render(true)).to eq (
#   "                                     1 2 3 4 \n " +
# 	"                                   A S S S . \n " +
# 	"                                   B . . . . \n " +
# 	"                                   C . . . . \n " +
# 	"                                   D . . . . \n ")
# end

# it 'renders hits and misses(true)' do
# @cell_1.fire_upon
# @cell_3.fire_upon
# @cell_4 = @board.cells["A4"]
# @cell_4.fire_upon
#
#   expect(board.render.to(true)).to eq (
#   "                                      1 2 3 4 \n " +
# 	"                                   A  H S H M  \n " +
# 	"                                   B . . . . \n " +
# 	"                                   C . . . . \n " +
# 	"                                   D . . . . \n ")
# end

end
