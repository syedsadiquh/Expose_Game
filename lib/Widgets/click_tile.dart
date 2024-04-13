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
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: tileColor,
        ),
        child: const Center(
            child: Text(
          "😁",
          style: TextStyle(fontSize: 30),
        )),
      ),
    );
  }
}
