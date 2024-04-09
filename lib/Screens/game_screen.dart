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
              ],
            ),
            // Game Grid below
          ],
        ),
      ),
    );
  }
}
