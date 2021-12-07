require './lib/cell'

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
end
