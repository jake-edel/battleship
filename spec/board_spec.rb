require './lib/cell'
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
end
