# Connect Four
Module 1 | Dates: 2018.07.13 - 2018.07.18

### About
Connect Four is a five day solo project to build a command line interface version of the board game. In Connect Four, players take turns attempting to get lines of 4 of their pieces without being blocked by their opponents pieces. The game ends in a draw if the 7-column, 6-row grid is filled without either player connecting four. The game ends with a win if a player lines up 4 of his/her pieces horizontally or vertically.

Example board:
```
ABCDEFG
.......
.......
O......
X.O...O
XXOXX.X
XOXXOOX
```

![video of game play](./assets/connect_four_gif)

### Getting Started
##### (`$` denotes command line interface (CLI) commands)
First, clone this repository from Github via `$ git clone git@github.com:Autumn-Martin/connect_four.git`.

This project uses Ruby 2.5.1. Ruby was installed with [Homebrew](https://brew.sh/) via `$ brew install ruby`. [Rbenv](https://github.com/rbenv/rbenv) can be used to specify this Ruby version locally, with `$ rbenv install 2.5.1` to install this version, and `$ rbenv local 2.5.1` to set it locally.

To play the game, perform the following in the Cli:
`$ ruby ./lib/connect_four.rb`

##### Note: this game is set to run as player vs. computer, but can be changed to player vs. player by changing the arguments in `lib/connect_four.rb` to instantiate a player instead of AI.

### Testing
This project was tested with Minitest. `$ rake` or `$ rake test` will run these tests.

### Learning Goals / Areas of Focus
* Practice breaking a program into logical components
* Testing components in isolation and in combination
* Applying Enumerable techniques in a real context
* Practice implementing a useable REPL interface

### Iterations
#### Iteration 1 Printing the Board
 * player sees a welcome message & an empty board with empty spaces (periods) & column names (A-G)
 ```
 Welcome Autumn! Let's play Connect Four!

 ABCDEFG
.......
.......
.......
.......
.......
.......


Which slot would you like to select? Enter A,B,C,D,E,F, or G. >
```

#### Iteration 2 Playing the Game
 * player pieces will be X's
 * computer pieces will be O's
 * request user input to place an individual piece
  - ask user to enter A-G
  - update the board with location of piece
  - display the new board
 * computer takes a turn
  - puts a piece in one of the 7 columns at random
  - update the board with location
  - displays the new board
  * repeat

 ```
ABCDEFG
.......
.......
O......
X.O...O
XXOXX.X
XOXXOOX
```

 #### Iteration 3 Winning the game
 * add win and draw conditions to the game

 ```
 ABCDEFG
.......
.......
...O...
...X...
...O..O
..OXXXX

There's a winner!
Game Over!
```
