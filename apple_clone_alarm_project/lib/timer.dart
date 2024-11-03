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
  // List of items to display in the ListWheelScrollView
  final List<String> items = ['Hello', 'World', 'Flutter', 'Loop'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          _buildHeader(),
          const SizedBox(height: 100),
          _buildTimersInfo(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Edit',
            style: TextStyle(color: Colors.orange[300], fontSize: 16),
          ),
          const Text('Timers', style: TextStyle(color: Colors.white, fontSize: 16)),
          const SizedBox(height: 10, width: 50)
        ],
      ),
    );
  }

  Widget _buildTimersInfo() {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Centered background behind the magnified item only
        Container(
          width: 350,  // Adjust width to match magnified item width
          height: 50,
          decoration: BoxDecoration(
            color: Colors.grey[800],
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        // The scrollable list
        SizedBox(
          height: 130,
          child: ListWheelScrollView.useDelegate(
            diameterRatio: 1.5,
            itemExtent: 42,
            physics: const FixedExtentScrollPhysics(),
            useMagnifier: true,
            magnification: 1.5,
            childDelegate: ListWheelChildLoopingListDelegate(
              children: [Text('Hello',
                style: TextStyle(color: Colors.white, fontSize: 16),
              )]
            ),
          ),
        ),
      ],
    );
  }

  // Widget _buildTimersList() {}
}
