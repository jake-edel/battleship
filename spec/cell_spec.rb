require './lib/cell'
require './lib/ship'

RSpec.describe Cell do
  before(:each) do
   @cell = Cell.new('A0')
  end

  it 'exists' do
    expect(@cell).to be_instance_of Cell
  end

  it 'can return a coordinate' do
      expect(@cell.coordinate).to eq('A0')
  end

  describe '#ship' do
    it 'returns nil when no ship is present' do
      expect(@cell.ship).to be_nil
    end

    it '#empty? returns true when no ship is present' do
      expect(@cell.empty?).to be true
    end
  end

  describe '#place_ship' do
    before(:each) do
      @ship = Ship.new('Cruiser', 3)
      @cell.place_ship(@ship)
    end

    it 'places ship on itself' do
      expect(@cell.ship).to be @ship
    end

    it '#empty? returns false when ship is present' do
      expect(@cell.empty?).to be false
    end

    describe 'fired_upon?' do
      before(:each)
      end
      it 'is false by default' do
        expect(@cell.fired_upon?).to be false
      end

      it 'becomes true when a cell has been fired upon' do
        @cell.fire_upon
      end
    end
  end
