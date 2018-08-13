NOTES:
 * game runs from command line via ./lib/connect_four.rb
 * player will be ask to to enter column names to place one of their pieces
 * computer vs. player until win / draw

 --iteration 1--
 * player sees a welcome message
 * player sees a welcome message & an empty board
    - board has empty spaces (periods) & column names (A-G)

--iteration 2--
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
