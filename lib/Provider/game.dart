import 'dart:math';

import 'package:expose_game/Provider/board_element.dart';
import 'package:flutter/material.dart';

class Game with ChangeNotifier {
  // TODO: implement the coloring to each tile.
  final Map<int, String> colors = {
    1: "red",
    2: "blue",
    3: "green",
    4: "yellow",
    5: "orange",
    6: "purple",
    7: "pink",
    8: "brown",
    9: "cyan"
  };
  final Map<String, String> contrastingColors = {
    "red": "white",
    "blue": "white",
    "green": "white",
    "yellow": "black",
    "orange": "black",
    "purple": "white",
    "pink": "black",
    "brown": "white",
    "cyan": "black"
  };

  static List<List<BoardElement>>? _board; // TODO: make it final
  static int? parity;
  static int pairCount = 0;
  static int chanceLeft =
      2; // TODO: later on chnage the number of available lives based on the difficulty level.
  // TODO: implement start, elapsed time and running time.

  int highScore = 0;
  int currScore = 0;

  Game(int n) {
    // Init the 2d array with some initial value and setting growable = false.
    _board = List<List>.generate(n,
            (i) => List<BoardElement>.generate(n, (index) => BoardElement(0), growable: false),
            growable: false)
        .cast<List<BoardElement>>();
    createBoard(n); // TODO: later on ... implement the difficulty of game.
  }

  static void createBoard(int n) {
    for (var i = 0; i < n; i++) {
      for (var j = 0; j < n; j++) {
        _board![i][j] = BoardElement(
            Random().nextInt(9) + 1); // Generate random number between 1 to 9
      }
    }
  }

  int checkStatus(int i, int j) {
    var value = getBoardValue(i, j);

    if (pairCount % 2 == 0) {
      parity = value % 2;
    } else {
      if (value % 2 != parity) {
        chanceLeft -= 1;
      }
      if (chanceLeft <= 0) {
        return -1; // Returns -1 to indicate that the game is now over.
      } else if (chanceLeft == 1) {
        return 0; // Returns 0 to indicate that only one life is left.
      }
    }
    pairCount += 1;
    currScore += 1;
    return 1; // Returns 1 to indicate the player can go on without any issues.
  }

  int getBoardValue(int i, int j) {
    return _board![i][j].tileNumber;
  }

  int get score {
    return currScore;
  }

  int get hiScore {
    return highScore;
  }

  int get getGrids {
    return _board!.length;
  }

  List<BoardElement> get getBoard {
    return _board!.expand((i) => i).toList();
  }
}
