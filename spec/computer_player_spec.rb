require './lib/computer_player'

RSpec.describe ComputerPlayer do
  before(:each) do
    @computer = ComputerPlayer.new
  end

  it 'exists' do
    expect(@computer).to be_instance_of ComputerPlayer
  end

  it 'can return an array of valid placements for a given ship' do
    ship = Ship.new("Battleship", 4)
    placement = @computer.find_placement(ship)
    expect(placement).to be_instance_of Array
    placement.each do |coordinate|
      expect(coordinate).to be_instance_of String
      expect(coordinate.length).to be 2
    end

    1000.times do
      placement = @computer.find_placement(ship)
      validator = CoordinateValidator.new(Board.new.cells, placement)
      expect(validator.valid_placement?(ship)).to be true
    end
  end
end
