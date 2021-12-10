require './lib/ship'
require './lib/board'


RSpec.describe Board do
  before(:each) do
    @board = Board.new
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
        # @board = Board.new
        # Valid Coords
        @a = %w[a1 a2 a3 a4]
        @b = %w[d4 d3 d2 d1]
        @c = %w[a1 b1 c1 d1]
        @d = %w[a2 b2 c2 d2]
        @e = %w[d4 c4 b4 a4]

        # Invalid Coords
        @f = %w[dx4 c4 b4 a1]
        @g = %w[a1 b2 e3 d4]
        @h = %w[d4 14 b4 a1]
        @i = %w[a3 b3 c3 aa4]
        @j = %w[d2 d3 d4 4a]
      end

      it 'returns true if array of coordinates are valid input and unoccupied' do
        expect(@board.coordinates_valid?(@a)).to be true
        expect(@board.coordinates_valid?(@b)).to be true
        expect(@board.coordinates_valid?(@c)).to be true
        expect(@board.coordinates_valid?(@d)).to be true
        expect(@board.coordinates_valid?(@e)).to be true
      end
      it 'returns true if array of coordinates are valid input and unoccupied' do
        expect(@board.coordinates_valid?(@f)).to be false
        expect(@board.coordinates_valid?(@g)).to be false
        expect(@board.coordinates_valid?(@h)).to be false
        expect(@board.coordinates_valid?(@i)).to be false
        expect(@board.coordinates_valid?(@j)).to be false
      end
    end
    it 'returns true if ship can be placed on coordinates provided' do
      expect(@board.valid_placement(Ship.new('Battleship', 4), %w[A1 A2 A3 A4])).to be true
    end
  end
end
