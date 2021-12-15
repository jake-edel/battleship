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
      start
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
      @computer.place_ships
      @player.place_ships
    end

    def firing_loop
      until @player.dead? || @computer.dead? do
        system('clear')
        print_boards
        player_shot = @player.fire_input(@computer)
        comp_shot = @computer.fire_random(@player)
        print_feedback(player_shot, comp_shot)
        gets
      end
    end


  def print_boards
    puts '=============COMPUTER BOARD============='
    puts @computer.board.render
    puts '=============PLAYER BOARD============='
    puts @player.board.render(true)
  end

  def print_feedback(player_shot, comp_shot)
    puts "Your shot on #{player_shot.coordinate} was a #{player_shot.empty? ? 'miss' : 'hit' }"

    puts "The enemy shot on #{comp_shot.coordinate} was a #{comp_shot.empty? ? 'miss' : 'hit' }"

    unless player_shot.ship.nil?
      puts "You sunk the enemies #{player_shot.ship.name}" if player_shot.ship.sunk?
    end

    unless comp_shot.ship.nil?
      puts "The enemy sunk your #{comp_shot.ship.name}" if comp_shot.ship.sunk?
    end
  end

  def print_end_game
    if @computer.board.cells.values.count {|cell| cell.ship.class == Ship && cell.ship.sunk? == false } == 0
      winner = 'You'
    print_end_game = "#{winner} wins!"
  elsif @player.board.cells.values.count {|cell| cell.ship.class == Ship && cell.ship.sunk? == false } == 0
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
