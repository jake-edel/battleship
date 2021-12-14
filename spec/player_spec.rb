require './lib/player'

RSpec.describe Player do
  context 'Iteration 3' do
    let(:player) { Player.new }

    describe '#initialize' do
      it 'is an instance of Player' do
        expect(player).to be_instance_of Player
      end
    end

    it 'is initialized with an empty board' do
      expect(player.board).to be_instance_of Board
      expect(player.board.cells).to be_instance_of Hash
      player.board.cells.each do |_coordinate, cell|
        expect(cell).to be_instance_of Cell
        expect(cell.empty?).to be true
      end
    end

    it 'is initialized with an empty ships array' do
      expect(player.ships).to be_instance_of Array
      expect(player.ships).to be_empty
    end

    it 'can load a default set of ships' do
      player.default_ships
      expect(player.ships).to be_instance_of Array
      expect(player.ships.count).to be 2
      expect(player.ships.first).to be_instance_of Ship
      expect(player.ships.last).to be_instance_of Ship
    end
  end
end
