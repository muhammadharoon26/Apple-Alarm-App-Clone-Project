import 'package:flutter/material.dart';
import 'package:apple_clone_alarm_project/world_clock.dart';

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

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WorldClock(),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              child: const Text('World Clock'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WorldClock()),
                );
              },
            ),
            ElevatedButton(
              child: const Text('Alarm'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AlarmPage()),
                );
              },
            ),
            ElevatedButton(
              child: const Text('Timer'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TimerPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class AlarmPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alarm'),
      ),
      body: const Center(
        child: Text('Alarm Page'),
      ),
    );
  }
}

class TimerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Timer'),
      ),
      body: const Center(
        child: Text('Timer Page'),
      ),
    );
  }
}