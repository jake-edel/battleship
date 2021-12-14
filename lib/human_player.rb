require './lib/player'

class HumanPlayer < Player
  def starting_input
    option = ''
    until option.match?(/[p,q]/i) && option.length == 1
      # system('clear')
      # puts "Welcome to BATTLESHIP,  Enter p to play. Enter q to quit."
      option = gets.chomp
    end
    system('clear')
    option
  end

  def place_ships
    puts list_ships
    input_coordinates
  end

  def list_ships
    ship_list = 'The '
    ships.each do |ship|
      ship_list += ', the ' unless ship == ships.first || ship == ships.last
      ship_list += ' and the ' if ship == ships.last

      ship_list += "#{ship.name} is #{ship.length} units long"
    end
    ship_list += '.'
    ship_list
  end

  def input_coordinates
    ships.each do |ship|
      puts "Enter the squares for the #{ship.name} (#{ship.length} spaces)"
      coordinates = valid_input
      coordinates.each { |coordinate| board.cells[coordinate].ship = ship }
      puts board.render(true)
    end
  end

  def valid_input
    coordinates = gets.chomp.split(' ')
    until @board.valid_placement?(coordinates) do
      puts 'Invalid Coordinates! Please enter a valid coordinate ex. a1 a2 a3'
      coordinates = gets.chomp.split(' ')
    end
    coordinates
  end

  def fire_input

  end
end
