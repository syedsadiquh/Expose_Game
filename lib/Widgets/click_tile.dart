import 'package:expose_game/Provider/game.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ClickTile extends StatelessWidget {
  const ClickTile({super.key});

  @override
  Widget build(BuildContext context) {
    var gamedata = Provider.of<Game>(context, listen: true);
    
    return Container(
      child: Text("CT"),
    );
  }
}
