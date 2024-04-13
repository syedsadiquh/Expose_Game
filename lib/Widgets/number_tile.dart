import 'package:expose_game/Provider/game.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NumberTile extends StatelessWidget {
  late final index;
  NumberTile(int indx, {super.key}) {
    index = indx;
  }

  @override
  Widget build(BuildContext context) {
    var gamedata = Provider.of<Game>(context, listen: true);
    var tileColor = gamedata.colors[index];
    var tileNumber = gamedata.getBoard[index].tileNumber;
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: tileColor,
      ),
      child: Center(
          child: Text(
        tileNumber.toString(),
        style: TextStyle(fontSize: 30),
      )),
    );
  }
}
