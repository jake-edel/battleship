
require './lib/board'
require './lib/cell'
require './lib/ship'

RSpec.describe Board do
  before(:each) do
    @board = Board.new
    @cruiser = Ship.new('Cruiser', 3)
  end

  describe '#cells' do
    it 'returns keys = coordinates value as cell objects' do
      # Took out copies of Cell test, iterate through whole hash now
      expect(@board.cells).to be_instance_of Hash
      @board.cells.each do |_coordinate, cell|
        expect(cell).to be_instance_of Cell
      end
    end
  end

  describe '#valid_coordinate' do
    it 'returns true when given a valid coordinate' do
      ('A'..'D').to_a.each do |letter|
        (1..4).to_a.each do |number|
          expect(@board.valid_coordinate?("#{letter}#{number}")).to be true
        end
      end
    end

    it 'is case insensitive' do
      ('a'..'d').to_a.each do |letter|
        (1..4).to_a.each do |number|
          expect(@board.valid_coordinate?("#{letter}#{number}")).to be true
        end
      end
    end

    it 'returns false when given an invalid coordinate' do
      expect(@board.valid_coordinate?('A22')).to be false
      expect(@board.valid_coordinate?('aa')).to be false
      expect(@board.valid_coordinate?('a11')).to be false
      expect(@board.valid_coordinate?('zz')).to be false
      expect(@board.valid_coordinate?('12')).to be false
      expect(@board.valid_coordinate?('ca')).to be false
      expect(@board.valid_coordinate?('e1')).to be false
      expect(@board.valid_coordinate?('dd')).to be false
    end
  end

  describe '#valid_placement' do
    before(:each) do
      @ship = Ship.new('Battleship', 4)

      # Valid Placements- Horizontal
      @valid_horizontals = [
        %w[a1 a2 a3 a4],
        %w[b1 b2 b3 b4],
        %w[c1 c2 c3 c4],
        %w[d1 d2 d3 d4]
      ]

      #  Valid Placements- Vertical
      @valid_verticals = [
        %w[a1 b1 c1 d1],
        %w[a2 b2 c2 d2],
        %w[a3 b3 c3 d3],
        %w[a4 b4 c4 d4]
      ]

      @too_small = [
        %w[A1],
        %w[A1 A2],
        %w[A2 A3 A4]
      ]

      @too_big = [
        %w[A1 A2 A3 A4 A4],
        %w[D1 D2 D3 D4 D4]
      ]

      @reversed = [
        %w[A4 A3 A2 A1],
        %w[B4 B3 B2 B1],
        %w[C4 C3 C2 C1],
        %w[D4 D3 D2 D1]
      ]

      @diagonals = [
        %w[a1 b2 c3 d4],
        %w[d1 c2 b3 a4],
        %w[a2 b3 d4],
        %w[d2 c3 b4],
      ]
    end

    it 'returns true if ship can be placed on coordinates provided' do
      @valid_horizontals.each do |placement|
        expect(@board.valid_placement?(@ship, placement)).to be true
      end
      @valid_verticals.each do |placement|
        expect(@board.valid_placement?(@ship, placement)).to be true
      end
    end
    it 'returns true for ships of different sizes' do
      ship = Ship.new('Submarine', 2)
      expect(@board.valid_placement?(ship, %w[A1 A2])).to be true

      ship = Ship.new('Cruiser', 3)
      expect(@board.valid_placement?(ship, %w[B1 C1 D1])).to be true
    end

    it 'returns false if space is too small/large' do
      @too_small.each do |placement|
        expect(@board.valid_placement?(@ship, placement)).to be false
      end

      @too_big.each do |placement|
        expect(@board.valid_placement?(@ship, placement)).to be false
      end
    end

    it 'returns false is spaces are non-consecutive' do
      @reversed.each do |placement|
        expect(@board.valid_placement?(@ship, placement)).to be false
      end
    end

    it 'returns false if spaces are diagonal' do
      @diagonals.each do |placement|
        expect(@board.valid_placement?(@ship, placement)).to be false
      end
    end

    describe '#place' do
      before(:each) do
        @board = Board.new
        @cruiser = Ship.new('Cruiser', 3)
      it 'places ship in correct cells if placment is valid' do
        @board.place(@cruiser,["A1","A2","A3"])
        expect(@board.cells["A1"].empty?).to eq(false)
        expect(@board.cells["A2"].empty?).to eq(false)
        expect(@board.cells["A3"].empty?).to eq(false)
      end
      it 'places correct ship' do
        @board.place(@cruiser, ['A1', 'A2', 'A3'])
        expect(board.cells["A1"].ship).to eq(@cruiser)
        end
      end
    end

   describe '#render' do
     it 'it returns a string' do
        expect(@board.render).to be_instance_of String
     end
     it 'returns a correct string' do
        expect(@board.render).to eq("  1 2 3 4 \nA . . . .\nB . . . .\nC . . . .\nD . . . .\n")
     end
     it 'prints a board with ship' do
       @board.place(@cruiser, ["A1", "A2", "A3"])
       expect(@board.render(true)).to eq( "  1 2 3 4 \nA S S S .\nB . . . .\nC . . . .\nD . . . .\n")
       expect(@board.render).to eq( "  1 2 3 4 \nA . . . .\nB . . . .\nC . . . .\nD . . . .\n")
     end
    end
  end
end
