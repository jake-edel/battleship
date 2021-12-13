require './lib/computer_player'
require './lib/human_player'

class Game
    def initialize
    @player = HumanPlayer.new
    @computer = ComputerPlayer.new
    end

  def start
    print_start_message
    @player.starting_input
    @player.place_ship
    @computer.place_ship
    unitl @player.ships.empty? || @computer.ships.empty? do
      print_boards
      @player.fire_input
      @computer.fire_random
      print_feedback
    end
    print_end_game
  end
  
  def print_start_message
  end

  def print_boards
  end

  def print_feedback
  end

  def print_end_game
  end
end
