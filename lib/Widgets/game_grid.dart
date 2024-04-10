import 'package:expose_game/Provider/game.dart';
import 'package:expose_game/Widgets/click_tile.dart';
import 'package:expose_game/Widgets/number_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GameGrid extends StatefulWidget {
  const GameGrid({super.key});

  @override
  State<GameGrid> createState() => _GameGridState();
}

class _GameGridState extends State<GameGrid> {
  @override
  Widget build(BuildContext context) {
    var gamedata = Provider.of<Game>(context, listen: true);
    var gameBoard = gamedata.getBoard;
    var gameGrids = gamedata.getGrids;
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      itemCount: gameGrids * gameGrids,
      itemBuilder: (context, index) {
        return ChangeNotifierProvider.value(
          value: gameBoard[index],
          child: gameBoard[index].clicked ? NumberTile() : ClickTile(),
        );
      },
    );
    ;
  }
}
