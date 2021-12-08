require './lib/ship'

RSpec.describe Ship do

  let(:cruiser) {Ship.new('Cruiser', 3)}

  describe 'initialize' do
    it 'exists' do
      cruiser = Ship.new('Cruiser', 3)
      expect(cruiser).to be_a(Ship)
    end

    it 'has a attributes' do
    expect(cruiser.name).to eq('Cruiser')
    expect(cruiser.length).to eq 3
  end

  it 'inital health' do
    cruiser.health == cruiser.length
    expect(cruiser.health).to eq(3)
  end

  it 'is not sunk initially' do
    expect(cruiser.sunk?).to eq(false)
  end

  it "can be sunk" do
  cruiser.length.times {cruiser.hit}
      expect(cruiser.sunk?).to eq(true)
    end

  it 'can be hit' do
    expect(cruiser).to respond_to :hit
  end
end
end
