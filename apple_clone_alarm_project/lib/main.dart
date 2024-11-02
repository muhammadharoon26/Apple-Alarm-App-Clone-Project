import 'package:flutter/material.dart';
import 'package:apple_clone_alarm_project/world_clock_test.dart';
import 'package:apple_clone_alarm_project/alarm.dart';
import 'package:apple_clone_alarm_project/timer.dart';
import 'package:apple_clone_alarm_project/stopwatch.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Apple Clone Alarm Project',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final PageController _controller = PageController(initialPage: 0);
  int _selectedIndex = 0; // Track the selected index

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        scrollDirection: Axis.horizontal,
        controller: _controller,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: const [
          WorldClock(),
          AlarmPage(),
          // StopWatchPage(),
          MyStopwatch(),
          TimersPage(),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: const Icon(FontAwesomeIcons.globe),
              onPressed: () {
                _controller.animateToPage(0,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.ease);
              },
              color: _selectedIndex == 0
                  ? const Color.fromARGB(255, 226, 168, 31)
                  : Colors.grey,
              // color: color?Color.fromARGB(255, 226, 168, 31):
            ),
            IconButton(
              icon: const Icon(Icons.alarm),
              onPressed: () {
                _controller.animateToPage(1,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.ease);
              },
              color: _selectedIndex == 1
                  ? const Color.fromARGB(255, 226, 168, 31)
                  : Colors.grey,
            ),
            IconButton(
              icon: const Icon(Icons.timer),
              onPressed: () {
                _controller.animateToPage(2,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.ease);
              },
              color: _selectedIndex == 2
                  ? const Color.fromARGB(255, 226, 168, 31)
                  : Colors.grey,
            ),
            IconButton(
              icon: const Icon(Icons.schedule),
              onPressed: () {
                _controller.animateToPage(3,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.ease);
              },
              color: _selectedIndex == 3
                  ? const Color.fromARGB(255, 226, 168, 31)
                  : Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
