import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:tic_tac_toe/constants.dart';

class FinalGamePad extends StatefulWidget {
  const FinalGamePad({Key? key}) : super(key: key);

  @override
  _FinalGamePadState createState() => _FinalGamePadState();
}

class _FinalGamePadState extends State<FinalGamePad> {
  // Game pad which stores the X and O
  var gamePad = [
    ['.', '.', '.'],
    ['.', '.', '.'],
    ['.', '.', '.']
  ];
  // for wins count
  int xWins = 0;
  int oWins = 0;
  // to know who is next
  bool isXturn = false;
  // It's to check how many steps completed
  int gameSteps = 0;
  // To get the result
  String whoWonTheMatch = '';

  // Updates the gamePad when user clicks on particular button
  updateGamePad(int i, int j) {
    // Checking whether the button is already clicked or not
    // and also whose turn is this
    if (isXturn && gamePad[i][j] == '.') {
      gamePad[i][j] = 'X';
      isXturn = false;
      gameSteps++;
    } else if (!isXturn && gamePad[i][j] == '.') {
      gamePad[i][j] = 'O';
      isXturn = true;
      gameSteps++;
    }
    // If game steps is >= 5 means user enters the 3 characters
    // So we need to check whether he won or not
    if (gameSteps >= 5) {
      whoWins();
    }
  }

  // Whole logic to find whether who wins or a draw or the
  // game not yet done will be here
  whoWins() {
    // Calling the winOrDraw method to check who wins or draw
    String winsOrNot = winOrDraw();
    // If it's X then we need to increment xWins
    // and need to clear all the data except the wins
    if (winsOrNot == 'X') {
      xWins++;
      whoWonTheMatch = 'X \n won the last match';
      gamePad = [
        ['.', '.', '.'],
        ['.', '.', '.'],
        ['.', '.', '.']
      ];
      gameSteps = 0;
    }
    // Same here aswell checking the win status
    // and resetting the data
    else if (winsOrNot == 'O') {
      oWins++;
      whoWonTheMatch = 'O \n won the last match';
      gamePad = [
        ['.', '.', '.'],
        ['.', '.', '.'],
        ['.', '.', '.']
      ];
      gameSteps = 0;
    }
    // Checking the Draw situation
    // We only have nine steps so it's checking for it
    else if (gameSteps == 9 && winsOrNot == '') {
      gamePad = [
        ['.', '.', '.'],
        ['.', '.', '.'],
        ['.', '.', '.']
      ];
      gameSteps = 0;
      whoWonTheMatch = 'Last match is a \n Draw';
    }
  }

