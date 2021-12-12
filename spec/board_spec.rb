
require './lib/board'
require './lib/cell'
require './lib/ship'

RSpec.describe Board do
  before(:each) do
    @board = Board.new
  end

  describe '#cells' do
    it 'returns keys = coordinates value as cell objects' do
      # Took out copies of Cell test, iterate through whole hash now
      @board.cells.each do |coordinate, cell|
        expect(cell).to be_instance_of Cell
      end
    end

    describe 'valid_coordinate' do
      it 'returns true when given a valid coordinate' do
        ('A'..'D').to_a.each do |letter|
          (1..4).to_a.each do |number|
            expect(@board.valid_coordinate?("#{letter}#{number}")).to be true
          end
        end
      end
      it 'returns true when given a valid coordinate' do
        ('a'..'d').to_a.each do |letter|
          (1..4).to_a.each do |number|
            expect(@board.valid_coordinate?("#{letter}#{number}")).to be true
          end
        end
      end

      it 'returns false when given an invalid coordinate' do
        expect(@board.valid_coordinate?('a0')).to be false
        expect(@board.valid_coordinate?('aa')).to be false
        expect(@board.valid_coordinate?('a5')).to be false
        expect(@board.valid_coordinate?('zz')).to be false
        expect(@board.valid_coordinate?('12')).to be false
        expect(@board.valid_coordinate?('ca')).to be false
        expect(@board.valid_coordinate?('e1')).to be false
        expect(@board.valid_coordinate?('d5')).to be false
      end
    end

    describe 'valid_placement' do
      describe 'coordinates_valid' do
        before(:each) do
          @ship = Ship.new('Battleship', 4)

          # Valid Coords
          @a = %w[a1 a2 a3 a4]
          @b = %w[d4 d3 d2 d1]
          @c = %w[a1 b1 c1 d1]
          @d = %w[a2 b2 c2 d2]
          @e = %w[d4 c4 b4 a4]
          # Invalid Coords
          @f = %w[dd4 c4 b4 a1]
          @g = %w[a1 b2 ca3 d4]
          @h = %w[d4 a5 b4 a1]
          @i = %w[a3 b11 c3 d2]
          @j = %w[d2 d3 d4 a11]
          # Valid Placements- Horizontal
          @valid_horizontals = [ %w[a1 a2 a3 a4],
          %w[b1 b2 b3 b4],
          %w[c1 c2 c3 c4],
          %w[d1 d2 d3 d4]]
          # Valid Placements- Horizontal (Reversed)
           @valid_horizontals_rev= [%w[a4 a3 a2 a1],
          %w[b4 b3 b2 b1],
          %w[c4 c3 c2 c1],
          %w[d4 d3 d2 d1]]
          # Valid Placement- Horizontal (Shuffled)
           @valid_horizontals_shuf = [%w[a1 a2 a3 a4].shuffle,
          %w[b1 b2 b3 b4].shuffle,
          %w[c1 c2 c3 c4].shuffle,
          %w[d1 d2 d3 d4].shuffle]
          #  Valid Placements- Vertical
          @valid_vertical = [%w[a1 b1 c1 d1],
          %w[a2 b2 c2 d2],
          %w[a3 b3 c3 d3],
          %w[a4 b4 c4 d4]]
          #  Valid Placements- Vertical (Reversed)
          @valid_vertical_rev = [%w[d1 c1 b1 a1],
          %w[d2 c2 b2 a2],
          %w[d3 c3 b3 a3],
          %w[d4 c4 b4 a4]]
          #  Valid Placements- Vertical (Shuffled)
        @valid_vertical_shuf = [%w[a1 b1 c1 d1].shuffle,
          %w[a2 b2 c2 d2].shuffle,
          %w[a3 b3 c3 d3].shuffle,
          %w[a4 b4 c4 d4].shuffle]
          # Invalid Coords
          @invalid = [%w[dd4 c4 b4 a1],
          %w[a1 b2 ca3 d4],
          %w[d4 a5 b4 a1],
          %w[a3 b11 c3 d2],
          %w[d2 d3 d4 a11]]
        end

        it 'returns true if ship can be placed horzontally on coordinates provided' do
          @valid_horizontals.each do |placement|
            p placement
            expect(@board.valid_placement?(@ship, placement)).to be true
          end
        end

        it 'returns false if ship cannot be placed on coordinates provided' do
        end
      end

      it 'renders board' do
        expect(@board.render).to be_instance_of String
      end
    end
  end
end
