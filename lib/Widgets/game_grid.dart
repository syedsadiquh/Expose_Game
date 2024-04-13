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
    var gameGrids = gamedata.getGrids;
    return GestureDetector(
      onTap: () {
        setState(() {});
      },
      child: GridView.builder(
        padding: const EdgeInsets.all(20),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          // TODO: Change this based on Difficulty... Can't put a dynamic value/variable in it.
          crossAxisCount: 3,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
        ),
        itemCount: gameGrids * gameGrids,
        itemBuilder: (context, index) {
          return ChangeNotifierProvider.value(
            value: gamedata.getBoardElement(index),
            child: gamedata.getBoardElement(index).clicked
                ? NumberTile(index)
                : ClickTile(index, updateWidget),
          );
        },
      ),
    );
  }

  void updateWidget() {
    setState(() {});
  }
}
