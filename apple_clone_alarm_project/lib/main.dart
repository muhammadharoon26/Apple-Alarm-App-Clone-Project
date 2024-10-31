import 'package:flutter/material.dart';
import 'package:apple_clone_alarm_project/world_clock.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      home: WorldClock(), // Replace with the main widget from world_clock.dart
    );
  }
}
