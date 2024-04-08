import 'dart:async';

import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // time out after 3 secs and shows the home screen of the app.
    // Timer(const Duration(seconds: 3), () {
    //   Navigator.of(context).pushReplacementNamed('/home');
    // });

    // contents of the splash screen.
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            children: [
              const Spacer(),
              Image.asset(
                'lib/Assets/images/splash_image.jpg',
                height: 250,
                width: 250,
              ),
              GradientText("Expose Game",
                  style: const TextStyle(
                    fontSize: 22.5,
                    fontFamily: "Roboto Sans",
                    fontWeight: FontWeight.bold,
                  ),
                  colors: const [
                    Colors.blue,
                    Colors.red,
                  ]),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
