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

    puts "\nYour Board:"
    puts @human.board.render(true)
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
