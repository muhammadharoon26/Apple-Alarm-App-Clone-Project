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
  final List<String> hours = List.generate(24, (index) => '$index hours');
  final List<String> minutes = List.generate(60, (index) => '$index min');
  final List<String> seconds = List.generate(60, (index) => '$index sec');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9, // Adjust width as needed
          height: 100, // Adjust height as needed
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildTimeWheel(hours),
              _buildTimeWheel(minutes),
              _buildTimeWheel(seconds),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTimeWheel(List<String> items) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Gray background centered behind the magnified item
        Container(
          width: 90, // Adjust width to match the wheel's width
          height: 50, // Adjust height as needed
          decoration: BoxDecoration(
            color: Colors.grey[800],
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        // Scrollable list
        SizedBox(
          width: 90, // Adjust width to match the wheel's width
          child: ListWheelScrollView.useDelegate(
            diameterRatio: 2.0,
            itemExtent: 42,
            physics: const FixedExtentScrollPhysics(),
            useMagnifier: true,
            magnification: 1.5,
            childDelegate: ListWheelChildLoopingListDelegate(
              children: items.map((item) => Center(
                child: Text(
                  item,
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
              )).toList(),
            ),
          ),
        ),
      ],
    );
  }


  // Widget _buildTimersList() {}
}
