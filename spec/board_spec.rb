
require './lib/board'
require './lib/cell'
require './lib/ship'

RSpec.describe Board do
  before(:each) do
    @board = Board.new
  end
  describe '#cells' do
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
  end

  describe 'valid_coordinate' do
    it 'returns true when given a valid coordinate' do
      expect(@board.valid_coordinate?('A1')).to be true
      expect(@board.valid_coordinate?('B1')).to be true
      expect(@board.valid_coordinate?('C1')).to be true
      expect(@board.valid_coordinate?('D1')).to be true
      expect(@board.valid_coordinate?('A4')).to be true
      expect(@board.valid_coordinate?('B4')).to be true
      expect(@board.valid_coordinate?('C4')).to be true
      expect(@board.valid_coordinate?('D4')).to be true
    end
    it 'is case insensitive' do
      expect(@board.valid_coordinate?('a1')).to be true
      expect(@board.valid_coordinate?('b1')).to be true
      expect(@board.valid_coordinate?('c1')).to be true
      expect(@board.valid_coordinate?('d1')).to be true
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
      end

      # it 'returns true if array of coordinates are valid input and unoccupied' do
      #   expect(@board.coordinates_valid?(@a)).to be true
      #   expect(@board.coordinates_valid?(@b)).to be true
      #   expect(@board.coordinates_valid?(@c)).to be true
      #   expect(@board.coordinates_valid?(@d)).to be true
      #   expect(@board.coordinates_valid?(@e)).to be true
      # end
      # it 'returns true if array of coordinates are valid input and unoccupied' do
      #   expect(@board.coordinates_valid?(@f)).to be false
      #   expect(@board.coordinates_valid?(@g)).to be false
      #   expect(@board.coordinates_valid?(@h)).to be false
      #   expect(@board.coordinates_valid?(@i)).to be false
      #   expect(@board.coordinates_valid?(@j)).to be false
      # end
      before(:each) do
        # Valid Placements- Horizontal
        valid_horizontals = [@a = %w[a1 a2 a3 a4],
        @b = %w[b1 b2 b3 b4],
        @c = %w[c1 c2 c3 c4],
        @d = %w[d1 d2 d3 d4]]

        # Valid Placements- Horizontal (Reversed)
        @aa = %w[a4 a3 a2 a1]
        @ab = %w[b4 b3 b2 b1]
        @ac = %w[c4 c3 c2 c1]
        @ad = %w[d4 d3 d2 d1]

        # Valid Placement- Horizontal (Shuffled)
        @aaa = %w[a1 a2 a3 a4].shuffle
        @aab = %w[b1 b2 b3 b4].shuffle
        @aac = %w[c1 c2 c3 c4].shuffle
        @aad = %w[d1 d2 d3 d4].shuffle

        #  Valid Placements- Vertical
        @e = %w[a1 b1 c1 d1]
        @f = %w[a2 b2 c2 d2]
        @g = %w[a3 b3 c3 d3]
        @h =%w[a4 b4 c4 d4]

        #  Valid Placements- Vertical (Reversed)
        @ee = %w[d1 c1 b1 a1]
        @ef = %w[d2 c2 b2 a2]
        @eg = %w[d3 c3 b3 a3]
        @eh = %w[d4 c4 b4 a4]

        #  Valid Placements- Vertical (Shuffled)
        @eee = %w[a1 b1 c1 d1]
        @eef = %w[a2 b2 c2 d2]
        @eeg = %w[a3 b3 c3 d3]
        @eeh =%w[a4 b4 c4 d4]

        # Invalid Coords
        @f = %w[dd4 c4 b4 a1]
        @g = %w[a1 b2 ca3 d4]
        @h = %w[d4 a5 b4 a1]
        @i = %w[a3 b11 c3 d2]
        @j = %w[d2 d3 d4 a11]
      end
      it 'returns true if ship can be placed on coordinates provided' do
        expect(@board.valid_placement?(@ship, @c)).to be true
      end
      it 'returns false if ship cannot be placed on coordinates provided' do
        expect(@board.valid_placement?(@ship, @f)).to be false
        expect(@board.valid_placement?(@ship, @g)).to be false
        expect(@board.valid_placement?(@ship, @h)).to be false
        expect(@board.valid_placement?(@ship, @i)).to be false
        expect(@board.valid_placement?(@ship, @j)).to be false
      end
    end

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
      "1 2 3 4 \n " +
    	"A . . . . \n " +
    	"B . . . . \n " +
    	"C . . . . \n " +
    	"D . . . . \n ")
      end
  end
end
