require './lib/cell'
require './lib/ship'
require './lib/board'


RSpec.describe Board do
  before(:each) do
    @board = Board.new
  end

  describe 'valid_coordinate' do
    it 'returns true when given a valid coordinate' do
      expect(@board.valid_coordinate('A1'))
    end

    it 'returns false when given an invalid coordinate' do
    end
  end
end
