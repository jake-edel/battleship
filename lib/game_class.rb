require './lib/computer_player'
require './lib/human_player'

class Game
    def initialize
    @player = HumanPlayer.new
    @computer = ComputerPlayer.new
    end

    def start
      print_start_message
      start_input
      place_ships
      firing_loop
      print_end_game
    end

    def print_start_message
      system('clear')
      puts "Welcome to BATTLESHIP, Enter p to play. Enter q to quit"
    end

    def start_input
      quit if @player.starting_input.downcase == 'q'
      system('clear')
    end

    def quit
      system('clear')
      puts "Quitters never win! Smell ya later."
      sleep(1)
      system('clear')
      exit
    end

    def place_ships
      # @computer.place_ships
      @player.place_ships
    end

    def firing_loop
    until @player.ships.empty? || @computer.ships.empty? do
    #   print_boards
      @player.fire_input(@computer)
    #   @computer.fire_random
    #   print_feedback
    end
  end


  def print_boards
  end

  def print_feedback
  end

  def print_end_game
  end
end
