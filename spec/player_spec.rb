require './lib/player'

RSpec.describe Player do
  context 'Iteration 3' do
    let(:player) { Player.new }

    describe '#initialize' do
      it 'is an instance of Player' do
        expect(player).to be_instance_of Player
      end
    end
  end
end
