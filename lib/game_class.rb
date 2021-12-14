require './lib/computer_player'
require './lib/human_player'

class Game
    def initialize
    @player = HumanPlayer.new
    @computer = ComputerPlayer.new
    end

  def start
    print_start_message
    @player.starting_input #setup board
    @player.place_ships #setup board
    @computer.place_ships
    unitl @player.ships.empty? || @computer.ships.empty? do
      print_boards
      @player.fire_input
      @computer.fire_random
      print_feedback
    end
    print_end_game
  end

  def print_start_message
    puts "Welcome to BATTLESHIP"
    puts "Enter p to play. Enter q to quit"

    if starting_input == "q"
    puts "Play again soon."
    elseif starting_input  == "p"
    puts "Let's play Battleship!"
    else
    puts "Please enter a p to play or a q to quit."
    end
  end


  def print_boards
    
  end

  def print_feedback
  end

  def print_end_game
  end
end
