import 'package:flutter/material.dart';
import 'package:mediator_pattern_demo_7/home/home_screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'MediatorPatternDemo7',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: HomeScreen());
  }
}
