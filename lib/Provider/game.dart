import 'dart:math';

import 'package:expose_game/Provider/board_element.dart';
import 'package:flutter/material.dart';

class Game with ChangeNotifier {
  final Map<int, MaterialColor> colors = {
    0: Colors.red,
    1: Colors.blue,
    2: Colors.green,
    3: Colors.yellow,
    4: Colors.orange,
    5: Colors.purple,
    6: Colors.pink,
    7: Colors.brown,
    8: Colors.cyan,
    9: Colors.indigo,
    10: Colors.lime,
    11: Colors.teal,
    12: Colors.amber,
    13: Colors.deepOrange,
    14: Colors.blueGrey,
    15: Colors.lightBlue,
  };

  static List<List<BoardElement>>? _board; // TODO: make it final
  static int? parity;
  static int pairCount = 0;
  static int chanceLeft =
      3; // TODO: later on chnage the number of available lives based on the difficulty level.
  // TODO: implement start, elapsed time and running time.

  int highScore = 0;
  int currScore = 0;

  Game(int n) {
    // Init the 2d array with some initial value and setting growable = false.
    _board = List<List>.generate(
            n,
            (i) => List<BoardElement>.generate(n, (index) => BoardElement(0),
                growable: false),
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

  int checkStatus(int i) {
    var value = getBoardElement(i).tileNumber;
    var justChanged = false;
    if (pairCount % 2 == 0) {
      parity = value % 2;
    } else {
      if (value % 2 != parity) {
        chanceLeft -= 1;
        justChanged = true;
        notifyListeners();
      }
      if (chanceLeft <= 0) {
        return -1; // Returns -1 to indicate that the game is now over.
      } else if (chanceLeft == 1) {
        if (!justChanged) {
          currScore += 1;
        }
        return 0; // Returns 0 to indicate that only one life is left.
      }
    }
    pairCount += 1;
    if (!justChanged) {
      currScore += 1;
    }
    // currScore += 1;
    notifyListeners();
    return 1; // Returns 1 to indicate the player can go on without any issues.
  }

  bool didWon() {
    if (currScore >= 8) {
      return true;
    }
    return false;
  }

  BoardElement getBoardElement(int i) {
    return (_board!.expand((i) => i).toList())[i];
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

  int get getLives {
    return chanceLeft;
  }

  void setHiScore(int h) {
    highScore = h;
    notifyListeners();
  }

  void restart() {
    //TODO: Also change these when implementing Difficultiy levels
    currScore = 0;
    createBoard(4);
    pairCount = 0;
    chanceLeft = 3;
    notifyListeners();
  }
}
