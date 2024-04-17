import 'package:expose_game/Provider/game.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    final game = Provider.of<Game>(context, listen: true);
    final hiScore = game.hiScore;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: GradientText("Expose It!",
              style: const TextStyle(
                fontSize: 25.5,
                fontFamily: "Roboto Sans",
                fontWeight: FontWeight.bold,
              ),
              colors: const [
                Colors.blue,
                Colors.red,
              ]),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        backgroundColor: Colors.white,
        body: Column(
          children: [
            // High Score Text:
            SizedBox(
              height: 20,
              width: mediaQueryData.size.width - 50,
              child: Row(
                children: [
                  const Spacer(),
                  const Text(
                    "Hi Score :",
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    " $hiScore",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  )
                ],
              ),
            ),
            Image.asset(
              "lib/Assets/images/start.jpg",
              height: mediaQueryData.size.height / 1.5,
              width: mediaQueryData.size.width / 1.5,
            ),
            Center(
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                onPressed: () => {Navigator.of(context).pushNamed('/play')},
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
                      "Lets Begin!",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
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
