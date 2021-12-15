require './lib/coordinate_validator'
require './lib/ship'
require './lib/board'

RSpec.describe CoordinateValidator do
  # before(:each) do
  #   @invalid_coordinates = %w[aa1 1a 11 aa ab b11 b12 b e1 d12 d3 s1]
  #
  #   @same_column = [
  #     %w[a1 b1],
  #     %w[a1 b1 c1 d1],
  #     %w[a2 b2 c2 d2],
  #     %w[c3 d3],
  #     %w[f4 g4]
  #   ]
  #
  #   @same_row = [
  #     %w[a1 a2],
  #     %w[a1 a2 a3 a4],
  #     %w[a2 a3 a4],
  #     %w[c3 c4],
  #     %w[f11 f12 f13 f14]
  #   ]
  #
  #   @diagonals = [
  #     %w[a1 b2 c3 d4],
  #     %w[d1 c2 b3 a4],
  #     %w[a2 b3 d4],
  #     %w[d2 c3 b4],
  #   ]
  #
  #   @horiozontally_adjacent = [
  #     %w[a1 a2],
  #     %w[a2 a3],
  #     %w[a3 a4],
  #     %w[d1 d2],
  #     %w[d4 d3],
  #   ]
  #
  #   @vertically_adjacent = [
  #     %w[a1 b1],
  #     %w[c1 b1],
  #     %w[d1 c1],
  #     %w[b3 a3]
  #   ]
  #
  #   @non_adjacent = [
  #     %w[a1 a3],
  #     %w[c3 a3],
  #     %w[d4 d2 ],
  #   ]
  # end
  describe '#initialize'
    before(:each) do
      @board = Board.new
    end

    it 'is intialized with a hash full of cells and an array of coordinates' do
      validator = CoordinateValidator.new(@board.cells, [])
      expect(validator).to be_instance_of CoordinateValidator
    end
  end

  describe '#ship_doesnt_fit' do
    before(:each) do
      @board = Board.new
      @ship = Ship.new('Cruiser', 3)
    end

    it 'returns true if ship is the same size as the given array' do
      validator = CoordinateValidator.new(@board.cells, %w[a1 a2 a3])
      expect(validator.ship_fits?(@ship)).to be true
    end

    it 'returns false if ship is larger or smaller than given array' do
      validator = CoordinateValidator.new(@board.cells, %w[a1 a2])
      expect(validator.ship_fits?(@ship)).to be false

      validator = CoordinateValidator.new(@board.cells, %w[a1 a2 a3 a4])
      expect(validator.ship_fits?(@ship)).to be false
    end
  end

  describe '#coordinates_empty?' do
    before(:each) do
      @board = Board.new
    end

    it 'returns true if a ship has not been placed on the coordinates' do
      validator = CoordinateValidator.new(@board.cells, %w[a1 a2 a3 a4])
      expect(validator.coordinates_empty?).to be true
      validator = CoordinateValidator.new(@board.cells, %w[a1 b1 c1 d1])
      expect(validator.coordinates_empty?).to be true
    end

    it 'returns false if a ship has been placed on the coordinates' do
      ship = Ship.new('Battleship', 4)
      @board.place(ship, %w[c1 c2 c3 c4])

      validator = CoordinateValidator.new(@board.cells, %w[a1 a2 a3 a4])
      expect(validator.coordinates_empty?).to be true
      validator = CoordinateValidator.new(@board.cells, %w[a1 b1 c1 d1])
      expect(validator.coordinates_empty?).to be false
    end
  end

  describe '#coordinates_valid?' do
    before(:each) do
      @board = Board.new

      @valid_horizontals = [
        %w[a1 a2 a3 a4],
        %w[b1 b2 b3 b4],
        %w[c1 c2 c3 c4],
        %w[d1 d2 d3 d4]
      ]
      @valid_verticals = [
        %w[a1 b1 c1 d1],
        %w[a2 b2 c2 d2],
        %w[a3 b3 c3 d3],
        %w[a4 b4 c4 d4]
      ]
      @invalids = [
        %w[aa1 b1 c1 d1],
        %w[a2 b c2 d2],
        %w[a3 b3 e3 d3],
        %w[a4 b4 c 4 d4]
      ]
    end

    it 'returns true if an array of coordinates are all valid' do
      @valid_verticals.each do |placement|
        validator = CoordinateValidator.new(@board.cells, placement)
        expect(validator.coordinates_valid?).to be true
      end

      @valid_horizontals.each do |placement|
        validator = CoordinateValidator.new(@board.cells, placement)
        expect(validator.coordinates_valid?).to be true
      end
    end

    it 'returns false if an array of coordinates contains a single invalid coordinate'do
      @invalids.each do |placement|
        validator = CoordinateValidator.new(@board.cells, placement)
        expect(validator.coordinates_valid?).to be false
      end
    end
  end

  describe '#coordinates_consecutive?' do
    before(:each) do
      @board = Board.new

      @vertically_consecutive = [
        %w[a1 b1 c1 d1 e1 f1 g1],
        %w[a2 b2 c2 d2 e2 f2],
        %w[a33 b33 c33 d33],
        %w[a4 b4 c4 d4 e4],
        %w[c1 d1]
      ]

      @horizontally_consecutive = [
        %w[a1 a2 a3 a4 a5 a6 a7],
        %w[b11 b12 b13 b14],
        %w[c11 c12 c13 c14],
        %w[d1 d2 d3 d4],
        %w[c3 c4]
      ]
      @non_consecutive = [
        %w[a1 a2 a3 a5 a6 a7],
        %w[b11 b13 b14],
        %w[c11 c12 c14],
        %w[d1 d2 d3 d4 d6]
      ]
    end

    it 'returns true if the array of coordinates are consecutive' do
      @horizontally_consecutive.each do |placement|
        validator = CoordinateValidator.new(@board.cells, placement)
        expect(validator.coordinates_consecutive?).to be true
      end

      @vertically_consecutive.each do |placement|
        validator = CoordinateValidator.new(@board.cells, placement)
        expect(validator.coordinates_consecutive?).to be true
      end
    end

    it 'returns false if the array of coordinates are non-consecuitve' do
      @non_consecutive.each do |placement|
        validator = CoordinateValidator.new(@board.cells, placement)
        expect(validator.coordinates_consecutive?).to be false
      end
    end

    describe '#numbers_consecutive?' do
      before(:each) do
        @vertically_consecutive = [
          %w[a1 b1 c1 d1 e1 f1 g1],
          %w[a2 b2 c2 d2 e2 f2],
          %w[a33 b33 c33 d33],
          %w[a4 b4 c4 d4 e4],
          %w[c1 d1]
        ]

        @horizontally_consecutive = [
          %w[a1 a2 a3 a4 a5 a6 a7],
          %w[b11 b12 b13 b14],
          %w[c11 c12 c13 c14],
          %w[d1 d2 d3 d4],
          %w[c3 c4]
        ]
        @non_consecutive = [
          %w[a1 a2 a3 a5 a6 a7],
          %w[b11 b13 b14],
          %w[c11 c12 c14],
          %w[d1 d2 d3 d4 d6]
        ]
      end

      it 'returns true if the numbers(second value) of coordinates are consecutive' do
        @horizontally_consecutive.each do |placement|
          validator = CoordinateValidator.new(@board.cells, placement)
          expect(validator.numbers_consecutive?).to be true
        end
      end

      it 'returns false if the numbers of coordinates are vertically consecuitve' do
        @vertically_consecutive.each do |placement|
          validator = CoordinateValidator.new(@board.cells, placement)
          expect(validator.numbers_consecutive?).to be false
        end
      end

      it 'returns false if the numbers of coordinates are non-consecuitve' do
        @non_consecutive.each do |placement|
          validator = CoordinateValidator.new(@board.cells, placement)
          expect(validator.numbers_consecutive?).to be false
        end
      end
    end
  end

  describe '#letters_consecutive?' do
    before(:each) do
      @board = Board.new

      @vertically_consecutive = [
        %w[a1 b1 c1 d1 e1 f1 g1],
        %w[a2 b2 c2 d2 e2 f2],
        %w[a33 b33 c33 d33],
        %w[a4 b4 c4 d4 e4],
        %w[c1 d1]
      ]

      @horizontally_consecutive = [
        %w[a1 a2 a3 a4 a5 a6 a7],
        %w[b11 b12 b13 b14],
        %w[c11 c12 c13 c14],
        %w[d1 d2 d3 d4],
        %w[c3 c4]
      ]
      @non_consecutive = [
        %w[a1 a2 a3 a5 a6 a7],
        %w[c2 c4],
        %w[a1 b1 d1],
        %w[d1 d2 d3 d4 d6]
      ]
    end

    it 'returns false if the letters(first value) of coordinates are consecutive' do
      @horizontally_consecutive.each do |placement|
        validator = CoordinateValidator.new(@board.cells, placement)
        expect(validator.letters_consecutive?).to be false
      end
    end

    it 'returns true if the numbers of coordinates are vertically consecuitve' do
      @vertically_consecutive.each do |placement|
        validator = CoordinateValidator.new(@board.cells, placement)
        expect(validator.letters_consecutive?).to be true
      end
    end

    it 'returns false if the numbers of coordinates are non-consecuitve' do
      @non_consecutive.each do |placement|
        validator = CoordinateValidator.new(@board.cells, placement)
        expect(validator.letters_consecutive?).to be false
      end
    end
  end

  describe 'same_column?' do
    before(:each) do
      @board = Board.new

      @vertically_consecutive = [
        %w[a1 b1 c1 d1 e1 f1 g1],
        %w[a2 b2 c2 d2 e2 f2],
        %w[a33 b33 c33 d33],
        %w[a4 b4 c4 d4 e4],
        %w[c1 d1]
      ]

      @horizontally_consecutive = [
        %w[a1 a2 a3 a4 a5 a6 a7],
        %w[b11 b12 b13 b14],
        %w[c11 c12 c13 c14],
        %w[d1 d2 d3 d4],
        %w[c3 c4]
      ]
      @vertically_non_consec = [
        %w[a1 b1 c1 e1 f1 g1],
        %w[a2 b2 d2 e2 f2],
        %w[a33 b33 d33],
        %w[a4 c4 d4 e4],
        %w[c1 d1]
      ]
    end
    it 'returns false if coordinates lie in different columns' do
      @horizontally_consecutive.each do |placement|
        validator = CoordinateValidator.new(@board.cells, placement)
        expect(validator.same_column?).to be false
      end
    end

    it 'returns true if coordinates lie in same columns' do
      @vertically_consecutive.each do |placement|
        validator = CoordinateValidator.new(@board.cells, placement)
        expect(validator.same_column?).to be true
      end
    end

    it 'returns true if coordinates are no- consecutive' do
      @vertically_non_consec.each do |placement|
        validator = CoordinateValidator.new(@board.cells, placement)
        expect(validator.same_column?).to be true
      end
    end
  end

  describe 'same_row?' do
    before(:each) do
      @board = Board.new

      @vertically_consecutive = [
        %w[a1 b1 c1 d1 e1 f1 g1],
        %w[a2 b2 c2 d2 e2 f2],
        %w[a33 b33 c33 d33],
        %w[a4 b4 c4 d4 e4],
        %w[c1 d1]
      ]

      @horizontally_consecutive = [
        %w[a1 a2 a3 a4 a5 a6 a7],
        %w[b11 b12 b13 b14],
        %w[c11 c12 c13 c14],
        %w[d1 d2 d3 d4],
        %w[c3 c4]
      ]
      @horizontally_non_consec = [
        %w[a1 a2 a4 a5 a6 a7],
        %w[b11 b13 b14],
        %w[c11 c12 c14],
        %w[d1 d2 d4],
        %w[c3 c5]
      ]
    end
    it 'returns false if coordinates lie in different rows' do
      @horizontally_consecutive.each do |placement|
        validator = CoordinateValidator.new(@board.cells, placement)
        expect(validator.same_row?).to be true
      end
    end

    it 'returns true if coordinates lie in same row' do
      @vertically_consecutive.each do |placement|
        validator = CoordinateValidator.new(@board.cells, placement)
        expect(validator.same_row?).to be false
      end
    end

    it 'returns true if coordinates are no- consecutive' do
      @horizontally_non_consec.each do |placement|
        validator = CoordinateValidator.new(@board.cells, placement)
        expect(validator.same_row?).to be true
      end
    end
  end

  describe 'coordinates_diagonal?' do
    before(:each) do
      @board = Board.new

      @diagonals = [
        %w[a1 b2 c3],
        %w[b1 c2 d3],
        %w[a1 b2]
      ]

      @non_diagonals = [
        %w[a1 a2 a3],
        %w[a3 b3 c3],
        %w[d1 d4]
      ]
    end

    it 'returns true if coordinates are located diagonally to each other' do
      @diagonals.each do |placement|
        validator = CoordinateValidator.new(@board.cells, placement)
        expect(validator.coordinates_diagonal?).to be true
      end
    end

    it 'returns false if coordinates are non-diagonal' do
      @non_diagonals.each do |placement|
        validator = CoordinateValidator.new(@board.cells, placement)
        expect(validator.coordinates_diagonal?).to be false
      end
    end
  end

  describe 'coordinates_adjacent?' do
    before(:each) do
      @board = Board.new

      @adjacent = [
        %w[b2 b3],
        %w[b2 c2],
        %w[a2 b2],
        %w[b1 b2],
      ]

      @non_adjacent = [
        %w[b1 b3],
        %w[a1 c3],
        %w[a1 a4],
        %w[d1 d4],
        %w[d2 d4],
      ]

      @vertically_adj = [
        %w[b2 c2],
        %w[a1 b1],
        %w[a4 b4],
        %w[c2 d2]
      ]

      @horizontally_adj = [
        %w[b2 b3],
        %w[b1 b2],
        %w[c1 c2],
      ]
    end

    it 'returns true if coordinates are next to each other above/below/sides' do
      @adjacent.each do |placement|
        validator = CoordinateValidator.new(@board.cells, placement)
        expect(validator.coordinates_adjacent?).to be true
      end
    end

    it 'returns false if coordinates are not immediately next to each other' do
      @non_adjacent.each do |placement|
        validator = CoordinateValidator.new(@board.cells, placement)
        expect(validator.coordinates_adjacent?).to be false
      end
    end

    it '#horizontally_adjacent? returns true for horizontally adjacent cells' do
      @horizontally_adj.each do |placement|
        validator = CoordinateValidator.new(@board.cells, placement)
        expect(validator.horizontally_adjacent?).to be true
      end
    end

    it '#vertically_adjacent? returns true for vertically adjacent cells?' do
      @vertically_adj.each do |placement|
        validator = CoordinateValidator.new(@board.cells, placement)
        expect(validator.vertically_adjacent?).to be true
      end
    end
  end
