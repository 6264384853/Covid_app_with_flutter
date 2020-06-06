import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home_scrren.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Covid',
      theme: ThemeData(
        primaryColor: Color(0xFF202C3B),
      ),
      home: MyHomePage(),
    );
  }
}
