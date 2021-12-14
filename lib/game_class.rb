require './lib/computer_player'
require './lib/human_player'

class Game
    def initialize
    @player = HumanPlayer.new
    @computer = ComputerPlayer.new
    end

    def start
      # print_start_message
      # start_input
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
      until @player.dead? || @computer.dead? do
        print_boards
        @player.fire_input(@computer)
      #   @computer.fire_random
      #   print_feedback
        system('clear')
      end
    end


  def print_boards
    puts '=============COMPUTER BOARD============='
    puts @computer.board.render
    puts '=============PLAYER BOARD============='
    puts @player.board.render(true)
  end

  def print_feedback
  end

  def print_end_game
    if @computer.board.cells.values.count {|cell| cell.ship.class == Ship && cell.ship.sunk? == false } == 0
      winner = 'You'
    print_end_game = "#{winner} wins!"
    eslif @player.board.cells.values.count {|cell| cell.ship.class == Ship && cell.ship.sunk? == false } == 0
    winner = 'Computer'
    print_end_game = "#{winner} is the winner! Better luck next time. "
    end
  puts "\n\n...............GAME OVER...............\n"
  puts "\nComputer's final board:"
  puts @computer.board.render(true)
  puts "\nYour final board:"
  puts @player.board.render(true)
  puts print_end_game
  end
end
