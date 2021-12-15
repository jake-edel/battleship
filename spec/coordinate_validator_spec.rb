# require './lib/coordinate_validator'
#
# # RSpec.describe CoordinateValidator do
#   # context "Iteration 2" do
#   #   let(:board) {Board.new}
#   #   let(:ship) {Ship.new('Battleship', 4)}
#
#     before(:each) do
#       # Valid Placements- Horizontal
#       @valid_horizontals = [
#         %w[a1 a2 a3 a4],
#         %w[b1 b2 b3 b4],
#         %w[c1 c2 c3 c4],
#         %w[d1 d2 d3 d4]
#       ]
#       #  Valid Placements- Vertical
#       @valid_verticals = [
#         %w[a1 b1 c1 d1],
#         %w[a2 b2 c2 d2],
#         %w[a3 b3 c3 d3],
#         %w[a4 b4 c4 d4]
#       ]
#       @invalids = [
#         %w[aa1 b1 c1 d1],
#         %w[a2 b c2 d2],
#         %w[a3 b3 e3 d3],
#         %w[a4 b4 c 4 d4]
#       ]
#       @invalid_coordinates = %w[aa1 1a 11 aa ab b11 b12 b e1 d12 d3 s1]
#
#       @occupied_board = Board.new
#       @occupied_board.place(@ship, %w[C1 C2 C3 C4])
#
#       @vertically_consectutive = [
#         %w[a1 b1 c1 d1 e1 f1 g1],
#         %w[a2 b2 c2 d2 e2 f2],
#         %w[a33 b33 c33 d33],
#         %w[a4 b4 c4 d4 e4]
#       ]
#
#       @horizontally_consectuive = [
#         %w[a1 a2 a3 a4 a5 a6 a7],
#         %w[b11 b12 b13 b14],
#         %w[c11 c12 c13 c14],
#         %w[d1 d2 d3 d4]
#       ]
#       @non_consectuive = [
#         %w[a1 a2 a3 a5 a6 a7],
#         %w[b11 b13 b14],
#         %w[c11 c12 c14],
#         %w[d1 d2 d3 d4 d6]
#       ]
#
#       @same_column = [
#         %w[a1 b1],
#         %w[a1 b1 c1 d1],
#         %w[a2 b2 c2 d2],
#         %w[c3 d3],
#         %w[f4 g4]
#       ]
#
#       @same_row = [
#         %w[a1 a2],
#         %w[a1 a2 a3 a4],
#         %w[a2 a3 a4],
#         %w[c3 c4],
#         %w[f11 f12 f13 f14]
#       ]
#
#       @diagonals = [
#         %w[a1 b2 c3 d4],
#         %w[d1 c2 b3 a4],
#         %w[a2 b3 d4],
#         %w[d2 c3 b4],
#       ]
#
#       @horiozontally_adjacent = [
#         %w[a1, a2],
#         %w[a2, a3],
#         %w[a3, a4],
#         %w[d1, d2],
#         %w[d4, d3],
#       ]
#
#       @vertically_adjacent = [
#         %w[a1 b1],
#         %w[c1 b1],
#         %w[d1 c1],
#         %w[b3 a3]
#       ]
#
#       @non_adjacent = [
#         %w[a1 a3],
#         %w[c3 a3],
#         %w[d4 d2 ],
#       ]
#     end
#
#      describe '#initialize' do
#        it 'is intialized with a hash full of cells and an array of coordinates' do
#          validator = CoordinateValidator.new(board.cells, @vertically_consecutive)
#          expect(validator).to be_instance_of CoordinateValidator
#        end
#      end
#
#      describe 'ship_doesnt_fit' do
#        before(:each) do
#          @ship =  Ship.new('Cruiser, 3')
#        end
#         context 'ship_doesnt_fit'
#
#           let(:big_array) {CoordinateValidator.new(board.cells, %w[a1 a2 a3 a4])}
#           let(:small_array) {CoordinateValidator.new(board.cells, %w[a1 a2])}
#           let(:correct_size) {CoordinateValidator.new(board.cells, %w[a2 a3 a4])}
#
#
#           it 'returns true if ship is the same size as the given array' do
#             expect(correct_size.ship_doesnt_fit).to be false
#           end
#
#           it 'returns false if ship is larger or smaller than given array'
#           expect(big_array.ship_doesnt_fit).to be true
#           expect(small_array.ship_doesnt_fit).to be true
#      end
#   end
# end
