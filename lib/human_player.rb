require './lib/player'

class HumanPlayer < Player
  def starting_input
    option = ''
    until option.match?(/[p,q]/i) && option.length == 1
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
      coordinates = valid_input(ship)
      coordinates.each do |coordinate|
        @board.cells[coordinate].place_ship(ship)
      end
      puts @board.render(true)
    end
  end

  def valid_input(ship)
    coordinates = gets.chomp.upcase.split(' ')
    until @board.valid_placement?(ship, coordinates) do
      puts 'Invalid Coordinates! Please enter a valid coordinate ex. a1 a2 a3'
      coordinates = gets.chomp.upcase.split(' ')
    end
    coordinates
  end

  def fire_input
  end
end

human = HumanPlayer.new
require 'pry-byebug'; binding.pry
puts
