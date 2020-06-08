import 'package:flutter/material.dart';
import 'package:animated_splash/animated_splash.dart';

import 'home_scrren.dart';

void main() {
  Function duringSplash = () {
    print('Something background process');
    int a = 123 + 23;
    print(a);

    if (a > 100)
      return 1;
    else
      return 2;
  };

  Map<int, Widget> op = {1: MyHomePage()};

  runApp(MaterialApp(
    theme: ThemeData(
        primaryColor: Color(0xFF202C3B)
    ),
    home: AnimatedSplash(
      imagePath: 'assets/flutter.png',
      home: MyHomePage(),
      customFunction: duringSplash,
      duration: 2500,
      type: AnimatedSplashType.BackgroundProcess,
      outputAndHome: op,
    ),
  ));
}

