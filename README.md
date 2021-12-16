<p align="center">
    # 🛶 🧨 ⛵️ 🔫 🚤 B A T T L E  S H I P 🛳 💣 ⛴ 🚀 🚢
  <img src="https://user-images.githubusercontent.com/79817178/146279874-33ee9ff4-68c3-4163-924d-62549c26f1d4.gif" />
</p>

* * *

### A command line implementation of the classic board game
<br>
[Alicia Watt](https://github.com/AliciaWatt)
[Jakob Edelstein](https://github.com/jake-edel)

[Battleship Home @ Turing](https://backend.turing.edu/module1/projects/battleship/index)<br>
[Grading Rubric](https://backend.turing.edu/module1/projects/battleship/rubric)

* * *

# Installation
To install and play Battleship, either clone the repo or download the source files in a ZIP file. Then, execute `lib/battleship_runner.rb` with Ruby to begin playing.

# Rules
One running, type `q` and press `ENTER` to begin the game. You will first be asked to input the coordinate of your ships. Input in the format `a1 b1 c1`, using a letter and a number separated by spaces without any punctuation.<br><br>
Once you have placed all ships, the game will begin. You will see your board with ships visible (`S`) and the enemy board with ships obscured. Enter a coordinate to fire upon. The board will update to reflect your shot. A `M` is a miss, a `H` is a hit. A series of `X` means the ship has been sunk.<br><br>
The game will end when either player loses all of their ships. You will be able to play a new game or quit the program.

# Iteration 1
#### Classes
  - `Ship`: Has name, length, health. Can be hit and lose health, and be sunk
  - `Cell`: Has coordinate, starts empty and can contain a ship. Keeps track of whether it has been fired upon.
    - `Cell#render`: returns `.` `M` `H` or `X` depending on state of cell
# Iteration 2
#### Classes
  - `Board`: Contains an hash of Cell objects. Can place a ship across a series of consecutive cells. Can render its cells in a grid with labeled axis. Can validate placement through an interface with class CoordinateValidator
    
# class CoordinateValidator
  - Initialized with a hash of cells and an array of coordinates. Can validate whether an inputted coordinate is a valid coordinate, whether the corresponding cell contains a ship, and whether or not an array of coordinates is a legal placement for a ship.
    - `#ship_fits?`: is ship the same size as given coordinates?
    - `#coordinates_empty?`: are there any other ships present at that location?
    - `#coordinates_valid?`: do these coordinates exist on the grid?
    - `#horizontally/veritacally_consecutive?`: are these coordinates vertically and/or horizontally consecutive?
    - `#numbers/letters_consecutive?`: Are all the numbers/letters in the coordinate array consecutive?
    - `#same_column/row?`: Are all coordinates alligned vertically/horizontally?
    - `#coordinates_diagonal?`: Are the coordinates located diagonally to each other?
    - `#horizontally/vertically adjacent?`: are the cells directly above/below/next to each other?

# Iteration 3
- Creation of a functional UI/game loop, which allows a user to start a new game, enter coordinates to place ships, render the player and enemy boards, and enter coordinates to exchange fire with the computer. The game will end when either the player or computer has had all of their ships sunken.
#### Classes
  - `Player`: generic player class, contains a board and an array of ships. Can add ships to the array, fire upon another player, and be killed when all their ships have sunken.
      - `HumanPlayer`: Sub-class of player, interface for a human player. Prompts and validates user input.
      - `ComputerPlayer`: Sub-class of player, contains methods for automatically playing the game. Will randomly place ships at beginning of game and randomly fire upon a unique coordinate during its turn.
  - `Game`: main loop to start game, make calls to player and computer class, render boards and feedback and end game
