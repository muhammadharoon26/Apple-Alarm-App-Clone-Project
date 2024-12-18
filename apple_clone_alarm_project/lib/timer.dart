import 'package:flutter/material.dart';

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
      home: TimersPage(),
    );
  }
}

class TimersPage extends StatelessWidget {
  const TimersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const TimersPageState();
  }
}

class TimersPageState extends StatefulWidget {
  const TimersPageState({super.key});

  @override
  State<TimersPageState> createState() => _TimersPageState();
}

class _TimersPageState extends State<TimersPageState> {
  // Dummy data for hours, minutes, and seconds
  final List<String> hours = List.generate(13, (index) => '$index hours');
  final List<String> minutes = List.generate(60, (index) => '$index min');
  final List<String> seconds = List.generate(60, (index) => '$index sec');

  void _startTimer() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Timers'),
        backgroundColor: Colors.black,
      ),
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Single gray background behind magnified items
          const SizedBox(
            height: 100,
          ),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width *
                  0.9, // Adjust width as needed
              height: 100, // Adjust height to match magnified area
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(8),
              ),
              child: SizedBox(
                width: MediaQuery.of(context).size.width *
                    0.9, // Adjust width as needed
                height: 200, // Adjust height as needed
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  // alignment: Alignment.center,
                  children: [
                    _buildTimeWheel(hours),
                    _buildTimeWheel(minutes),
                    _buildTimeWheel(seconds),
                    // SizedBox(height: 20,),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 50),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            TextButton(
                onPressed: _startTimer,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(170, 21, 81, 25),
                  padding: EdgeInsets.zero,
                  minimumSize: const Size(87, 87),
                  maximumSize: const Size(87, 87),
                  shape: const CircleBorder(),
                ),
                child: Text('Start')),
            TextButton(
                onPressed: _startTimer,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(170, 21, 81, 25),
                  padding: EdgeInsets.zero,
                  minimumSize: const Size(87, 87),
                  maximumSize: const Size(87, 87),
                  shape: const CircleBorder(),
                ),
                child: Text('Cancel')),
          ])
          // Row of time wheels
        ],
      ),
    );
  }

  Widget _buildTimeWheel(List<String> items) {
    return SizedBox(
      width: 90, // Adjust width to match the wheel's width
      child: ListWheelScrollView.useDelegate(
        diameterRatio: 2.0,
        itemExtent: 42,
        physics: const FixedExtentScrollPhysics(),
        useMagnifier: true,
        magnification: 1.5,
        childDelegate: ListWheelChildLoopingListDelegate(
          children: items
              .map((item) => Center(
                    child: Text(
                      item,
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }

  // Widget _buildTimersList() {}
}