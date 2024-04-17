import 'package:expose_game/Provider/game.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ClickTile extends StatelessWidget {
  late final index;
  final VoidCallback updateParentWidget;
  ClickTile(this.index, this.updateParentWidget, {super.key});

  @override
  Widget build(BuildContext context) {
    var gamedata = Provider.of<Game>(context, listen: true);
    var tileColor = gamedata.colors[index];
    var boardElement = gamedata.getBoardElement(index);

    return InkWell(
      onTap: () {
        boardElement.setClickedStatus(true);
        updateParentWidget();
        // Getting the game status
        // -1 -> Game over, 0 -> Only one life left, 1 -> Can contiue without issue.
        var stats = gamedata.checkStatus(index);
        if (stats == 1) {
          if (gamedata.hiScore < gamedata.currScore) {
            gamedata.setHiScore(gamedata.currScore);
          }
          if (gamedata.didWon()) {
            Overlay.of(context).insert(gameWon);
          }
        } else if (stats == 0) {
          if (gamedata.hiScore < gamedata.currScore) {
            gamedata.setHiScore(gamedata.currScore);
          }
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Only one life left..."),
          ));
          if (gamedata.didWon()) {
            Overlay.of(context).insert(gameWon);
          }
        } else if (stats == -1) {
          Overlay.of(context).insert(gameOver);
        }
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: tileColor,
        ),
        child: const Center(
            child: Text(
          "🫣",
          style: TextStyle(fontSize: 30),
        )),
      ),
    );
  }

// Game Over overlay...
  static final OverlayEntry gameOver = OverlayEntry(
    builder: (BuildContext context) {
      return Positioned(
        child: Material(
          child: Column(
            children: [
              const Spacer(),
              const Text(
                "🥺",
                style: TextStyle(
                  fontSize: 40,
                ),
              ),
              const Text(
                "Level Failed... :(",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                onPressed: () {
                  // Resetting the game status.
                  Provider.of<Game>(context, listen: false).restart();
                  // going back to the home screen.
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil('/home', (route) => false);
                  // Exiting the overlay.
                  gameOver.remove();
                },
                child: Container(
                  decoration: BoxDecoration(
                      gradient: const LinearGradient(
                          begin: Alignment.bottomCenter,
                          colors: [
                            Colors.blue,
                            Color.fromARGB(255, 158, 117, 247),
                          ]),
                      borderRadius: BorderRadius.circular(15)),
                  child: const Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 12.0, horizontal: 20),
                    child: Text(
                      "Return to home page",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      );
    },
  );

  // Game Won Overlay
  static final OverlayEntry gameWon = OverlayEntry(
    builder: (BuildContext context) {
      return Positioned(
        child: Material(
          child: Column(
            children: <Widget>[
              const Spacer(),
              const Text(
                "✨🥳✨",
                style: TextStyle(
                  fontSize: 40,
                ),
              ),
              const Text(
                "You Won",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                onPressed: () {
                  // Resetting the game status.
                  Provider.of<Game>(context, listen: false).restart();
                  // going back to the home screen.
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil('/home', (route) => false);
                  // Exiting the overlay.
                  gameWon.remove();
                },
                child: Container(
                  decoration: BoxDecoration(
                      gradient: const LinearGradient(
                          begin: Alignment.bottomCenter,
                          colors: [
                            Colors.blue,
                            Color.fromARGB(255, 158, 117, 247),
                          ]),
                      borderRadius: BorderRadius.circular(15)),
                  child: const Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 12.0, horizontal: 20),
                    child: Text(
                      "Return to home page",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      );
    },
  );
}
