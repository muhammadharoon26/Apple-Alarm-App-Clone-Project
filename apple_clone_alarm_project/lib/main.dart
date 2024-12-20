import 'package:flutter/material.dart';
import 'package:apple_clone_alarm_project/views/widgets/world_clock.dart';
import 'package:apple_clone_alarm_project/views/widgets/alarm.dart';
import 'package:apple_clone_alarm_project/views/widgets/timer.dart';
import 'package:apple_clone_alarm_project/views/widgets/stopwatch.dart';
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
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final PageController _controller = PageController(initialPage: 0);
  int _selectedIndex = 0;

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
          MyStopwatch(),
          TimersPage(),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                _controller.animateToPage(0,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.ease);
                setState(() {
                  _selectedIndex = 0;
                });
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    FontAwesomeIcons.globe,
                    color: _selectedIndex == 0
                        ? const Color.fromARGB(255, 226, 168, 31)
                        : Colors.grey,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'World Clock',
                    style: TextStyle(
                      color: _selectedIndex == 0
                          ? const Color.fromARGB(255, 226, 168, 31)
                          : Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                _controller.animateToPage(1,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.ease);
                setState(() {
                  _selectedIndex = 1;
                });
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.alarm,
                    color: _selectedIndex == 1
                        ? const Color.fromARGB(255, 226, 168, 31)
                        : Colors.grey,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Alarm',
                    style: TextStyle(
                      color: _selectedIndex == 1
                          ? const Color.fromARGB(255, 226, 168, 31)
                          : Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                _controller.animateToPage(2,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.ease);
                setState(() {
                  _selectedIndex = 2;
                });
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.timer,
                    color: _selectedIndex == 2
                        ? const Color.fromARGB(255, 226, 168, 31)
                        : Colors.grey,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Stopwatch',
                    style: TextStyle(
                      color: _selectedIndex == 2
                          ? const Color.fromARGB(255, 226, 168, 31)
                          : Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                _controller.animateToPage(3,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.ease);
                setState(() {
                  _selectedIndex = 3;
                });
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.schedule,
                    color: _selectedIndex == 3
                        ? const Color.fromARGB(255, 226, 168, 31)
                        : Colors.grey,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Timers',
                    style: TextStyle(
                      color: _selectedIndex == 3
                          ? const Color.fromARGB(255, 226, 168, 31)
                          : Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
