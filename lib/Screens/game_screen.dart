import 'package:expose_game/Widgets/game_grid.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/game.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  Widget build(BuildContext context) {
    var game = Provider.of<Game>(context, listen: true);
    var currScore = game.score;
    var livesLeft = game.getLives;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Game Time",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                const SizedBox(
                  height: 50,
                  width: 25,
                ),
                const Text(
                  "Score : ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Text(
                  currScore.toString(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const Spacer(),
                const Text(
                  "Lives Left : ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Text(
                  livesLeft.toString(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  height: 50,
                  width: 25,
                ),
              ],
            ),
            // Game Grid below
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.7,
              child: const GameGrid(),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            // Restart button
            MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              onPressed: () {
                game.restart();
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
                  padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 20),
                  child: Text(
                    "Restart",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
