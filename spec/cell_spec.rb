require './lib/cell'

RSpec.describe Cell do
  before(:each) do
   @cell = Cell.new
  end

  it 'exists' do
    expect(@cell).to be_instance_of Cell
  end
end