  // Logic to check the win/lose/Draw
  String winOrDraw() {
    // Checking Diagonally from left to right for X win
    if (gamePad[0][0] == gamePad[1][1] &&
        gamePad[1][1] == gamePad[2][2] &&
        gamePad[2][2] == 'X') {
      return 'X';
    }
    //  Checking Diagonally from left to right for O win
    else if (gamePad[0][0] == gamePad[1][1] &&
        gamePad[1][1] == gamePad[2][2] &&
        gamePad[2][2] == 'O') {
      return 'O';
    }
    // Checking Diagonally from right to left for X win
    else if (gamePad[0][2] == gamePad[1][1] &&
        gamePad[1][1] == gamePad[2][0] &&
        gamePad[2][0] == 'X') {
      return 'X';
    }
    // Checking Diagonally from right to left for X win
    else if (gamePad[0][2] == gamePad[1][1] &&
        gamePad[1][1] == gamePad[2][0] &&
        gamePad[2][0] == 'O') {
      return 'O';
    }
    // Checking horizontal and vertical scenarios
    else {
      int j = 0;
      // looping 3 times because we have only 3x3 grid
      for (int i = 0; i < 3; i++) {
        // Checking ith horizontal row for X win
        if (gamePad[i][j] == gamePad[i][j + 1] &&
            gamePad[i][j + 1] == gamePad[i][j + 2] &&
            gamePad[i][j + 2] == 'X') {
          return 'X';
        }
        // Checking ith horizontal row for O win
        else if (gamePad[i][j] == gamePad[i][j + 1] &&
            gamePad[i][j + 1] == gamePad[i][j + 2] &&
            gamePad[i][j + 2] == 'O') {
          return 'O';
        }
        // Checking ith vertical column for X win
        else if (gamePad[j][i] == gamePad[j + 1][i] &&
            gamePad[j + 1][i] == gamePad[j + 2][i] &&
            gamePad[j + 2][i] == 'X') {
          return 'X';
        }
        // Checking ith vertical column for O win
        else if (gamePad[j][i] == gamePad[j + 1][i] &&
            gamePad[j + 1][i] == gamePad[j + 2][i] &&
            gamePad[j + 2][i] == 'O') {
          return 'O';
        }
      }
    }
    // If it's a draw
    return '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Here we are using Neumorphic styles
      backgroundColor: NeumorphicTheme.baseColor(context),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // For title and the score board
          Column(
            children: [
              // Title
              NeumorphicText(
                'TIC TAC TOE',
                textStyle: NeumorphicTextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
                style: const NeumorphicStyle(
                  color: Colors.black,
                  shadowDarkColor: Colors.grey,
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              // Score board for both X and O
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  NeumorphicText(
                    'X wins: $xWins',
                    textStyle: NeumorphicTextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                    style: const NeumorphicStyle(
                      color: Colors.black,
                      shadowDarkColor: Colors.grey,
                    ),
                  ),
                  NeumorphicText(
                    'O wins: $oWins',
                    textStyle: NeumorphicTextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                    style: const NeumorphicStyle(
                      color: Colors.black,
                      shadowDarkColor: Colors.grey,
                    ),
                  ),
                ],
              )
            ],
          ),
          // Giving some space
          const SizedBox(
            height: 30.0,
          ),
          // Creating 3 rows with 3 columns
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              NeumorphicButton(
                margin: padAndMargin,
                // using setState method we can get updated values
                // into the board
                onPressed: () {
                  setState(() {
                    // Calling the function to update the click
                    updateGamePad(0, 0);
                  });
                },
                child: Text(
                  // Assigning the gamePad value
                  gamePad[0][0],
                  style: textStyle,
                ),
              ),
              NeumorphicButton(
                margin: padAndMargin,
                onPressed: () {
                  setState(() {
                    updateGamePad(0, 1);
                  });
                },
                child: Text(
                  gamePad[0][1],
                  style: textStyle,
                ),
              ),
              NeumorphicButton(
                margin: padAndMargin,
                onPressed: () {
                  setState(() {
                    updateGamePad(0, 2);
                  });
                },
                child: Text(
                  gamePad[0][2],
                  style: textStyle,
                ),
              ),
            ],
          ),
          // Second row containing 3 buttons
          // with the same styling and logic
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              NeumorphicButton(
                margin: padAndMargin,
                onPressed: () {
                  setState(() {
                    updateGamePad(1, 0);
                  });
                },
                child: Text(
                  gamePad[1][0],
                  style: textStyle,
                ),
              ),
              NeumorphicButton(
                margin: padAndMargin,
                onPressed: () {
                  setState(() {
                    updateGamePad(1, 1);
                  });
                },
                child: Text(
                  gamePad[1][1],
                  style: textStyle,
                ),
              ),
              NeumorphicButton(
                margin: padAndMargin,
                onPressed: () {
                  setState(() {
                    updateGamePad(1, 2);
                  });
                },
                child: Text(
                  gamePad[1][2],
                  style: textStyle,
                ),
              ),
            ],
          ),
          // Third row also containing the same styling
          // and buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              NeumorphicButton(
                margin: padAndMargin,
                onPressed: () {
                  setState(() {
                    updateGamePad(2, 0);
                  });
                },
                child: Text(
                  gamePad[2][0],
                  style: textStyle,
                ),
              ),
              NeumorphicButton(
                margin: padAndMargin,
                onPressed: () {
                  setState(() {
                    updateGamePad(2, 1);
                  });
                },
                child: Text(
                  gamePad[2][1],
                  style: textStyle,
                ),
              ),
              NeumorphicButton(
                margin: padAndMargin,
                onPressed: () {
                  setState(() {
                    updateGamePad(2, 2);
                  });
                },
                child: Text(
                  gamePad[2][2],
                  style: textStyle,
                ),
              ),
            ],
          ),
          // Giving some space
          const SizedBox(
            height: 30.0,
          ),
          // To print the previous game result
          // Creating a container
          Container(
            alignment: Alignment.center,
            // Checking whether atleast one match is completed or not
            // If not it will not show anything
            // If yes then it will show the result
            child: whoWonTheMatch == ''
                ? const Text('')
                : NeumorphicButton(
                    margin: padAndMargin,
                    onPressed: () {},
                    child: Text(
                      whoWonTheMatch,
                      textAlign: TextAlign.center,
                      style: textStyle,
                    ),
                  ),
          )
        ],
      ),
    );
  }
}
