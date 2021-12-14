require './lib/player'

class HumanPlayer < Player
  def starting_input
    option = gets.chomp
    system('clear')
    until option.match?(/[p,q]{1}/i) && option.length == 1
      puts "Welcome to BATTLESHIP, Enter p to play. Enter q to quit"
      option = gets.chomp
      system('clear')
    end
    option
  end

  def place_ships
    @ships.each do |ship|
      print_ships
      @board.render(true)
      puts "Enter the squares for the #{ship.name} (#{ship.length} spaces)"
      coordinates = valid_input(ship)
      coordinates.each do |coordinate|
        @board.cells[coordinate].place_ship(ship)
      end
      system('clear')
    end
  end

  def print_ships
    ship_list = 'The '
    ships.each do |ship|
      ship_list += ', the ' unless ship == ships.first || ship == ships.last
      ship_list += ' and the ' if ship == ships.last

      ship_list += "#{ship.name} is #{ship.length} units long"
    end
    ship_list += '.'
    puts ship_list
  end

  def valid_input(ship)
    coordinates = gets.chomp.upcase.split(' ')
    until @board.valid_placement?(ship, coordinates) do
      puts 'Invalid Coordinates! Please enter a valid coordinate ex. a1 a2 a3'
      coordinates = gets.chomp.upcase.split(' ')
    end
    coordinates
  end

  def fire_input(enemy)
    puts 'Enter the coordinate for your shot:'
    coordinate = gets.chomp.upcase
    p coordinate
    # require 'pry-byebug'; binding.pry
    until enemy.board.valid_coordinate?(coordinate) do
      puts 'Please enter a valid coordinate: '
      coordinate = gets.chomp.upcase
    end
    shoot(enemy, coordinate)
  end
end
