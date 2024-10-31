import 'package:flutter/material.dart';
import 'package:apple_clone_alarm_project/world_clock.dart';
import 'package:apple_clone_alarm_project/alarm.dart';
import 'package:apple_clone_alarm_project/timer.dart';
import 'package:apple_clone_alarm_project/stopwatch.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Apple Clone Alarm Project',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final PageController _controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        scrollDirection: Axis.horizontal,
        controller: _controller,
        onPageChanged: (index) {
          setState(() {});
        },
        children: [
          WorldClock(),
          AlarmPage(),
          StopWatchPage(),
          TimerPage(),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: Icon(Icons.access_time),
              onPressed: () {
                _controller.animateToPage(0,
                    duration: Duration(milliseconds: 500), curve: Curves.ease);
              },
            ),
            IconButton(
              icon: Icon(Icons.alarm),
              onPressed: () {
                _controller.animateToPage(1,
                    duration: Duration(milliseconds: 500), curve: Curves.ease);
              },
            ),
            IconButton(
              icon: Icon(Icons.timer),
              onPressed: () {
                _controller.animateToPage(2,
                    duration: Duration(milliseconds: 500), curve: Curves.ease);
              },
            ),
            IconButton(
              icon: Icon(Icons.schedule),
              onPressed: () {
                _controller.animateToPage(3,
                    duration: Duration(milliseconds: 500), curve: Curves.ease);
              },
            ),
          ],
        ),
      ),
    );
  }
}
